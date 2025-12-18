output "sql_main_server_output" {
  value = {for k , server_sql in azurerm_mssql_server.sql_main : k=> server_sql.id}
}