provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rsa-aks-rg"
  location = "West Europe"
}

module "aks" {
  source  = "Azure/aks/azurerm"
  version = "7.5.0"  # Use a stable version

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cluster_name        = "rsa-aks-cluster"
  prefix              = "rsa"
  node_count          = 1  
  vm_size             = "Standard_DS2_v2"
  os_disk_size_gb     = 30

 
  tags = {
    Project     = "RSA-K8"
  }
}

output "kube_config" {
  value     = module.aks.kube_config_raw
  sensitive = true
}