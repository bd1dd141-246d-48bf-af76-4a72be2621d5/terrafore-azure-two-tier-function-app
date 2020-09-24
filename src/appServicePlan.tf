resource "azurerm_app_service_plan" "premium" {
  name                = "asp-${random_id.name.hex}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "ElasticPremium"
    size = "EP1"
  }
}