resource "azurerm_public_ip" "pips" {
  for_each            = var.PIP_details

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

  # ---------- Optional arguments with ternary checks ----------
  zones                      = each.value.zones != null ? each.value.zones : null
  ddos_protection_mode        = each.value.ddos_protection_mode != null ? each.value.ddos_protection_mode : null
  ddos_protection_plan_id     = each.value.ddos_protection_plan_id != null ? each.value.ddos_protection_plan_id : null
  domain_name_label           = each.value.domain_name_label != null ? each.value.domain_name_label : null
  domain_name_label_scope     = each.value.domain_name_label_scope != null ? each.value.domain_name_label_scope : null
  edge_zone                   = each.value.edge_zone != null ? each.value.edge_zone : null
  idle_timeout_in_minutes     = each.value.idle_timeout_in_minutes != null ? each.value.idle_timeout_in_minutes : null
  ip_tags                     = each.value.ip_tags != null ? each.value.ip_tags : null
  ip_version                  = each.value.ip_version != null ? each.value.ip_version : null
  public_ip_prefix_id         = each.value.public_ip_prefix_id != null ? each.value.public_ip_prefix_id : null
  reverse_fqdn                = each.value.reverse_fqdn != null ? each.value.reverse_fqdn : null
  sku                         = each.value.sku != null ? each.value.sku : "Standard"
  sku_tier                    = each.value.sku_tier != null ? each.value.sku_tier : "Regional"
  tags                        = each.value.tags != null ? each.value.tags : {}

}
