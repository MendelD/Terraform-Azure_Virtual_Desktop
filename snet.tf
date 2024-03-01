# Create multiple subnets
resource "azurerm_subnet" "snet" {
  for_each = local.snet

  name                 = each.value.name
  address_prefixes     = each.value.address_prefixes
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name

  service_endpoints = each.value.service_endpoints
}