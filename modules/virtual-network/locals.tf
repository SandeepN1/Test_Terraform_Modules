locals {
  virtual_network_name = lower(format(
    "vnet-%s-%s-%s-%s-%s",
    var.project,
    var.service,
    var.environment,
    var.region,
    var.sequence,
  ))

  tags = {
    Name             = local.virtual_network_name
    BusinessUnit     = var.business_unit
    Owner            = var.owner
    TechnicalContact = var.technical_contact
    OpCo             = var.op_co
    Project          = var.project
    Environment      = var.environment
    Description      = var.description
  }

  subnet_map = { for subnet in var.subnets : subnet.name => subnet }
}
