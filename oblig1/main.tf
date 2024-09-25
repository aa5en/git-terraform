resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

module "storageaccount" {
  source = "./modules/storageaccount"
  saname = var.sa_name
  scname = var.sc_name
  rgname = azurerm_resource_group.rg.name
}

module "keyvault" {
  source            = "./modules/keyvault"
  kvname            = var.kvname
  rgname            = azurerm_resource_group.rg.name
  sa_accesskey_name = var.sa_accesskey_name
  location          = var.location
  sa_id             = module.storageaccount.sa_id
  vm_username       = var.vm_username
  vmcredentials     = var.vmcredentials
}

module "networking" {
  source = "./modules/network"
  nsgname = var.nsgname
  rgname = azurerm_resource_group.rg.name
  location = var.location
  public_ip_name = var.public_ip_name
  subnetname = var.subnetname
  vnetname = var.vnetname
}

module "vm" {
  source = "./modules/vm"
  rgname = azurerm_resource_group.rg.name
  nicname = var.nicname
  nicipname = var.nicipname
  subnet_id = module.networking.subnet_id
  nsg_id = module.networking.nsg_id
  public_ip_id = module.networking.public_ip_id
  username = module.keyvault.vm_username
  password = module.keyvault.vm_password
  vmname = var.vmname
}