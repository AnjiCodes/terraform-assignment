variable "public_ip_id" {
  description = "The ID of the public IP to use for the load balancer"
  type        = string
}

variable "humber_id" {
  description = "The unique identifier for Humber student"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "linux_vm_ids" {
  description = "IDs of the Linux VMs to include in the backend pool"
  type        = list(string)
}
