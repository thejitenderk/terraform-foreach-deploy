module "resource_group" {
  source   = "../../modules/resource_group"
  for_each = var.rg_name
  rgname   = each.value.name
  rgloc    = each.value.location

}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/virtual_network"
  for_each   = var.vnetname
  vnetname   = each.value.name
  rgname     = each.value.rgname
  rgloc      = each.value.rgloc
  adspace    = each.value.adspace

}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/subnet"
  for_each   = var.subnet
  subname    = each.value.name
  rgname     = each.value.rgname
  vnetname   = each.value.vnet
  apre       = each.value.adprefix


}

module "network_interface" {
  depends_on = [module.subnet]
  for_each   = var.nic
  source     = "../../modules/network_interface"

  nic       = each.value.name
  rgname    = each.value.rgname
  rgloc     = each.value.rgloc
  subname = each.value.subnetname
  vnetname = each.value.vnet
}

module "linux_virtual_machine" {
  source    = "../../modules/virtual_machine"
  for_each  = var.vmname
  vmname    = each.value.name
  rgname    = each.value.rgname
  rgloc     = each.value.rgloc
  vmsize    = each.value.vmsize
  adminuser = each.value.adminuser
  admimpwd  = each.value.adminpwd
  nic       = each.value.nic
}
