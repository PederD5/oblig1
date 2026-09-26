output "network_interface_id" {
  description = "ID-en til nettverkskortet som er koblet til app-subnettet."
  value       = azurerm_network_interface.this.id
}