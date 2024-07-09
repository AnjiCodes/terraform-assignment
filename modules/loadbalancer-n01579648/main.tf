locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "anjali.mahida"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

resource "azurerm_lb" "lb" {
  name                = "${var.humber_id}-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = var.public_ip_id
  }

  tags = local.common_tags
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
  name            = "BackendAddressPool"
  loadbalancer_id = azurerm_lb.lb.id
}
