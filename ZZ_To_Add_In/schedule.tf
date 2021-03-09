resource "azurerm_automation_schedule" "vmstartup" {
  name                    = "vm-startup-schedule"
  resource_group_name     = data.azurerm_resource_group.example.name
  automation_account_name = data.azurerm_automation_account.example.name
  frequency               = "Day"
  interval                = 1
  timezone                = "America/New_York"
  start_time              = "2021-03-09T18:00:00"
  description             = "Demo Start Time"
}

resource "azurerm_automation_schedule" "vmshutdown" {
  name                    = "vm-startup-schedule"
  resource_group_name     = data.azurerm_resource_group.example.name
  automation_account_name = data.azurerm_automation_account.example.name
  frequency               = "Day"
  interval                = 1
  timezone                = "America/New_York"
  start_time              = "2021-03-09T18:10:00"
  description             = "Demo Stop Time"
}


resource "azurerm_automation_job_schedule" "vm_job_startup" {
  resource_group_name     = data.azurerm_resource_group.example.name
  automation_account_name = data.azurerm_automation_account.example.name
  schedule_name           = azurerm_automation_schedule.vmstartup
  runbook_name            = azurerm_automation_runbook.togglevmpower

  parameters = {
    TagName    = "power-mgmt"
    TagValue   = "enabled"
    Shutdown   = "False"
  }
}

resource "azurerm_automation_job_schedule" "vm_job_shutdown" {
  resource_group_name     = data.azurerm_resource_group.example.name
  automation_account_name = data.azurerm_automation_account.example.name
  schedule_name           = azurerm_automation_schedule.vmshutdown
  runbook_name            = azurerm_automation_runbook.togglevmpower

  parameters = {
    TagName    = "power-mgmt"
    TagValue   = "enabled"
    Shutdown   = "True"
  }
}