resource "azurerm_linux_virtual_machine" "pardeeplinuxvm" {
    for_each = var.pardeepvm
    name = each.key
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    size = each.value.size
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
    network_interface_ids = [data.azurerm_network_interface.nicdatablock[each.key].id,]
    os_disk {
      caching = each.value.caching
      storage_account_type = each.value.storage_account_type
    }
    source_image_reference {
      version = each.value.version
      sku = each.value.sku
      offer = each.value.offer
      publisher = each.value.publisher
    }
}