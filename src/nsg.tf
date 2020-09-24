resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-${random_id.name.hex}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}