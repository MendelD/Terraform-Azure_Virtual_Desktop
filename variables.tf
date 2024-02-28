# Create variables
variable "company" {
  type        = string
  description = "Company short-name"
}

variable "location" {
  type        = string
  description = "Default Azure Region"
}

variable "location_westeurope" {
  type        = string
  description = "West Europe Azure Region"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to be applied to all resources"
}

variable "prefix" {
  type        = string
  description = "Naming prefix on resources"
}