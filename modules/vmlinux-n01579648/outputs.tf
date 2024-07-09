output "linux_vm_hostnames" {
  value = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.name]
}

output "linux_vm_public_ips" {
  value = { for name, ip in azurerm_public_ip.linux_vm_pip : name => ip.ip_address }
}

output "linux_vm_fqdns" {
  value = { for name, ip in azurerm_public_ip.linux_vm_pip : name => ip.fqdn }
}

output "linux_vm_private_ips" {
  value = { for name, nic in azurerm_network_interface.nic : name => nic.private_ip_address }
}
