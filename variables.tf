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

variable "rfc3339" {
  type        = string
  description = "Registration token expiration"
}

variable "vm_size" {
  type        = string
  description = "Size of the machine to deploy"
}

variable "admin_username" {
  type        = string
  description = "VM Admin username"
}

variable "admin_password" {
  type        = string
  description = "VM Admin password"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}

variable "client_id" {
  type        = string
  description = "Terraform Service Principal client ID"
}

variable "client_secret" {
  type        = string
  description = "Terraform Service Principal client secret"
}