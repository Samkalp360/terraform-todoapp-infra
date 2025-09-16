terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.44.0"
    }
  }
}

provider "azurerm" {
  features {}


  subscription_id = "51984565-3b14-41c7-900f-cf01ff601798"

}



resource "azurerm_resource_group" "rg" {
  name     = "rg01-${terraform.workspace}"
  location = "eastus"
  managed_by = "Mahendra"

}