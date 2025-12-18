resource "azurerm_kubernetes_cluster" "akss" {
  for_each = var.aks_details

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = each.value.name_default_node_pool != null ? each.value.name_default_node_pool : "default"
    node_count = each.value.node_count != null ? each.value.node_count : 2
    vm_size    = each.value.vm_size != null ? each.value.vm_size : "Standard_DS2_v2"
  }

  identity {
    type = each.value.type != null ? each.value.type : "SystemAssigned"
  }

  tags = {
    Environment = "AKS_Production"
  }
}
