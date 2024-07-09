output "data_disk_names" {
  value = { for name, disk in azurerm_managed_disk.data_disk : name => disk.name }
}
