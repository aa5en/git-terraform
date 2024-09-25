# Output the Key Vault ID
output "keyvault_id" {
  value = azurerm_key_vault.kv.id
}

output "kv_pass" {
  value = azurerm_key_vault_secret.vm_credentials.value
}