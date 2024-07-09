locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "anjali.mahida"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

resource "azurerm_postgresql_server" "db" {
  name                = "${var.humber_id}-postgresql"
  location            = var.location
  resource_group_name = var.resource_group_name
  administrator_login = "psqladminun"
  administrator_login_password = "H@Sh1CoR3!"
  sku_name            = "GP_Gen5_2"
  storage_mb          = 5120
  version             = "11"
  auto_grow_enabled   = true
  backup_retention_days = 7
  geo_redundant_backup_enabled = false
  public_network_access_enabled = false
  ssl_enforcement_enabled = true
  tags = local.common_tags
}
