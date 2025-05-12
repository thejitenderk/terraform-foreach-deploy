resource "azurerm_network_interface" "network_interface" {
  for_each            = var.nics
  name                = each.value.name
  location            = each.value.rglocation
  resource_group_name = each.value.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_data[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
