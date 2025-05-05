location           = "East US"
rg_name            = "demo-rg"
vnet_name          = "demo-vnet"
vnet_address_space = ["10.0.0.0/16"]

subnets = {
  front = {
    name             = "frontsubnet"
    address_prefixes = ["10.0.1.0/24"]
  }
  back = {
    name             = "backsubnet"
    address_prefixes = ["10.0.2.0/24"]
  }
}

nics = {
  nic1 = {
    name       = "nic-front"
    subnet_key = "front"
  }
  nic2 = {
    name       = "nic-back"
    subnet_key = "back"
  }
}

vms = {
  vm1 = {
    name       = "vm-front"
    nic_key    = "nic1"
    size       = "Standard_B1s"
    admin_user = "azureadmin"
    admin_pass = "Iwant2learn2025"
  }
  vm2 = {
    name       = "vm-back"
    nic_key    = "nic2"
    size       = "Standard_B1s"
    admin_user = "azureadmin"
    admin_pass = "Iwant2learn2025"
  }
}
