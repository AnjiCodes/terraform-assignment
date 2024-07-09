resource "azurerm_network_interface" "nic" {
  count = length(var.windows_names)

  name                = "${var.windows_names[count.index]}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.common_tags
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  count                 = length(var.windows_names)
  name                  = var.windows_names[count.index]
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  size                  = "Standard_B1ms"

  admin_username = "adminuser"
  admin_password = "P@ssw0rd1234!"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  tags = var.common_tags
}


resource "azurerm_public_ip" "windows_vm_pip" {
  count                = length(var.windows_names)
  name                 = "${var.windows_names[count.index]}-pip"
  location             = var.location
  resource_group_name  = var.resource_group_name
  allocation_method    = "Dynamic"

  tags = var.common_tags
}

