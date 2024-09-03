resource "azurerm_lb_probe" "lbprobe" {
  for_each = var.lbprobemap
  name = each.key
  port = each.value.port
  loadbalancer_id = data.azurerm_lb_backend_address_pool.backpool[each.key].id
}