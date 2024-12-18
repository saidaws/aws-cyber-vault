locals {
  tags = {
    app_name    = var.app_name
    environment = var.environment
    GitRepo     = "https://github.com/ExxonMobil/backup-lag-vault"
  }
}
