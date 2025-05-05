resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
  name                = var.vmname
  resource_group_name = var.rgname
  location            = var.rgloc
  size                = var.vmsize
  admin_username      = var.adminuser
  admin_password =   var.admimpwd
  disable_password_authentication = false
  network_interface_ids = var.nic
  

 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}