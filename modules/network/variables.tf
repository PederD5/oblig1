variable "resource_group_name" {
  type        = string
  description = "Navnet på ressursgruppen nettverket opprettes i."
}

variable "location" {
  type        = string
  description = "Azure-regionen nettverket opprettes i."
}

variable "name_prefix" {
  type        = string
  description = "Felles navneprefiks for nettverksressursene."
}

variable "address_space" {
  type        = string
  description = "CIDR-adresserommet til det virtuelle nettverket."
}

variable "subnets" {
  type        = map(number)
  description = "Subnett som skal opprettes, der subnettnavn peker til et netnum."
}