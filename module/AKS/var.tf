variable "aks_details" {
  description = "Map of AKS cluster configurations"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string

    # Optional fields
    name_default_node_pool = optional(string, "default")
    node_count             = optional(number, 2)
    vm_size                = optional(string, "Standard_DS2_v2")
    type                   = optional(string, "SystemAssigned")
  }))
}
