resource "azurerm_resource_group" "resource_group" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_storage_account" "storageaccount" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = "${azurerm_resource_group.resource_group.name}"
  location                 = "${var.location}"
  account_replication_type = "${var.account_replication_type}"
  account_tier             = "${var.account_tier}"
  enable_blob_encryption   = "${var.enable_blob_encryption}"
  enable_file_encryption   = "${var.enable_file_encryption}"
  tags                     = "${var.tags}"
}

resource "azurerm_storage_share" "storageaccount_share" {
  count                = "${var.file_share_name !=  "" ? "1" : "0"}"
  name                 = "${var.file_share_name}"
  resource_group_name  = "${azurerm_resource_group.resource_group.name}"
  storage_account_name = "${azurerm_storage_account.storageaccount.name}"
  quota                = 50
}

resource "azurerm_storage_container" "storageaccount_container" {
  count                 = "${var.container_name !=  "" ? "1" : "0"}"
  name                  = "${var.container_name}"
  resource_group_name   = "${azurerm_resource_group.resource_group.name}"
  storage_account_name  = "${azurerm_storage_account.storageaccount.name}"
  container_access_type = "private"
}
