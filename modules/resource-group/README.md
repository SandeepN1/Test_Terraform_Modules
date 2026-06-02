# Resource Group Module

Creates an Azure resource group using the naming convention:

`rg-{project}-{service}-{environment}-{region}-{sequence}`

The `Name` tag is set to the generated resource group name. All other tag values are supplied through variables.

## Inputs

- `project`
- `service`
- `environment`
- `region`
- `sequence`
- `location`
- `business_unit`
- `owner`
- `technical_contact`
- `op_co`
- `description`

## Outputs

- `name`
- `id`
- `location`
- `tags`
