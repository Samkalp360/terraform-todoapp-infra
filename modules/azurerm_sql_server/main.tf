

resource "azurerm_mssql_server" "sql_server_name" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = ver.admin_username
  administrator_login_password = ver.admin_password
  minimum_tls_version          = "1.2"

  tags = var.tags
}