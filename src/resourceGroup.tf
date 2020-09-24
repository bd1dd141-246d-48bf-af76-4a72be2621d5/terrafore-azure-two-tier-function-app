resource "azurerm_resource_group" "rg" {
  name     = "rg-${random_id.name.hex}"
  location = var.resource_group_location
}