resource "azurerm_virtual_network" "this" {
  name                = "vnet-${var.name_prefix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space]
}

resource "azurerm_subnet" "this" {
  for_each = var.subnets

  name                 = "snet-${var.name_prefix}-${each.key}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes = [
    cidrsubnet(var.address_space, 8, each.value)
  ]
}