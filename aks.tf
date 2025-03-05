module "aks" {
  source  = "Azure/aks/azurerm"
  version = "9.4.1" # Check for the latest version on the Terraform Registry

  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  cluster_name        = "my-aks-cluster"
  agents_count         = 1
  prefix              = "rsa"
  role_based_access_control_enabled = false
  rbac_aad                          = false


  net_profile_service_cidr   = "10.0.0.0/16"
  net_profile_dns_service_ip = "10.0.0.10"

  tags = {
    Environment = "Production"
  }
  depends_on = [azurerm_resource_group.aks_rg]
}


output "kube_config" {
  value     = module.aks.kube_config_raw
  sensitive = true
  }
