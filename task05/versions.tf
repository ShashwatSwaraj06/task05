terraform {
  required_version = ">= 1.5.7" # Updated per test case expectations

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.110.0, < 4.0.0" # Updated per test case expectations
    }
  }
}

provider "azurerm" {
  features {}
}