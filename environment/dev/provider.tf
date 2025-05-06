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
  subscription_id = "2178b722-5baa-4418-8bc9-3fcb9cd14fed"

}