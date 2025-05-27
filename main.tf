terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {
    organization = "dr3wlab"

    workspaces {
      name = "handson"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "28e1e42a-4438-4c30-9a5f-7d7b488fd883"
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-85b2f083-hands-on-with-terraform-on-azure"
  location = "South Central US"
}

module "securestorage2" {
  source               = "app.terraform.io/dr3wlab/securestorage2/azurerm"
  version              = "1.0.2"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "stgshsdkfunique"
}
