resource "azurerm_network_interface" "NICs" {
  for_each = var.nic_details

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  # ✅ Optional arguments using only ternary
  auxiliary_mode                 = each.value.auxiliary_mode != null ? each.value.auxiliary_mode : null
  auxiliary_sku                  = each.value.auxiliary_sku != null ? each.value.auxiliary_sku : null
  dns_servers                    = each.value.dns_servers != null ? each.value.dns_servers : null
  edge_zone                      = each.value.edge_zone != null ? each.value.edge_zone : null
  ip_forwarding_enabled          = each.value.ip_forwarding_enabled != null ? each.value.ip_forwarding_enabled : false
  accelerated_networking_enabled = each.value.accelerated_networking_enabled != null ? each.value.accelerated_networking_enabled : false
  internal_dns_name_label        = each.value.internal_dns_name_label != null ? each.value.internal_dns_name_label : null
  tags                           = each.value.tags != null ? each.value.tags : {}

  # ✅ Dynamic block for IP configuration
  dynamic "ip_configuration" {
    for_each = each.value.ip_configurations

    content {
      name                          = ip_configuration.value.name
      subnet_id                     = ip_configuration.value.subnet_id != null ? ip_configuration.value.subnet_id : var.subnet_ip_mapping_var[ip_configuration.value.subnet_key]
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      private_ip_address            = ip_configuration.value.private_ip_address != null ? ip_configuration.value.private_ip_address : null
      public_ip_address_id          = ip_configuration.value.public_ip_address_id != null ? ip_configuration.value.public_ip_address_id : null
      gateway_load_balancer_frontend_ip_configuration_id = ip_configuration.value.gateway_load_balancer_frontend_ip_configuration_id != null ? ip_configuration.value.gateway_load_balancer_frontend_ip_configuration_id : null
      private_ip_address_version    = ip_configuration.value.private_ip_address_version != null ? ip_configuration.value.private_ip_address_version : "IPv4"
      primary                       = ip_configuration.value.primary != null ? ip_configuration.value.primary : false
    }
  }
}
