output "subnet_ids" {
  description = "Subnet-ID-ene som andre stacks kan lese."
  value       = module.network.subnet_ids
}

output "resource_group_name" {
  description = "Navnet på ressursgruppen til miljøet."
  value       = azurerm_resource_group.this.name
}

output "location" {
  description = "Azure-regionen miljøet bruker."
  value       = azurerm_resource_group.this.location
}