output "name" {
  description = "The name of the created resource group."
  value       = azurerm_resource_group.this.name
}

output "id" {
  description = "The ID of the created resource group."
  value       = azurerm_resource_group.this.id
}

output "location" {
  description = "The Azure region of the created resource group."
  value       = azurerm_resource_group.this.location
}

output "tags" {
  description = "The tags applied to the created resource group."
  value       = azurerm_resource_group.this.tags
}
