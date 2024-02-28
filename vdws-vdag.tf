# Associate Workspaces and VDAG
resource "azurerm_virtual_desktop_workspace_application_group_association" "ws-vdag" {
  application_group_id = azurerm_virtual_desktop_application_group.vdag["avd"].id
  workspace_id         = azurerm_virtual_desktop_workspace.vdws["avd"].id
}