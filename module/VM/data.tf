data "azurerm_key_vault" "key_vault_data" {
  name                = "ashjai11"
  resource_group_name = "rg11"
}


data "azurerm_key_vault_secret" "vmpasswd_secret" {
  name         = "vmpassword"
  key_vault_id = data.azurerm_key_vault.key_vault_data.id
}