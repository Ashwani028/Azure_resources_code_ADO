# resource "azurerm_virtual_network" "VNET" {
#   for_each            = var.vnet_details
#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name
#   address_space       = each.value.address_space
#   dns_servers         = each.value.dns_servers
#   tags                = each.value.tags

# }

resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnet_details

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  # Either address_space or ip_address_pool
  address_space = each.value.address_space != null ? each.value.address_space : null

  # Optional arguments with ternary
  dns_servers                   = each.value.dns_servers != null ? each.value.dns_servers : []
  flow_timeout_in_minutes       = each.value.flow_timeout_in_minutes != null ? each.value.flow_timeout_in_minutes : null
  edge_zone                     = each.value.edge_zone != null ? each.value.edge_zone : null
  private_endpoint_vnet_policies = each.value.private_endpoint_vnet_policies != null ? each.value.private_endpoint_vnet_policies : null
  bgp_community                 = each.value.bgp_community != null ? each.value.bgp_community : null
  tags                          = each.value.tags != null ? each.value.tags : {}

  # Encryption block
  dynamic "encryption" {
    for_each = each.value.encryption != null ? [each.value.encryption] : []
    content {
      enforcement = encryption.value.enforcement
    }
  }

  # DDoS Protection block
  dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan != null ? [each.value.ddos_protection_plan] : []
    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }

  # IP Address Pool block
  dynamic "ip_address_pool" {
    for_each = each.value.ip_address_pool != null ? each.value.ip_address_pool : []
    content {
      id                     = ip_address_pool.value.id
      number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses
    }
  }

  # Subnets block
  dynamic "subnet" {
    for_each = each.value.subnet != null ? each.value.subnet : []
    content {
      name                                      = subnet.value.name
      address_prefixes                          = subnet.value.address_prefixes
      security_group                            = subnet.value.security_group != null ? subnet.value.security_group : null
      default_outbound_access_enabled           = subnet.value.default_outbound_access_enabled != null ? subnet.value.default_outbound_access_enabled : true
      private_endpoint_network_policies          = subnet.value.private_endpoint_network_policies != null ? subnet.value.private_endpoint_network_policies : "Disabled"
      private_link_service_network_policies_enabled = subnet.value.private_link_service_network_policies_enabled != null ? subnet.value.private_link_service_network_policies_enabled : true
      route_table_id                             = subnet.value.route_table_id != null ? subnet.value.route_table_id : null
      service_endpoints                          = subnet.value.service_endpoints != null ? subnet.value.service_endpoints : null
      service_endpoint_policy_ids                = subnet.value.service_endpoint_policy_ids != null ? subnet.value.service_endpoint_policy_ids : null

      dynamic "delegation" {
        for_each = subnet.value.delegation != null ? subnet.value.delegation : []
        content {
          name = delegation.value.name
          service_delegation {
            name    = delegation.value.service_delegation.name
            actions = delegation.value.service_delegation.actions != null ? delegation.value.service_delegation.actions : []
          }
        }
      }
    }
  }
}
