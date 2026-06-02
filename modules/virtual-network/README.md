# Virtual Network Module

Creates an Azure virtual network using the naming convention:

`vnet-{project}-{service}-{environment}-{region}-{sequence}`

The module applies the same tag set as the resource-group module:

- `Name`
- `BusinessUnit`
- `Owner`
- `TechnicalContact`
- `OpCo`
- `Project`
- `Environment`
- `Description`

The `Name` tag is set to the generated virtual network name.

## Resource Group Behavior

Use one of these modes:

- Set `create_resource_group = false` and provide `resource_group_name` to use an existing resource group.
- Set `create_resource_group = true` and provide `resource_group_location` to create the resource group through the existing `resource-group` module.

## Security Controls

The module exposes the AzureRM controls available at virtual-network and subnet scope:

- Optional DDoS protection via `enable_ddos_protection` and `ddos_protection_plan_id`
- Subnet service endpoints
- Subnet network policy flags
- Optional subnet NSG and route table attachment
- Optional subnet delegations

## Inputs

- `project`
- `service`
- `environment`
- `region`
- `sequence`
- `location`
- `address_space`
- `dns_servers`
- `create_resource_group`
- `resource_group_name`
- `resource_group_location`
- `business_unit`
- `owner`
- `technical_contact`
- `op_co`
- `description`
- `enable_ddos_protection`
- `ddos_protection_plan_id`
- `subnets`

## Outputs

- `name`
- `id`
- `resource_group_name`
- `resource_group_id`
- `address_space`
- `tags`
- `subnet_ids`
