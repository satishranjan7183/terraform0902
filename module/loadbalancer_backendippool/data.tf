data "azurerm_lb" "datablockforlb" {
  for_each = var.lbbackendaddresspoolmap
  name = each.value.lbnamedatablock
  resource_group_name = each.value.resource_group_name
}