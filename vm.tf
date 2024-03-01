resource "azurerm_windows_virtual_machine" "vm" {
  for_each = local.vm

  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  network_interface_ids = each.value.network_interface_ids
  provision_vm_agent    = each.value.provision_vm_agent
  admin_username        = each.value.admin_username
  admin_password        = each.value.admin_password

  os_disk {
    name                 = each.value.os_disk.name
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}