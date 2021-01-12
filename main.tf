terraform {
  required_version = ">= 0.13.0"
  required_providers {
    sendgrid = {
      source  = "Trois-Six/sendgrid"
      version = ">= 0.1.6"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }
}

locals {
  common_labels = merge(var.labels, {
    "app.kubernetes.io/managed-by" = "terraform"
    "app.kubernetes.io/component"  = "sendgrid"
  })
}

resource "sendgrid_api_key" "sendgrid" {
  name   = var.object_prefix
  scopes = ["mail.send", "sender_verification_eligible", "2fa_required"]
}

resource "kubernetes_secret" "sendgrid" {
  count = var.create_secret ? 1 : 0
  metadata {
    namespace = var.namespace
    name      = format("%s-%s", var.object_prefix, var.object_suffix)
    labels    = local.common_labels
  }
  data = {
    (var.secret_key) = sendgrid_api_key.sendgrid.api_key
  }
}
