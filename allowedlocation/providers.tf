terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
  /*backend "azurerm" {
    resource_group_name = "tfstateRG01"
    storage_account_name = "tfstate011976173747"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }*/
}

provider "azurerm" {
  subscription_id = var.SubscriptionID
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}



