output "password" {
 value = azurerm_linux_virtual_machine.vm-linux.admin_username
}
output "username" {
 value = azurerm_linux_virtual_machine.vm-linux.admin_password
}