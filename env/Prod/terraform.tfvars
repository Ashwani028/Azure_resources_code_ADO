rg_name = {

  "rg1" = {
    name       = "rg444"
    location   = "centralindia"
    managed_by = "rg_team"
    tag = {
      env = "RG_TEAM"
    }
  }
}

vnet_name = {

  "vnet1" = {
    name                = "vnet444"
    location            = "centralindia"
    resource_group_name = "rg444"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]

    tags = {
      env = "vnet_team_mgmt"
    }
  }

  "vnet2" = {
    name                = "vnet444"
    location            = "centralindia"
    resource_group_name = "rg444"
    address_space       = ["20.0.0.0/16"]
    dns_servers         = ["20.0.0.4", "20.0.0.5"]
    enforcement         = "AllowUnencrypted"
    tags = {
      env = "vnet_team_mgmt"
    }
  }
}

nic_name = {
  nic1 = {
    name                = "nic444"
    location            = "centralindia"
    resource_group_name = "rg444"

    ip_configurations = {
      ip1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
        subnet_key                    = "subnet1"
        primary                       = "true"
      }

      ip2 = {
        name                          = "internal2"
        private_ip_address_allocation = "Dynamic"
        subnet_key                    = "subnet1"
      }
    }
  }
}

subnet_name = {
  subnet1 = {
    name                 = "subnet444"
    resource_group_name  = "rg444"
    virtual_network_name = "vnet11"
    address_prefixes     = ["10.0.1.0/24"]
  }
}


pip_name = {
  pip1 = {
    name                = "pip444"
    resource_group_name = "rg444"
    location            = "centralindia"
    allocation_method   = "Static"

    tags = {
      environment = "PIP_team_mgmt"
    }
  }
}

vm_name = {

  vm1 = {
    name                            = "vm444"
    resource_group_name             = "rg444"
    location                        = "centralindia"
    size                            = "Standard_F2"
    admin_username                  = "adminuser"
    #admin_password                  = 
    disable_password_authentication = "false"
    nic_key                         = "nic1"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}


aks_name = {

  aks1 = {

    name                   = "akss4444"
    location               = "centralindia"
    resource_group_name    = "rg444"
    dns_prefix             = "exampleaks1"
    name_default_node_pool = "default"
    node_count             = 1
    vm_size                = "Standard_D2s_v3"
    type                   = "SystemAssigned"

    tags = {
      Environment = "Production"
    }

  }
}


keyvault_name = {
  keyvault1 = {
    name                        = "ashjai444"
    location                    = "centralindia"
    resource_group_name         = "rg444"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"

  }
  
}


sqlserver_name = {

sqlserver1 = {

 name         = "SqlSever-db44"
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
  server_key = "sqlmain1"

  tags = {
    env = "sql_server_databaseteam"
  }
}
}


sqlmain_name = {

sqlmain1 = {

  name                         = "mssqlservermain44"
  resource_group_name          = "rg444"
  location                     = "centralindia"
  version                      = "12.0"
  administrator_login          = "admin11"
  administrator_login_password = "Avaya@123456"
  minimum_tls_version          = "1.2"
login_username = "ash11"
  tags = {
    environment = "sqlmainserver_team_mgmt"
  }
 
}
}


serviceplan_name = {
serviceplan1 = {
  name                = "tlplan0044"
  resource_group_name = "rg444"
  location            = "centralindia"
  os_type             = "Windows"
  sku_name            = "B1"
}
}

win_web_app_name = {
"win_web_app1" = {
  name                = "webapp44"
  resource_group_name = "rg444"
  location            = "centralindia"
}
}