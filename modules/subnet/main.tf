resource "azurerm_subnet" "subnet" {
    name = var.subname
    virtual_network_name = var.vnetname
    address_prefixes = var.apre
    resource_group_name = var.rgname

  
}