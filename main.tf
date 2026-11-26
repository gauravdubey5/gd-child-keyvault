resource "azurerm_key_vault" "key_vaults" {
  for_each                        = var.key_vaults
  name                            = each.value.name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  tenant_id                       = lookup(each.value, "tenant_id", data.azurerm_client_config.current.tenant_id)
  sku_name                        = lookup(each.value, "sku_name", "standard")
  enabled_for_disk_encryption     = lookup(each.value, "enabled_for_disk_encryption", true)
  enabled_for_deployment          = lookup(each.value, "enabled_for_deployment", false)
  enabled_for_template_deployment = lookup(each.value, "enabled_for_template_deployment", false)
  soft_delete_retention_days      = lookup(each.value, "soft_delete_retention_days", 7)
  purge_protection_enabled        = lookup(each.value, "purge_protection_enabled", false)
  rbac_authorization_enabled      = lookup(each.value, "rbac_authorization_enabled", true)
  public_network_access_enabled   = lookup(each.value, "public_network_access_enabled", true)

  dynamic "network_acls" {
    for_each = lookup(each.value, "network_acls", null) != null ? [each.value.network_acls] : []
    content {
      bypass                     = lookup(network_acls.value, "bypass", "AzureServices")
      default_action             = lookup(network_acls.value, "default_action", "Deny")
      ip_rules                   = lookup(network_acls.value, "ip_rules", [])
      virtual_network_subnet_ids = lookup(network_acls.value, "virtual_network_subnet_ids", [])
    }
  }

  tags = lookup(each.value, "tags", {})
}
