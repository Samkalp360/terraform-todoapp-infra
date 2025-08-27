

resource "azurerm_mssql_database" "sql_db" {
  name         = ver.sql_db_name
  server_id    = ver.server_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = ver.max_size_gb
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = var.tags
}