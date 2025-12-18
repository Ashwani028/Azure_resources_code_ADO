module "rg_modules" {
  source     = "../../module/RG"
  rg_details = var.rg_name
}

module "vnet_module" {
    depends_on = [ module.rg_modules ]
  source = "../../module/VNET"
  vnet_details= var.vnet_name
}

module "subnet_module" {
  depends_on = [ module.rg_modules,module.vnet_module ]
  source = "../../module/subnet"
  subnet_details = var.subnet_name
}

module "nic_module" {
  depends_on = [ module.rg_modules ]
  source = "../../module/NIC"
  nic_details = var.nic_name
  subnet_ip_mapping_var= module.subnet_module.subnet_output
}

module "pip_module" {
  depends_on = [ module.rg_modules ]
  source = "../../module/PIP"
  PIP_details = var.pip_name
  }


  module "vm_module" {
    depends_on = [ module.rg_modules ,module.nic_module,module.pip_module ]
    source = "../../module/VM"
    vm_details = var.vm_name
    nic_map_with_vm = module.nic_module.nic_output_id
  }

module "aks_module" {
  depends_on = [ module.rg_modules ]
  source = "../../module/AKS"
aks_details = var.aks_name
  }



module "keyvault_module" {
  depends_on = [ module.rg_modules ]
  source = "../../module/KEY_VAULT"
keyvault_details = var.keyvault_name
}


module "sql_server_module" {
  source = "../../module/SQL_SERVER_database"
  sqlserver_details = var.sqlserver_name
  sqlmain_map_database = module.sql_main_module.sql_main_server_output
}

module "sql_main_module" {
  source = "../../module/sql_server_main"
  sql_main = var.sqlmain_name
}

module "serviceplan_module" {
  depends_on = [ module.rg_modules ]
  source = "../../module/APP_Service_plan"
  service_plan_detials= var.serviceplan_name
 }

module "az_web_app_module" {
  depends_on = [ module.serviceplan_module ]
  source = "../../module/APP_WEB_APP"
  win_web_app_details = var.win_web_app_name
}



  


