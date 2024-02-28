# Create Virtual desktop host pools
resource "azurerm_virtual_desktop_host_pool" "vdpool" {
  for_each = local.vdpool

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  type                = each.value.type
  load_balancer_type  = each.value.load_balancer_type
  tags                = var.tags
}