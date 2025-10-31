locals {
  common_tags = {
    "ManagedBy"   = "Terraform"
    "Owner"       = "ElearnTeam"
    "Environment" = "dev"
  }
}

module "rg" {
  source      = "../../module/azurerm.resource_group"
  rgs         = var.rgs
  rg_tags     = local.common_tags
}

module "acr" {
  depends_on = [module.rg]
  source     = "../../module/azurerm_container_registry"
  acrs       = var.acrs
  # acr_tags   = local.common_tags
}

module "sql_server" {
  depends_on      = [module.rg]
  source          = "../../module/azurerm_sql_server"
  sql_servers     = var.sql_servers
}




module "sql_db" {
  depends_on  = [module.sql_server]
  source      = "../../module/azurerm_sql_database"
  sql_dbs     = var.sql_dbs
  server_id = module.sql_server.sql_server_ids["dev_sql1"]
}

module "aks" {
  source      = "../../module/azurerm_kubernet_cluster"
  aks_clusters = var.aks_clusters
  # aks_tags     = local.common_tags
}


module "pip" {
  depends_on = [module.rg]

  source   = "../../module/azurerm_public_ip"
  public_ips = var.public_ips
  # tags     = local.common_tags
}

module "key_vault" {
  depends_on = [module.rg]
  source = "../../module/azurerm_key_vault"
  key_vaults = var.key_vaults
}

module "storage_account" {
    depends_on = [ module.rg ]
  source = "../../module/azurerm_storage_account"
  stgs = var.stgs
}