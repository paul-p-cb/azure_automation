provider "azurerm" {
version    = ">=2.25.0"
skip_provider_registration = "true"
features {}

}

resource "azurerm_automation_module" "azaccount" {
  name                    = "AzAccounts"
  resource_group_name     = data.azurerm_resource_group.autorg.name
  automation_account_name = data.azurerm_automation_account.autoacct.name

  module_link {
    uri = "https://www.powershellgallery.com/api/v2/package/Az.Accounts/2.2.6.nupkg"
  }
}

resource "azurerm_automation_module" "azcompute" {
  name                    = "AzCompute"
  resource_group_name     = data.azurerm_resource_group.autorg.name
  automation_account_name = data.azurerm_automation_account.autoacct.name

  module_link {
    uri = "https://www.powershellgallery.com/api/v2/package/Az.Compute/4.10.0.nupkg"
  }

  depends_on = [
      azurerm_automation_module.azaccount
      ]
}

resource "azurerm_automation_module" "azresources" {
  name                    = "AzResources"
  resource_group_name     = data.azurerm_resource_group.autorg.name
  automation_account_name = data.azurerm_automation_account.autoacct.name

  module_link {
    uri = "https://www.powershellgallery.com/api/v2/package/Az.Resources/3.3.0.nupkg"
  }
    depends_on = [
      azurerm_automation_module.azaccount
      ]
}