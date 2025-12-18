variable "sqlserver_details" {
  description = "Map of SQL Server database details"
  type = map(object({
    name         = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
    server_key = string
    tags         = map(string)
  }))
}

variable "sqlmain_map_database" {
  
}