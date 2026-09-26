data "azurerm_client_config" "current" {}

locals {
  resource_group_name = format(
    "rg-tfstate-%s",
    lower(var.shortname)
  )

  storage_account_name = format(
    "sttfstate%s3005",
    lower(var.shortname)
  )

  resource_group_tags = {
    keep      = "true"
    purpose   = "terraform-backend"
    owner     = var.shortname
    managedby = "terraform"
  }

  storage_tags = {
    purpose   = "terraform-backend"
    owner     = var.shortname
    managedby = "terraform"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location
  tags     = local.resource_group_tags
}

resource "azurerm_storage_account" "sa" {
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  shared_access_key_enabled = false
  min_tls_version           = "TLS1_2"

  blob_properties {
    versioning_enabled = true

    delete_retention_policy {
      days = 7
    }
  }

  tags = local.storage_tags
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}

resource "azurerm_role_assignment" "current_user_blob" {
  scope                = azurerm_storage_account.sa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}