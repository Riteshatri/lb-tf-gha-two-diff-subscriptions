terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
}

provider "azurerm" {
  features {}
    # subscription_id = ""
  use_oidc = true
}

terraform {
  backend "azurerm" {}
}