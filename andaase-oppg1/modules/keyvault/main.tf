data "azurerm_client_config" "current" {}

resource "random_string" "random_string" {
  length  = 8
  special = false
  upper = false
}

resource "random_password" "random_password" {
  length  = 16
  special = true
}

resource "azurerm_key_vault" "kv" {
  name                        = "${lower(var.kvname)}${random_string.random_string.result}"
  location                    = var.location
  resource_group_name         = var.rgname
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get","List","Create","Delete"
    ]

    secret_permissions = [
      "Set",
      "Get",
      "List",
      "Delete",
      "Purge",
      "Recover"
    ]

    storage_permissions = [
      "Get","Set","List"
    ]
  }
}

resource "azurerm_key_vault_secret" "sa_accesskey" {
  name         = var.sa_accesskey_name
  value        = var.sa_id
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "vm_credentials" {
  name         = var.vmcredentials
  value        = jsonencode({
    username = var.vm_username,
    password = random_password.random_password.result
  })
  key_vault_id = azurerm_key_vault.kv.id
}

