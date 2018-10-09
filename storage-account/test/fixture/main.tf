resource "random_id" "rg_name" {
  byte_length = 8
}

module "storageaccount-empty" {
  source                          = "../../"
  resource_group_name             = "${random_id.rg_name.hex}"
  application_security_group_name = "${var.application_security_group_name}"
  location                        = "${var.location}"
  tags                            = "${var.tags}"
}
