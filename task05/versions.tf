terraform {
  required_version = ">= 1.5.0" # Adjust based on the Terraform version you're using

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.74.0" # Use a version that supports the required resources & features
    }
  }
}

provider "azurerm" {
  features {} # Default block required for azurerm provider
}