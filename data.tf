data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}

data "azurerm_resource_group" "autorg" {
  name = var.automation_rg_name
}

data "azurerm_automation_account" "autoacct" {
  name                = var.automation_account_name
  resource_group_name = var.automation_rg_name
}

data "local_file" "ps_automation" {
  filename = "shutdownstartbytag.ps1"
}