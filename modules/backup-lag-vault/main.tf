resource "aws_backup_logically_air_gapped_vault" "this" {
  name               = "${var.app_name}-lag-vault"
  max_retention_days = var.max_retention_days # (>= member backup vault)
  min_retention_days = var.min_retention_days # (<= member backup vault)
}

resource "aws_backup_vault_policy" "this" {
  backup_vault_name = aws_backup_logically_air_gapped_vault.this.name
  policy = jsonencode(
    {
      Statement = [
        {
          Action = "backup:CopyIntoBackupVault"
          Effect = "Allow"
          Principal = {
            AWS = [
              for principal in var.cyberapp_principals : principal
            ]
          }
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
}
