# Terraform Kubernetes SendGrid

This Terraform module sets up a SMTP provider that can be consumed by
applications. SendGrid is used as a SMTP relay.

## Usage

```
module "smtp" {
  source        = "ballj/sendgrid/kubernetes"
  version       = "~> 1.0"
  namespace     = "production"
  object_prefix = "myapp"
  labels        = {
    "app.kubernetes.io/part-of"  = "myapp"
  }
}
```

## Providers

This module uses the following Terraform providers:
 - [Trois-Six/sendgrid](https://registry.terraform.io/providers/Trois-Six/sendgrid/latest/docs)
 - [Kubernetes](https://registry.terraform.io/providers/hashicorp/kubernetes/latest)

## Variables

| Variable              | Required | Default          | Description                                        |
| --------------------- | -------- | -------          | -------------------------------------------------- |
| `object_prefix`       | Yes      | N/A              | Unique name to prefix all objects with             |
| `namespace`           | Yes      | N/A              | Kubernetes namespace to deploy ingress into        |
| `labels`              | No       | `{}`             | Labels to add to the secret resource               |
| `secret_key`          | No       | `smtp-password`  | Secret key that gets created                       |
| `object_suffix`       | No       | `object_suffix`  | Suffix to add to some objects created              |
| `create_secret`       | No       | `true`           | Create Kubernetes secret to store the password     |

## Outputs

| Output        | Description                                        |
| ------------- | -------------------------------------------------- |
| `hostname`    | Hostname of the smtp server                        |
| `port`        | Port for the SMTP server                           |
| `username`    | Username for the SMTP server                       |
| `secret_name` | Secret key that gets created                       |
| `secret_key`  | Key name containing the API key                    |
| `password`    | Password for the SMTP user                         |
