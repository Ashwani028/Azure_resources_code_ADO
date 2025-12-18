variable "nic_details" {
  description = "Network Interface details map"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    # Optional fields (modern Terraform style)
    auxiliary_mode                 = optional(string)
    auxiliary_sku                  = optional(string)
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    ip_forwarding_enabled          = optional(bool)
    accelerated_networking_enabled = optional(bool)
    internal_dns_name_label        = optional(string)
    tags                           = optional(map(string))

    ip_configurations = map(object({
      name                                        = string
      subnet_key                                  = optional(string)
      subnet_id                                   = optional(string)
      private_ip_address_allocation               = string
      private_ip_address                          = optional(string)
      public_ip_address_id                        = optional(string)
      gateway_load_balancer_frontend_ip_configuration_id = optional(string)
      private_ip_address_version                  = optional(string)
      primary                                     = optional(bool)
    }))
  }))
}

variable "subnet_ip_mapping_var" {
  description = "Map of subnet keys to subnet IDs"
  type        = map(string)
}
