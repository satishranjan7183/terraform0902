resource "azurerm_network_interface" "pardeepnic" {
  for_each = var.pardeepnicmap
  name = each.key
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name = each.value.ip_confname
    private_ip_address_allocation = each.value.private_ip_address_allocation
    subnet_id = data.azurerm_subnet.datasubnet[each.key].id
  }
}