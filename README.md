# gd-child-keyvault: Azure Key Vault Terraform Module

This child module creates and manages Azure Key Vaults with RBAC authorization, soft delete protection, configurable purge protection, and network ACL support.

Part of the **Azure Parent–Child Infrastructure Architecture** under GitHub account `gauravdubey5`.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `key_vaults` | Mapping of Key Vault configurations (`name`, `location`, `resource_group_name`, optional `sku_name`, `rbac_authorization_enabled`, `network_acls`, etc.) | `any` | `{}` | yes |

## Outputs

| Name | Description |
|------|-------------|
| `key_vaults` | The created Azure Key Vaults |
