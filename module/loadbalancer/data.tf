data "azurerm_public_ip" "datablockpip" {
     for_each = var.pradeeplbmap
  name = each.value.loadbalancerpip
  resource_group_name = each.value.resource_group_name
}