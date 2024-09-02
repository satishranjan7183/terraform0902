resource "azurerm_resource_group" "pradeeprg" {
  for_each = var.pardeepmap
  name     = each.key
  location = each.value
}