resource "azurerm_virtual_desktop_host_pool_registration_info" "vdpoolregistration" {
  for_each = local.vdpoolregistration

  hostpool_id     = each.value.hostpool_id
  expiration_date = each.value.expiration_date
}