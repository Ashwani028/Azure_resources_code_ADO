resource "azurerm_resource_group" "RGS" {
  for_each = var.rg_details
  name     = each.value.name
  location = each.value.location
  managed_by= each.value.managed_by
  tags = each.value.tags
}