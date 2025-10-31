terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ran_rg"
    storage_account_name = "ranjeetstg1234"
    container_name       = "ranjeetcontainer"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e088c65c-826b-4b26-8075-ab650aa85523"
}