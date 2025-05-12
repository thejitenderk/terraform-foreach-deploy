data "azurerm_subnet" "subnet_data" {
 for_each = var.nics
 name = each.value.subnetname
 virtual_network_name = each.value.vnetname
 resource_group_name = each.value.rgname
}
