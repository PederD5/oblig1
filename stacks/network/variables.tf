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

variable "location" {
  type        = string
  description = "Azure-regionen ressursene opprettes i."
}

variable "address_space" {
  type        = string
  description = "CIDR-adresserommet til dette miljøets virtuelle nettverk."
}