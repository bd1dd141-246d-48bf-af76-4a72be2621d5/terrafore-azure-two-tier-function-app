resource "azurerm_key_vault" "keyvault" {
  name                = "kv-${random_id.name.hex}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = var.tenant_id
  soft_delete_enabled = true
  purge_protection_enabled = false
  sku_name                 = "standard"

  access_policy {
    tenant_id = azurerm_function_app.func1.identity[0].tenant_id
    object_id = azurerm_function_app.func1.identity[0].principal_id

    secret_permissions = [
      "get",
      "list",
      "set"
    ]
  }

  access_policy {
    tenant_id = azurerm_function_app.func2.identity[0].tenant_id
    object_id = azurerm_function_app.func2.identity[0].principal_id

    secret_permissions = [
      "get",
      "list",
      "set"
    ]
  }

  access_policy {
    tenant_id = azurerm_function_app.func3.identity[0].tenant_id
    object_id = azurerm_function_app.func3.identity[0].principal_id

    secret_permissions = [
      "get",
      "list"
    ]
  }

  network_acls {
    default_action = "Deny"
    bypass = "AzureServices"
    virtual_network_subnet_ids = ["${azurerm_subnet.subnet.id}"]
  } 
}

resource "azurerm_key_vault_secret" "cosmosEndpoint" {
  name         = "CosmosEndpointUri"
  value        = azurerm_cosmosdb_account.db.endpoint
  key_vault_id = azurerm_key_vault.keyvault.id
}

resource "azurerm_key_vault_secret" "cosmosKey" {
  name         = "CosmosPrimaryKey"
  value        = azurerm_cosmosdb_account.db.primary_master_key
  key_vault_id = azurerm_key_vault.keyvault.id
}