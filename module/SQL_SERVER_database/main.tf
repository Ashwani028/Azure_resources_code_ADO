resource "azurerm_mssql_database" "sql_server" {
    for_each = var.sqlserver_details
  name         = each.value.name
  server_id    = var.sqlmain_map_database[each.value.server_key]
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
  tags = each.value.tags

}