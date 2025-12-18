resource "azurerm_linux_virtual_machine" "vms" {
  for_each = var.vm_details

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username

  # Optional: Password-based authentication logic

  admin_password = data.azurerm_key_vault_secret.vmpasswd_secret.value
  #admin_password = each.value.admin_password != null ? each.value.admin_password : null
  disable_password_authentication = (
    each.value.admin_password != null ?
    false : (
      each.value.disable_password_authentication != null ? each.value.disable_password_authentication : true
    )
  )

  network_interface_ids = [
    var.nic_map_with_vm[each.value.nic_key]
  ]

  # Optional arguments (ternary handling)
  computer_name       = each.value.computer_name != null ? each.value.computer_name : null
  availability_set_id = each.value.availability_set_id != null ? each.value.availability_set_id : null
  custom_data         = each.value.custom_data != null ? base64encode(each.value.custom_data) : null
  priority            = each.value.priority != null ? each.value.priority : null
  zone                = each.value.zone != null ? each.value.zone : null
  tags                = each.value.tags != null ? each.value.tags : null

  os_disk {
    caching              = each.value.caching != null ? each.value.caching : "ReadWrite"
    storage_account_type = each.value.storage_account_type != null ? each.value.storage_account_type : "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }

  # Optional boot diagnostics with ternary
  dynamic "boot_diagnostics" {
    for_each = each.value.boot_diagnostics != null ? [each.value.boot_diagnostics] : []
    content {
      storage_account_uri = lookup(boot_diagnostics.value, "storage_account_uri", null)
    }
  }

  # Example: Optional plan (if you ever use Marketplace image)
  dynamic "plan" {
    for_each = each.value.plan != null ? [each.value.plan] : []
    content {
      name      = plan.value.name
      product   = plan.value.product
      publisher = plan.value.publisher
    }
  }
}
