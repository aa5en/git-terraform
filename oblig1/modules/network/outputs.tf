output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
output "public_ip_id" {
  value = azurerm_public_ip.public_ip.id
}

output "public_ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}