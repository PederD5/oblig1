locals {
  name_prefix = lower(
    format(
      "%s-%s-%s",
      var.shortname,
      var.project,
      var.environment
    )
  )

  resource_group_name = format(
    "rg-%s",
    local.name_prefix
  )

  common_tags = {
    environment = var.environment
    project     = var.project
    owner       = var.shortname
    managedby   = "terraform"
  }

  subnets = {
    web  = 0
    app  = 1
    data = 2
  }
}

resource "azurerm_resource_group" "this" {
  name     = local.resource_group_name
  location = var.location
  tags     = local.common_tags
}

module "network" {
  source = "../../modules/network"

  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  name_prefix         = local.name_prefix
  address_space       = var.address_space
  subnets             = local.subnets
}