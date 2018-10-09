variable "resource_group_name" {
  description = "Default resource group name that the Storage account will be created in."
  default     = "myapp-rg"
}

variable "storage_account_name" {
  type = "string"
  default = "mystorageaccount4878"
}


variable "location" {
  description = "The location/region where the asg will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  type        = "string"
  default     = "westus"
}

variable "account_replication_type" {
  type = "string"
}

variable "account_tier" {
  description =""
  type = "string"
}

variable "enable_blob_encryption" {
  description ="enable blob encryption"
  type    = "booleen"
  default = true
}

variable "enable_file_encryption" {
  description ="enable the file encryption"
  type    = "booleen"
  default = true
}

variable "tags" {
  description ="list of tags"
  type = "map"
}

variable "file_share_name" {
  description = "Name of the share that it in the storage account"
  type    = "string"
  default = ""
}


variable "container_name" {
  description = "Name of the container that it in the storage account"
  type    = "string"
  default = ""
}

variable "container_access_type" {
  description = "acces for the container values are private/blob/container"
  type = "string"
  default ="private"
  
}
