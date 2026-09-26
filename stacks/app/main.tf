locals {
  name_prefix = lower(
    format(
      "%s-%s-%s",
      var.shortname,
      var.project,
      var.environment
    )
  )

  common_tags = {
    environment = var.environment
    project     = var.project
    owner       = var.shortname
    managedby   = "terraform"
  }
}

data "terraform_remote_state" "network" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.backend_resource_group_name
    storage_account_name = var.backend_storage_account_name
    container_name       = var.backend_container_name
    key                  = "${var.environment}/network.tfstate"
    use_azuread_auth     = true
  }
}

resource "azurerm_network_interface" "this" {
  name = "nic-${local.name_prefix}"

  location = data.terraform_remote_state.network.outputs.location

  resource_group_name = data.terraform_remote_state.network.outputs.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.terraform_remote_state.network.outputs.subnet_ids["app"]
    private_ip_address_allocation = "Dynamic"
  }

  tags = local.common_tags
}