resource "azurerm_mssql_database" "sql_db" {
    name = var.sql_db_name
    server_id = var.server_id
    collaction = "SQL_LAtin1_general_cp1_ci_as"
    license_type = "licenseincluded"
    max_size_gb = var.max_size_gb
    sku_name = "S0"
     enclave_type = "VBS"

     tags = var.tags
}