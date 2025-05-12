rg_name = {
  "rg1" = {
    name     = "rg-dev-001"
    location = "East US"
  }

}

vnet_name = {
  vnet1 = {
    name       = "vnet-dev-001"
    rgname     = "rg-dev-001"
    rglocation = "East US"
    cidr       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name     = "subnet-dev-001"
    vnetname = "vnet-dev-001"
    add_pre  = ["10.0.1.0/24"]
    rgname   = "rg-dev-001"
  }
}

nics = {
  nic1 = {
    name       = "nic-dev-001"
    rgname     = "rg-dev-001"
    rglocation = "East US"
    vnetname   = "vnet-dev-001"
    subnetname = "subnet-dev-001"
    subnet_key = "subnet1"
  }
}
