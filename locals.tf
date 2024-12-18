locals {
  tags = {
    app_name    = var.app_name
    environment = var.environment
    GitRepo     = "https://github.com/EMOrg-Prd/aws-cyber-vault"
  }
}
