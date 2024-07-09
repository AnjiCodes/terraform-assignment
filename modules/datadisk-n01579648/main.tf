locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "anjali.mahida"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

resource "azurerm_managed_disk" "data_disk" {
  count                = 2 
  name                 = "${var.humber_id}-datadisk-${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags                 = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach" {
  count              = 2 
  managed_disk_id    = azurerm_managed_disk.data_disk[count.index].id
  virtual_machine_id = var.vm_id
  lun                = count.index
  caching            = "ReadOnly"
}
