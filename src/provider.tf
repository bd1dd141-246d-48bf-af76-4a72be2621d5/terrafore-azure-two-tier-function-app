provider "azurerm" {
  version = "=2.20.0"
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

/* terraform {
    backend "azurerm" {
        resource_group_name = "PowerBI"    
        storage_account_name = "coreteklabs"
        container_name = "terraform-tfstate"
    }
}
*/
