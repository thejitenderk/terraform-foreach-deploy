module "resource_group" {
  source   = "../../modules/resource_group"
  name     = var.rg_name
  location = var.location
}

module "vnet" {
  source              = "../../modules/virtual_network"
  depends_on          = [module.resource_group]
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.rg_name
}

module "subnets" {
  for_each             = var.subnets
  source               = "../../modules/subnet"
  depends_on           = [module.vnet]
  name                 = each.value.name
  address_prefixes     = each.value.address_prefixes
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

module "nics" {
  for_each            = var.nics
  source              = "../../modules/network_interface"
  depends_on          = [module.subnets]
  name                = each.value.name
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = module.subnets[each.value.subnet_key].id
}

module "vms" {
  for_each             = var.vms
  source               = "../../modules/virtual_machine"
  depends_on           = [module.nics]
  name                 = each.value.name
  location             = var.location
  resource_group_name  = var.rg_name
  size                 = each.value.size
  admin_username       = each.value.admin_user
  admin_password       = each.value.admin_pass
  network_interface_id = module.nics[each.value.nic_key].id
}
