resource "azurerm_resource_group" "rg" {
  name     = "${var.humber_id}-rg"
  location = var.location
}

resource "azurerm_public_ip" "lb_public_ip" {
  name                = "${var.humber_id}-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "anjali.mahida"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

module "resource_group" {
  source    = "./modules/rgroup-n01579648"
  humber_id = var.humber_id
  location  = var.location
}

module "common" {
  source              = "./modules/common-n01579648"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}

module "network" {
  source              = "./modules/network-n01579648"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}

module "vmlinux" {
  source              = "./modules/vmlinux-n01579648"
  linux_names         = var.linux_names
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.network.subnet_id
  storage_account_uri = module.common.storage_account_uri
  common_tags         = local.common_tags
  ssh_private_key_path = var.ssh_private_key_path
  ssh_public_key_path = var.ssh_public_key_path
}

module "vmwindows" {
  source              = "./modules/vmwindows-n01579648"
  windows_names       = var.windows_names
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.network.subnet_id
  storage_account_uri = module.common.storage_account_uri
  common_tags         = local.common_tags
}

module "datadisk" {
  source              = "./modules/datadisk-n01579648"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  vm_id               = module.vmwindows.windows_vm_id
}

module "loadbalancer" {
  source              = "./modules/loadbalancer-n01579648"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  linux_vm_ids        = module.vmlinux.linux_vm_hostnames
  public_ip_id        = azurerm_public_ip.lb_public_ip.id
}

module "database" {
  source              = "./modules/database-n01579648"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}
