resource "azurerm_windows_web_app" "win_web_app1" {
    for_each = var.win_web_app_details
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  service_plan_id     = data.azurerm_service_plan.service_app_data.id

  site_config {
  application_stack {
      current_stack = "dotnet"
      dotnet_version = "v7.0"
    }

  }
}