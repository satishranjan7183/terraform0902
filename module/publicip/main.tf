
resource "azurerm_public_ip" "pardeeppip" {
  for_each = var.pardeeppipmap
  name = each.key
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  allocation_method = each.value.allocation_method
}