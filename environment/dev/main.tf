module "rgs" {
  source = "../../modules/resource_group"
  rgname = var.rg_name

}

module "vnets" {
  source     = "../../modules/virtual_network"
  depends_on = [module.rgs]
  vnets      = var.vnet_name
}


module "subnets" {
  source     = "../../modules/subnet"
  depends_on = [module.vnets]
  subnets    = var.subnets

}

module "nics" {
  source     = "../../modules/network_interface"
  depends_on = [module.subnets]
  nics       = var.nics

}




