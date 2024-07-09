output "windows_vm_hostname" {
  value = azurerm_windows_virtual_machine.windows_vm[0].computer_name
}

output "windows_vm_private_ip" {
  value = azurerm_windows_virtual_machine.windows_vm[0].private_ip_address
}

output "windows_vm_id" {
  value = azurerm_windows_virtual_machine.windows_vm[0].id
}

output "windows_vm_fqdn" {
  value = [for i in range(length(var.windows_names)) : azurerm_public_ip.windows_vm_pip[i].fqdn]
}

output "windows_vm_public_ip" {
  value = [for i in range(length(var.windows_names)) : azurerm_public_ip.windows_vm_pip[i].ip_address]
}
