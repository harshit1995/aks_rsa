terraform {
  backend "azurerm" {
    resource_group_name  = "aks-resources"
    storage_account_name = "rsaterrastate" 
    container_name       = "tfstate"
    key                  = "aks.tfstate" 
  }
}