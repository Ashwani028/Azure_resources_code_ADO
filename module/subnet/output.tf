output "subnet_output" {
    value = {for k , subnet in  azurerm_subnet.subnets: k => subnet.id  }
  
}