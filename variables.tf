variable "object_prefix" {
  type        = string
  description = "Unique name to prefix all objects with"
}

variable "namespace" {
  type        = string
  description = "Environment that the application will be deployed in"
}

variable "labels" {
  type        = map(string)
  description = "Labels to add to secret"
  default     = {}
}

variable "secret_key" {
  type        = string
  description = "Key name that the smtp password is stored in"
  default     = "smtp-password"
}

variable "object_suffix" {
  type        = string
  description = "Suffix that will be added to the end of object_prefix"
  default     = "smtp"
}

variable "create_secret" {
  type        = bool
  description = "Create Kubernetes secret and store the password in it"
  default     = true
}
