provider "azurerm" {
  version                    = ">=2.9.0"
  skip_provider_registration = "true"
  features {}

}

resource "azurerm_automation_module" "azaccount" {
  name                    = "Az.Accounts"
  resource_group_name     = data.azurerm_resource_group.autorg.name
  automation_account_name = data.azurerm_automation_account.autoacct.name

  module_link {
    uri = "https://www.powershellgallery.com/api/v2/package/az.accounts/2.2.6"
  }
}

resource "azurerm_automation_module" "azcompute" {
  name                    = "Az.Compute"
  resource_group_name     = data.azurerm_resource_group.autorg.name
  automation_account_name = data.azurerm_automation_account.autoacct.name

  module_link {
    uri = "https://www.powershellgallery.com/api/v2/package/az.compute/4.10.0"
  }

  depends_on = [
    azurerm_automation_module.azaccount
  ]
}

resource "azurerm_automation_module" "azresources" {
  name                    = "Az.Resources"
  resource_group_name     = data.azurerm_resource_group.autorg.name
  automation_account_name = data.azurerm_automation_account.autoacct.name

  module_link {
    uri = "https://www.powershellgallery.com/api/v2/package/az.resources/3.3.0"
  }
  depends_on = [
    azurerm_automation_module.azaccount
  ]
}

resource "azurerm_automation_runbook" "shutdownstartbytag" {
  name                    = "Get-AzureVMTutorial"
  location                = var.location
  resource_group_name     = data.azurerm_resource_group.autorg.name
  automation_account_name = data.azurerm_automation_account.autoacct.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "This runbook powers VMs off and on based on a schedule"
  runbook_type            = "PowerShellWorkflow"

  publish_content_link {
    uri = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/c4935ffb69246a6058eb24f54640f53f69d3ac9f/101-automation-runbook-getvms/Runbooks/Get-AzureVMTutorial.ps1"
  }
  content = data.local_file.ps_automation.filename
}