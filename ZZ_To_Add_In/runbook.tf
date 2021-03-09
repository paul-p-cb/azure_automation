resource "azurerm_automation_runbook" "togglevmpower" {
  name                    = "Toggle_VM_Power_State"
  location                = data.azurerm_resource_group.autorg.location
  resource_group_name     = data.azurerm_resource_group.autorg.name
  automation_account_name = data.azurerm_automation_account.autoacct.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "This runbook powers VMs off and on based on a schedule"
  runbook_type            = "PowerShellWorkflow"

  publish_content_link {
    uri = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/c4935ffb69246a6058eb24f54640f53f69d3ac9f/101-automation-runbook-getvms/Runbooks/Get-AzureVMTutorial.ps1"
  }
}