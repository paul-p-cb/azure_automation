terraform {
  backend "azurerm" {
    storage_account_name = "tfstorkro"
    container_name       = "terraform"
    key                  = "dev.terraform.tfstate"

    # rather than defining this inline, the Access Key can also be sourced
    # from an Environment Variable - more information is available below.
    access_key = "UvrB5BASQ1eCeOZwIHyBRs1bNSPXLcwxdV1SSs2n19Lz/Wsm6f/FUenTYtNjzVPOn2GvYECqqw17ogyJYDDXvw=="
  }
}