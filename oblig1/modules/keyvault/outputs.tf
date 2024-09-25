# Output the Key Vault ID
output "keyvault_id" {
  value = azurerm_key_vault.kv.id
}

output "vm_username" {
  value     = jsondecode(azurerm_key_vault_secret.vm_credentials.value)["username"]
  sensitive = true  # Marking as sensitive to avoid displaying in the console unless explicitly needed
}

# Output the password from the JSON encoded secret
output "vm_password" {
  value     = jsondecode(azurerm_key_vault_secret.vm_credentials.value)["password"]
  sensitive = true  # Marking as sensitive for security
}