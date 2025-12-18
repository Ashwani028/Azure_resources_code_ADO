variable "sql_main" {
  description = "Map of main SQL servers"
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
    login_username               = string
    tags                         = map(string)
  }))
}