terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "8a792a96-9bd0-41cd-bb14-cbed745e3244"
}
