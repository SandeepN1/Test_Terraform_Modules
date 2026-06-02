locals {
  resource_group_name = lower(format(
    "rg-%s-%s-%s-%s-%s",
    var.project,
    var.service,
    var.environment,
    var.region,
    var.sequence,
  ))

  tags = {
    Name             = local.resource_group_name
    BusinessUnit     = var.business_unit
    Owner            = var.owner
    TechnicalContact = var.technical_contact
    OpCo             = var.op_co
    Project          = var.project
    Environment      = var.environment
    Description      = var.description
  }
}