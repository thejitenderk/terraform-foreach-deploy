terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "ecomstorageaccountdev"
    container_name       = "tfstate"
    key                 = "dev.tfstate"
    
  }
}

provider "azurerm" {
  features {}
  

}