variable "project" {
  description = "Project identifier used in the resource group name."
  type        = string
}

variable "service" {
  description = "Service identifier used in the resource group name."
  type        = string
}

variable "environment" {
  description = "Environment identifier used in the resource group name and tags."
  type        = string
}

variable "region" {
  description = "Region identifier used in the resource group name."
  type        = string
}

variable "sequence" {
  description = "Sequence number used in the resource group name."
  type        = string
}

variable "location" {
  description = "Azure region where the resource group will be created."
  type        = string
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
