output "application_security_group_id" {
  description = "Get the ID of created/updated ASG"
  value       = ["${module.applsecuritygroup.application_security_group_id}"]
}
