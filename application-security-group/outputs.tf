output "application_security_group_id" {
  description = "Get the ID of created/updated ASG"
  value       = ["${azurerm_application_security_group.application_security_group.id}"]
}

output "application_security_group_name" {
  description = "Get the name of created/updated ASG"
  value       = ["${azurerm_application_security_group.application_security_group.name}"]
}
