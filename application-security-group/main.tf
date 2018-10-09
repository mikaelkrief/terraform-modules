resource "azurerm_resource_group" "resource_group" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_application_security_group" "application_security_group" {
  name                = "${var.application_security_group_name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
  tags                = "${var.tags}"
}
