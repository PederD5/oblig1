output "backend_hcl_template" {
  description = "Ferdig partial backend-konfigurasjon som kan skrives til shared/backend.hcl."

  value = <<EOT
resource_group_name  = "${azurerm_resource_group.rg.name}"
storage_account_name = "${azurerm_storage_account.sa.name}"
container_name       = "${azurerm_storage_container.tfstate.name}"
use_azuread_auth     = true
EOT
}

output "storage_account_name" {
  description = "Navnet på storage account-et som holder Terraform-state."
  value       = azurerm_storage_account.sa.name
}

output "resource_group_name" {
  description = "Navnet på backend-ressursgruppen."
  value       = azurerm_resource_group.rg.name
}