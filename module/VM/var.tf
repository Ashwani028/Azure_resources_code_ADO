variable "vm_details" {
  description = "Map of Linux Virtual Machine configurations"
  type = map(object({
    name                          = string
    resource_group_name           = string
    location                      = string
    size                          = string
    admin_username                = string

    # Optional Authentication Config
    admin_password                = optional(string)
    disable_password_authentication = optional(bool, true)

    # OS Disk Config
    caching                       = optional(string, "ReadWrite")
    storage_account_type          = optional(string, "Standard_LRS")

    # Image Reference
    publisher                     = string
    offer                         = string
    sku                           = string
    version                       = string

    # Networking
    nic_key                       = string

    # Optional Plan Block
    plan = optional(object({
      name      = string
      product   = string
      publisher = string
    }))

    # Optional Boot Diagnostics Block
    boot_diagnostics = optional(object({
      storage_account_uri = optional(string)
    }))

    # Optional Features
    computer_name       = optional(string)
    availability_set_id = optional(string)
    custom_data         = optional(string)
    priority            = optional(string)
    zone                = optional(string)
    tags                = optional(map(string))
  }))
}

variable "nic_map_with_vm" {
  description = "Map of NIC keys to their network interface IDs"
  type        = map(string)
}
