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

variable "vm_id" {
  description = "The ID of the virtual machine to attach the disks to"
  type        = string
}
