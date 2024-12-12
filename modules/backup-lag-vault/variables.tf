variable "region" {
  description = "Region where to deploy the resources"
  type        = string
}

variable "environment" {
  type        = string
  description = "The environment where to deploy the solution"
}

variable "cyberapp_principals" {
  type        = list(string)
  default     = []
  description = "target AWS account IDs for sharing the vault"
}

variable "max_retention_days" {
  type        = number
  default     = 365
  description = "maximum retention days of the backup vault data"
}

variable "min_retention_days" {
  type        = number
  default     = 30
  description = "minimum retention days of the backup vault data"
}

variable "enable_resource_sharing" {
  description = "Whether to enable resource sharing or not"
  type        = bool
  default     = true
}
