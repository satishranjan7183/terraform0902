data "azurerm_lb" "lbdata" {
    for_each = var.lbprobemap
    name = each.value.lbdataname
    resource_group_name = each.value.resource_group_name
}
data "azurerm_lb_backend_address_pool" "backpool" {
 for_each = var.lbprobemap
  name = each.value.backpoolname
  loadbalancer_id = data.azurerm_lb.lbdata[each.key].id
}