resource "azurerm_lb_backend_address_pool_address" "lbbackendipaddress" {
  for_each = var.lbbackendipaddress
  name = each.key
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.backpool[each.key].id
  virtual_network_id = data.azurerm_virtual_machine.vmdata[each.key].id
  ip_address = data.azurerm_lb_backend_address_pool.backpool[each.key].id
}