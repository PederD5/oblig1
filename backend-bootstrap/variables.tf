variable "shortname" {
  type        = string
  description = "Personlig kortnavn brukt for å gjøre backend-ressursene unike."
}

variable "location" {
  type        = string
  description = "Azure-regionen backend-ressursene opprettes i."
}

variable "service_principal_object_id" {
  type        = string
  description = "Object ID til service principalen som brukes av GitHub Actions."
}