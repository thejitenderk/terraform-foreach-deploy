resource "azurerm_virtual_network" "virtual_network" {
  for_each = var.vnets
  name                = each.value.name
  address_space       = each.value.cidr
  location            = each.value.rglocation
  resource_group_name = each.value.rgname
}
