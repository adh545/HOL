terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {
    organization = "ACG-Terraform-Labs-123"

    workspaces {
      name = "HOL"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-48d95198-hands-on-with-terraform-on-azure"
  location = "East US"
}

module "securestorage" {
  source               = "app.terraform.io/ACG-Terraform-Labs-123/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "storageacct20230404"
}