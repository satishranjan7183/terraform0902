
resource "azurerm_lb_backend_address_pool" "pardeeplbbackendaddresspool" {
  for_each = var.lbbackendaddresspoolmap
  name = each.key
  loadbalancer_id = data.azurerm_lb.datablockforlb[each.key].id
}