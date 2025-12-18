data "azurerm_service_plan" "service_app_data" {
  name                = "tlplan001"
  resource_group_name = "rg11"
}

output "id" {
  value = data.azurerm_service_plan.service_app_data.id
}