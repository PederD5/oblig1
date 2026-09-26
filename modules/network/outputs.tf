output "subnet_ids" {
  description = "Subnet-ID per subnettnavn."

  value = {
    for name, subnet in azurerm_subnet.this :
    name => subnet.id
  }
}

output "vnet_id" {
  description = "ID-en til det virtuelle nettverket."
  value       = azurerm_virtual_network.this.id
}