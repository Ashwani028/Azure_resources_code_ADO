resource "azurerm_service_plan" "appserviceplan" {
    for_each = var.service_plan_detials
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}
