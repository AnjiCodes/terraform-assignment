locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "anjali.mahida"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.humber_id}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = local.common_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.humber_id}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.humber_id}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = local.common_tags
}

resource "azurerm_network_security_rule" "nsg_rule" {
  count                     = 4
  name                      = "${var.humber_id}-nsg-rule-${count.index}"
  priority                  = 100 + count.index
  direction                 = "Inbound"
  access                    = "Allow"
  protocol                  = "Tcp"
  source_port_range         = "*"
  destination_port_range    = ["22", "3389", "5985", "80"][count.index]
  source_address_prefix     = "*"
  destination_address_prefix = "*"
  resource_group_name       = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
