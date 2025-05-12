resource "azurerm_resource_group" "resource_group" {
  for_each = var.rgname
  name     = each.value.name
  location = each.value.location
}
