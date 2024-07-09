locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "anjali.mahida"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

resource "azurerm_resource_group" "rg" {
  name      = "n9648-rg"
  location  = var.location

  tags = local.common_tags
}
