locals {
    common_tags = {
        "Environment" = "dev"
        "ManagedBy" = "Terraform"
        "Owner" = "TodoAppTeam"
    }
}


module "rg" {
    source = "../../modules/azurerm_resource_group"
    rg_name = "rg-dev-todoapp"
    location = "centraindia"
    tags = locals.common_tags
}
module "acr" {
    depends_on = [module.rg]
    source = "../../modules/azurerm_container_registry"
    acr_name = "acr_dev_todoapp"
    rg_name = "rg-dev-todoapp"
    location = "centralindia"
    tags = local.common_tags
}
module "sql_server" {
    depends_on = [module.rg]
    source = "../../modules/azurerm_sql_server"
    sql_server_name = "sqlserver-dev-todoapp"
    rg_name = "rg-dev-todoapp"
    location = "centralindia"
    admin_username = "sqladminuser"
    admin_password = "P@ssword1234"
    tags = local.common_tags
}
module "sql_db" {
    depends_on = [module.sql_server]
    source = "../../modules/azurerm_sql_database"
    sql_db_name = "sqldb_dev_todoapp"
    rg_name = "rg-dev-todoapp"
    location = "centralindia"
    server_id = module.sql_server.server_id
    max_size_gb = "2"
    tags = local.common_tags
}
module "aks" {
    depends_on = [module.rg]
    source = "../../modules/azurerm_kubernetes_cluster"
    aks_name = "aks-dev-todoapp"
    rg_name = "rg-dev-todoapp"
    location = "centralindia"
    dns_prefix = "aks_dev_todoapp"
    tags = local.common_tags
}
module "storage_account" {
    depends_on = [module.rg]
    source = "../../modules/azurerm_storage_account"
    sa_name = "staddevtodoapp"
    rg_name = "rg-dev-todoapp"
    location = "centralindia"
    tags = local.common_tags
}
module "key_vault" {
    depends_on = [module.rg]
    source = "../../modules/azurerm_key_vault"
    kv_name = "kv-dev-todoapp"
    rg_name = "rg-dev-todoapp"
    location = "centralindia"
    tenant_id = "your-tenant-id"
    sku_name = "standard"
    tags = local.common_tags
}

