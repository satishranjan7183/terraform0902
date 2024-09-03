data "azurerm_network_interface" "nicdatablock" {
  for_each = var.pardeepvm
  name = each.value.datanicblockname
  resource_group_name = each.value.resource_group_name
}