locals {
  region     = data.aws_region.this.name
  caller_arn = data.aws_caller_identity.this.arn

  # tags = {
  #   app_name    = var.app_name
  #   environment = var.environment
  #   GitRepo     = "https://github.com/EMOrg-Prd/aws-cyber-vault"
  # }
}
