locals {
  common_tags = {
    "ManagedBy"   = "Terraform"
    "Owner"       = "TodoappTeam"
    "Environment" = "dev"
  }
}


module "rg" {
  source      = "../../modules/azurerm_resource_group"
  rg_name     = "rg-dev-todoapp"
  rg_location = "centralindia"
  tags     = local.common_tags
}

module "acr" {
  source   = "../../modules/azurerm_container_registry"
  acr_name = "acr-dev-todoapp"
  rg_name  = "rg-dev-todoapp"
  location = "centralindia"
  tags     = local.common_tags
}



module "sql_server" {
  source          = "../../modules/azurerm_sql_server"
  sql_server_name = "sql-dev-todoapp"
  rg_name         = "rg-dev-todoapp"
  location        = "centralindia"
  admin_username  = "devopsadmin"
  admin_password  = "P@ssword123"
  tags            = local.common_tags
}

module "sql_db" {
  source      = "../../modules/azurerm_sql_database"
  sql_db_name = "sqldb-dev-todoapp"
  server_id   = "module.sql_server.server_id"
  max_size_gb = "2"
  tags        = local.common_tags
}

module "aks" {
  source   = "../../modules/azurerm_kubernetes_cluster"
  aks_name = "aks-dev-todoapp"
  location = "centralindia"
  rg_name  = "rg-dev-todoapp"
  #location    = "centralindia"
  dns_prefix = "aks-de-todoapp"
  tags       = local.common_tags
}

