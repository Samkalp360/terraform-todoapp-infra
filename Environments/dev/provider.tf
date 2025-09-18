terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.41.0"
        }
    }
     backend "azurerm" {
      resource_group_name = ""
      storage_account_name = ""
      container_name = ""
      key = 
    }
}

    
provider "azurerm" {
    features{}
    subscription_id = "51984565-3b14-41c7-900f-cf01ff601798"

}
