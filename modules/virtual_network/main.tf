resource "azurerm_virtual_network" "virtual_network_name" {
    name = var.vnetname
    location = var.rgloc
    resource_group_name = var.rgname
    address_space = var.adspace
  
}