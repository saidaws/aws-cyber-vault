resource "aws_ram_resource_share" "this" {
  count                     = var.enable_resource_sharing ? 1 : 0
  allow_external_principals = true
  name                      = "${var.environment}-lag-vault-share"
  permission_arns = [
    "arn:aws:ram::aws:permission/AWSRAMPermissionBackupVaultReadOnly",
  ]
}

resource "aws_ram_resource_association" "this" {
  count              = var.enable_resource_sharing ? 1 : 0
  resource_arn       = aws_backup_logically_air_gapped_vault.this.arn
  resource_share_arn = aws_ram_resource_share.this[0].arn
}

resource "aws_ram_principal_association" "this" {
  for_each           = var.enable_resource_sharing ? toset(var.cyberapp_principals) : []
  principal          = each.value
  resource_share_arn = aws_ram_resource_share.this[0].arn
}
