output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "log_analytics_workspace_name" {
  value = module.common.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value = module.common.recovery_services_vault_name
}

output "storage_account_name" {
  value = module.common.storage_account_name
}

output "linux_vm_hostnames" {
  value = module.vmlinux.linux_vm_hostnames
}

output "linux_vm_fqdns" {
  value = module.vmlinux.linux_vm_fqdns
}

output "linux_vm_private_ips" {
  value = module.vmlinux.linux_vm_private_ips
}

output "linux_vm_public_ips" {
  value = module.vmlinux.linux_vm_public_ips
}

output "windows_vm_hostname" {
  value = module.vmwindows.windows_vm_hostname
}

output "windows_vm_fqdn" {
  value = module.vmwindows.windows_vm_fqdn
}

output "windows_vm_private_ip" {
  value = module.vmwindows.windows_vm_private_ip
}

output "windows_vm_public_ip" {
  value = module.vmwindows.windows_vm_public_ip
}

output "data_disk_names" {
  value = module.datadisk.data_disk_names
}

output "load_balancer_name" {
  value = module.loadbalancer.load_balancer_name
}

output "database_name" {
  value = module.database.database_name
}

