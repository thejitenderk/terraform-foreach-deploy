rg_name = {
  rg1 = {
    name     = "rg-foreach"
    location = "East US"
  }
}

vnetname = {
  vnet1 = {
    name    = "foreach-vnet"
    rgname  = "rg-foreach"
    rgloc   = "East US"
    adspace = ["10.0.0.0/16"]
  }
}

subnet = {
  frontsubnet = {
    name     = "frontend-subnet"
    vnet     = "foreach-vnet"
    rgname   = "rg-foreach"
    adprefix = ["10.0.0.0/24"]
  }
  backsubnet = {
    name     = "backend-subnet"
    vnet     = "foreach-vnet"
    rgname   = "rg-foreach"
    adprefix = ["10.0.1.0/24"]
  }
}

nic = {
  nic1 = {
    name       = "front-nic"
    rgloc      = "East US"
    rgname     = "rg-foreach"
    subnetname = "frontend-subnet"
    vnet = "rg-foreach"

  }
  nic2 = {
    name       = "back-nic"
    rgloc      = "East US"
    rgname     = "rg-foreach"
    subnetname = "backend-subnet"
    vnet = "rg-foreach"

  }
}

vmname = {
  vm1 = {
    name      = "frontvmdev01"
    rgname    = "rg-foreach"
    rgloc     = "East US"
    vmsize    = "Standard_B1s" # 👈 was 'size' before, changed to 'vmsize'
    adminuser = "azureadmin"
    adminpwd  = "Iwant2learn2025" # 👈 was 'adminpwd' — keep it same
    nic       = "front-nic"
  }
  vm2 = {
    name      = "backvmdev01"
    rgname    = "rg-foreach"
    rgloc     = "East US"
    vmsize    = "Standard_B1s" # 👈 changed to match variable in module
    adminuser = "azureadmin"
    adminpwd  = "Iwant2learn2025"
    nic       = "back-nic"
  }
}
