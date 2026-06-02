module "resource_group" {
  count  = var.create_resource_group ? 1 : 0
  source = "../resource-group"

  project      = var.project
  service      = var.service
  environment  = var.environment
  region       = var.region
  sequence     = var.sequence
  location     = var.resource_group_location
  business_unit = var.business_unit
  owner        = var.owner
  technical_contact = var.technical_contact
  op_co        = var.op_co
  description  = var.description
}

locals {
  effective_resource_group_name = var.create_resource_group ? module.resource_group[0].name : var.resource_group_name
}

resource "azurerm_virtual_network" "this" {
  name                = local.virtual_network_name
  location            = var.location
  resource_group_name  = local.effective_resource_group_name
  address_space       = var.address_space
  dns_servers         = length(var.dns_servers) > 0 ? var.dns_servers : null
  tags                = local.tags

  dynamic "ddos_protection_plan" {
    for_each = var.enable_ddos_protection ? [var.ddos_protection_plan_id] : []

    content {
      id = ddos_protection_plan.value
    }
  }
}

resource "azurerm_subnet" "this" {
  for_each = local.subnet_map

  name                                          = each.value.name
  resource_group_name                           = local.effective_resource_group_name
  virtual_network_name                          = azurerm_virtual_network.this.name
  address_prefixes                              = each.value.address_prefixes
  service_endpoints                             = lookup(var.subnet_service_endpoints, each.key, each.value.service_endpoints)
  private_endpoint_network_policies_enabled      = lookup(var.subnet_private_endpoint_network_policies_enabled, each.key, each.value.private_endpoint_network_policies_enabled)
  private_link_service_network_policies_enabled  = lookup(var.subnet_private_link_service_network_policies_enabled, each.key, each.value.private_link_service_network_policies_enabled)
  network_security_group_id                     = lookup(var.subnet_network_security_group_ids, each.key, null)
  route_table_id                                = lookup(var.subnet_route_table_ids, each.key, null)

  dynamic "delegation" {
    for_each = lookup(var.subnet_delegations, each.key, [])

    content {
      name = delegation.value.name

      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = delegation.value.service_delegation.actions
      }
    }
  }
}
