variable "environment" {
  type        = string
  description = "Name of the environment"
}

variable "app_name" {
  type        = string
  default     = "cyber-recovery"
  description = "The name of the solution app"
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
