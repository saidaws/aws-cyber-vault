module "backup_lag_vault" {
  source                  = "./modules/backup-lag-vault"
  environment             = var.environment
  app_name                = var.app_name
  cyberapp_principals     = var.cyberapp_principals
  max_retention_days      = var.max_retention_days
  min_retention_days      = var.min_retention_days
  enable_resource_sharing = var.enable_resource_sharing
}
