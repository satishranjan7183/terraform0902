resource "azurerm_virtual_network" "pardeepvnet" {
  for_each = var.pardeepvnetmap
  name = each.key
  location = each.value.location
  address_space = each.value.address_space
  resource_group_name = each.value.resource_group_name
}