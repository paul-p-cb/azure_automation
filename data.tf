data azurerm_client_config "current" {}

data azurerm_subscription "current" {}

data azurerm_resource_group "autorg" {
  name             = var.automation_rg_name
  location         = var.location
}

data azurerm_automation_account "autoacct" {
  name                 = var.automation_account_name
  location             = var.location
  resource_group_name  = var.automation_rg_name
}