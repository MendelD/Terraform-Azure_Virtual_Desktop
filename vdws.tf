# Create AVD workspaces
resource "azurerm_virtual_desktop_workspace" "workspace" {
  for_each = local.vdws

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
}