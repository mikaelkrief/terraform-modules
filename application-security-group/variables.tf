variable "resource_group_name" {
  description = "Default resource group name that the ASG will be created in."
  default     = "myapp-rg"
}

variable "application_security_group_name" {
  description = "Name of the Application Security Group"
  type        = "string"
  default     = "myasg"
}

variable "location" {
  description = "The location/region where the asg will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  type        = "string"
  default     = "westus"
}

variable "tags" {
  description = "The tags to associate with your asg."
  type        = "map"

  default = {
    tag1 = ""
    tag2 = ""
  }
}
