output "vm_name" {
  description = "Virtual Machine Name"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "public_ip_address" {
  description = "Virtual Machine Public IP"
  value       = azurerm_public_ip.public_ip.ip_address
}