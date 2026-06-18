terraform {
    required_version = ">= 1.8.0"

    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.0"
      }
    }
}

provider "azurerm" {
  features {}

  subscription_id = "c32b2b74-fbd5-48b9-a211-3b00bffc0cdd"
}

