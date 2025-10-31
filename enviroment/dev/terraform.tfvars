
rgs = {
  dev_rg1 = {
    name     = "dev-rg1"
    location = "centralus"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "dev"
    }
  }
}

acrs = {
  dev_acr1 = {
    name                = "devacr1ajay2025"
    resource_group_name = "dev-rg1"
    location            = "centralus"
    sku                 = "Premium"
    admin_enabled       = false
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "dev"
    }
  }
}

sql_servers = {
  dev_sql1 = {
    name                         = "devsqlserverajay2025"
    resource_group_name          = "dev-rg1"
    location                     = "centralus"
    version                      = "12.0"
    admin_login                  = "sqladminuser"
    admin_password               = "P@ssw0rd1234!"
    minimum_tls_version          = "1.2"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "dev"
    }
  }
}

sql_dbs = {
  dev_sqldb1 = {
    name         = "dev-sql-db-ajay"
    server_id    = "devsqlserverajay2025"
    sku_name     = "S0"
    max_size_gb  = 10
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "BasePrice"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "dev"
    }
  }
}

aks_clusters = {
  dev_aks1 = {
    name                = "dev-aks-ajay2025"
    location            = "centralus"
    resource_group_name = "dev-rg1"
    dns_prefix          = "devaksajay"

    default_node_pool = {
      name       = "default"
      node_count = 2
      vm_size    = "Standard_B2ms"
    }

    identity = {
      type = "SystemAssigned"
    }

    network_profile = {
      load_balancer_sku = "standard"
      network_plugin    = "azure"
    }

    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "dev"
    }
  }
}

public_ips = {
  dev_pip1 = {
    name                = "dev-public-ip-ajay"
    resource_group_name = "dev-rg1"
    location            = "centralus"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "dev"
    }
  }
}

key_vaults = {
  kv1 = {
    name                        = "devkeyvaultajay2025"
    location                    = "centralus"
    resource_group_name         = "dev-rg1"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = true
    sku_name                    = "standard"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "dev"
    }

    access_policies = [
      {
        object_id               = "f1234567-89ab-4cde-90f1-23456789abcd"
        key_permissions         = ["Get", "List", "Create", "Delete"]
        secret_permissions      = ["Get", "List", "Set", "Delete"]
        certificate_permissions = []
        storage_permissions     = []
      }
    ]
  }
}

stgs = {
  dev_stg1 = {
    name                    = "devstgajay2025"
    resource_group_name     = "dev-rg1"
    location                = "centralus"
    account_tier            = "Standard"
    account_replication_type = "LRS"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "dev"
    }
  }
}
