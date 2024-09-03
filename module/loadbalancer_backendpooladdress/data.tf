data "azurerm_virtual_network" "vnetpra" {
  for_each = var.lbbackendipaddress
  name = each.value.vnetname
  resource_group_name = each.value.resource_group_name
}

data "azurerm_virtual_machine" "vmdata" {
    for_each = var.lbbackendipaddress
  name = each.value.vmname
  resource_group_name = each.value.resource_group_name
}

data "azurerm_lb" "lbdata" {
    for_each = var.lbbackendipaddress
    name = each.value.lbdataname
    resource_group_name = each.value.resource_group_name
}
data "azurerm_lb_backend_address_pool" "backpool" {
 for_each = var.lbbackendipaddress
  name = each.value.backpoolname
  loadbalancer_id = data.azurerm_lb.lbdata[each.key].id
}


