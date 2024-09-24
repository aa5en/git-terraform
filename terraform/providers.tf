terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
    backend "azurerm" {
    resource_group_name = "aa-rg-backend-tfstate"
    storage_account_name = "aasabetfsg8dafp3yfl"
    container_name = "aatfstate"
    key = "rg.terraform.tfstate"
  }
}
provider "azurerm" {
  # Configuration options
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    
  }
  subscription_id = var.subscription_id
}