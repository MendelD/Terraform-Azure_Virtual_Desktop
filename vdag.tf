# Create Virtual desktop application groups
resource "azurerm_virtual_desktop_application_group" "vdag" {
  for_each = local.vdag

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  type                = each.value.type
  host_pool_id        = each.value.host_pool_id
  tags                = var.tags
}