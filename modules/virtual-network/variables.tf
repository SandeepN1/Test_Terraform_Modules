variable "project" {
  description = "Project identifier used in the virtual network name and tags."
  type        = string
}

variable "service" {
  description = "Service identifier used in the virtual network name."
  type        = string
}

variable "environment" {
  description = "Environment identifier used in the virtual network name and tags."
  type        = string
}

variable "region" {
  description = "Region identifier used in the virtual network name."
  type        = string
}

variable "sequence" {
  description = "Sequence number used in the virtual network name."
  type        = string
}

variable "location" {
  description = "Azure region where the virtual network will be created."
  type        = string
}

variable "address_space" {
  description = "Address space assigned to the virtual network."
  type        = list(string)
}

variable "dns_servers" {
  description = "Optional custom DNS servers for the virtual network."
  type        = list(string)
  default     = []
}

variable "create_resource_group" {
  description = "Whether to create the resource group through the existing resource-group module."
  type        = bool
  default     = false
}

variable "resource_group_name" {
  description = "Existing resource group name to use when create_resource_group is false."
  type        = string
  default     = null
}

variable "resource_group_location" {
  description = "Location for the resource group when create_resource_group is true."
  type        = string
  default     = null
}

variable "business_unit" {
  description = "Business unit tag value."
  type        = string
}

variable "owner" {
  description = "Owner tag value."
  type        = string
}

variable "technical_contact" {
  description = "Technical contact tag value."
  type        = string
}

variable "op_co" {
  description = "OpCo tag value."
  type        = string
}

variable "description" {
  description = "Description tag value."
  type        = string
}

variable "enable_ddos_protection" {
  description = "Whether to enable DDoS protection for the virtual network."
  type        = bool
  default     = false
}

variable "ddos_protection_plan_id" {
  description = "DDoS protection plan ID required when enable_ddos_protection is true."
  type        = string
  default     = null
}

variable "subnets" {
  description = "Optional subnets to create inside the virtual network."
  type = list(object({
    name                                     = string
    address_prefixes                         = list(string)
    service_endpoints                        = optional(list(string), [])
    private_endpoint_network_policies_enabled = optional(bool, true)
    private_link_service_network_policies_enabled = optional(bool, true)
  }))
  default = []
}

variable "subnet_delegations" {
  description = "Optional subnet delegations keyed by subnet name."
  type = map(list(object({
    name    = string
    actions = list(string)
    service_delegation = object({
      name    = string
      actions = list(string)
    })
  })))
  default = {}
}

variable "subnet_network_security_group_ids" {
  description = "Optional NSG IDs keyed by subnet name."
  type        = map(string)
  default     = {}
}

variable "subnet_route_table_ids" {
  description = "Optional route table IDs keyed by subnet name."
  type        = map(string)
  default     = {}
}

variable "subnet_service_endpoints" {
  description = "Optional service endpoints keyed by subnet name."
  type        = map(list(string))
  default     = {}
}

variable "subnet_private_endpoint_network_policies_enabled" {
  description = "Optional private endpoint network policy flags keyed by subnet name."
  type        = map(bool)
  default     = {}
}

variable "subnet_private_link_service_network_policies_enabled" {
  description = "Optional private link service network policy flags keyed by subnet name."
  type        = map(bool)
  default     = {}
}

validation {
  condition     = var.create_resource_group || (var.resource_group_name != null && trimspace(var.resource_group_name) != "")
  error_message = "resource_group_name is required when create_resource_group is false."
}

validation {
  condition     = !var.create_resource_group || (var.resource_group_location != null && trimspace(var.resource_group_location) != "")
  error_message = "resource_group_location is required when create_resource_group is true."
}

validation {
  condition     = !var.enable_ddos_protection || (var.ddos_protection_plan_id != null && trimspace(var.ddos_protection_plan_id) != "")
  error_message = "ddos_protection_plan_id is required when enable_ddos_protection is true."
}
