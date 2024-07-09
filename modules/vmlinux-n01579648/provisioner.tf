resource "null_resource" "linux_provisioner" {
  count = length(var.linux_names)

  connection {
    type        = "ssh"
    user        = "adminuser"
    private_key = file(var.ssh_private_key_path)
    host        = element(azurerm_public_ip.linux_vm_pip[*].ip_address, count.index)
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${azurerm_linux_virtual_machine.linux_vm[count.index].name}",
    ]
  }
}
