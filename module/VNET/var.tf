# variable "vnet_details" {
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string
#     address_space       = list(string)
#     dns_servers         = list(string)
#     tags                = map(string)
#   }))

# }


variable "vnet_details" {
  description = "Details for all virtual networks to create."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    # Either one required
    address_space       = optional(list(string))
    ip_address_pool     = optional(list(object({
      id                    = string
      number_of_ip_addresses = string
    })))

    bgp_community               = optional(string)
    ddos_protection_plan        = optional(object({
      id     = string
      enable = bool
    }))
    encryption                  = optional(object({
      enforcement = string
    }))
    dns_servers                 = optional(list(string))
    edge_zone                   = optional(string)
    flow_timeout_in_minutes     = optional(number)
    private_endpoint_vnet_policies = optional(string)
    tags                        = optional(map(string))

    subnet = optional(list(object({
      name                                      = string
      address_prefixes                          = list(string)
      security_group                            = optional(string)
      default_outbound_access_enabled           = optional(bool)
      private_endpoint_network_policies          = optional(string)
      private_link_service_network_policies_enabled = optional(bool)
      route_table_id                             = optional(string)
      service_endpoints                          = optional(list(string))
      service_endpoint_policy_ids                = optional(list(string))

      delegation = optional(list(object({
        name = string
        service_delegation = object({
          name    = string
          actions = optional(list(string))
        })
      })))
    })))
  }))
}

