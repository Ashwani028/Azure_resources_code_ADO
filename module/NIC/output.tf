output "nic_output_id" {
  value = {  for f , nic in  azurerm_network_interface.NICs :   f => nic.id        }
}