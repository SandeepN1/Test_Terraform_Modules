output "name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.this.name
}

output "id" {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.this.id
}

output "resource_group_name" {
  description = "The resource group name used by the module."
  value       = local.effective_resource_group_name
}

output "resource_group_id" {
  description = "The resource group ID when the module creates the resource group, otherwise null."
  value       = var.create_resource_group ? module.resource_group[0].id : null
}

output "address_space" {
  description = "The VNet address space."
  value       = azurerm_virtual_network.this.address_space
}

output "tags" {
  description = "The tags applied to the virtual network."
  value       = azurerm_virtual_network.this.tags
}

output "subnet_ids" {
  description = "The IDs of the created subnets."
  value       = { for name, subnet in azurerm_subnet.this : name => subnet.id }
}
