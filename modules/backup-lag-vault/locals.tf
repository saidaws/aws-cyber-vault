locals {
  account_id = data.aws_caller_identity.this.account_id
  region     = data.aws_region.this.name

  tags = {
    environment = var.environment
    GitRepo     = "https://github.com/ExxonMobil/backup-lag-vault"
  }
}
