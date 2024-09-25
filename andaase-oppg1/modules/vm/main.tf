


resource "azurerm_network_interface" "vm-nic" {
  name                = var.nicname
  location            = var.location
  resource_group_name = var.rgname
  

  ip_configuration {
    name                          = var.nicipname
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.public_ip_id
  }
}

resource "azurerm_network_interface_security_group_association" "pipnsg" {
  network_interface_id = azurerm_network_interface.vm-nic.id
  network_security_group_id = var.nsg_id
}

resource "azurerm_linux_virtual_machine" "vm-linux" {
  name                = var.vmname
  resource_group_name = var.rgname
  location            = var.location
  size                = var.vmsize
  admin_username      = var.username
  admin_password      = var.password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.vm-nic.id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vmpublisher
    offer     = var.vmoffer
    sku       = var.vmsku
    version   = var.vmversion
  }
}

