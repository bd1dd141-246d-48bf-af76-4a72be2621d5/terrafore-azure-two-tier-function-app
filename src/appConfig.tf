resource "azurerm_app_configuration" "appconf" {
  name                = "appcfg-${random_id.name.hex}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "standard"
}