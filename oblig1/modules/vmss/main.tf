resource "azurerm_linux_virtual_machine_scale_set" "linux_vmss" {
  name                = var.vmssname
  resource_group_name = var.rgname
  location            = var.location
  sku                 = "Standard_F2"
  instances           = var.instances
  admin_username      = jsondecode(module.keyvault.vm_credentials)["username"]
  admin_password      = jsondecode(module.keyvault.vm_credentials)["password"]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "nic-vmss"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.internal.id
    }
  }
}