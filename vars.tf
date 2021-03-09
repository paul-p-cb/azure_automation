variable "automation_rg_name" {
  type        = string
  description = "The name of the Resource Group containing the Automation Account"
}

variable "automation_account_name" {
  type        = string
  description = "The name of the Automation Account"
}

variable "location" {
  type        = string
  description = "The Azure Region"
}