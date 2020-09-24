resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${random_id.name.hex}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["192.168.0.0/24"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-${random_id.name.hex}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.0.0/25"]
  service_endpoints    = ["Microsoft.KeyVault"]
}

resource "azurerm_subnet_network_security_group_association" "subnetToNsg" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}