data "azurerm_subnet" "subnet" {
  name                 = var.subname
  virtual_network_name = var.vnetname
  resource_group_name  = var.rgname

}