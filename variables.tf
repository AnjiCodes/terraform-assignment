variable "humber_id" {
  description = "Humber ID"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "linux_names" {
  description = "List of names for Linux VMs"
  type        = list(string)
}

variable "windows_names" {
  description = "List of names for Windows VMs"
  type        = list(string)
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "storage_account_uri" {
  description = "URI of the storage account for boot diagnostics"
  type        = string
}

variable "public_ip_id" {
  description = "ID of the public IP address"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}
