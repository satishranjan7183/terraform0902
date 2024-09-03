resource "azurerm_lb_rule" "lbrule" {
  for_each = var.loadbalancerrulemap
  name = each.key
  loadbalancer_id = data.azurerm_lb_backend_address_pool.backpool[each.key].id
  protocol = each.value.protocol
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  backend_port = each.value.backend_port
  frontend_port = each.value.frontend_port
}