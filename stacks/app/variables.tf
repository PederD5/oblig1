variable "environment" {
  type        = string
  description = "Miljøet som rulles ut, for eksempel dev eller test."
}

variable "shortname" {
  type        = string
  description = "Personlig kortnavn brukt i Azure-ressursnavn."
}

variable "project" {
  type        = string
  description = "Prosjektnavn brukt i ressursnavn."
}

variable "backend_resource_group_name" {
  type        = string
  description = "Ressursgruppen som inneholder Terraform-state."
}

variable "backend_storage_account_name" {
  type        = string
  description = "Storage account som inneholder Terraform-state."
}

variable "backend_container_name" {
  type        = string
  description = "Containeren som inneholder Terraform-state."
}