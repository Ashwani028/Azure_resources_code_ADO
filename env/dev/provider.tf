terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.56.0"
    }
  }
}

provider "azurerm" {
  # Configuration options

  features {}
  subscription_id = "635e9286-14d1-435f-b7e1-af1ebf689f4e"
} 