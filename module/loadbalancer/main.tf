variable "pradeeplbmap" {
  type = map(any)
}
resource "azurerm_lb" "pardeeplb" {
for_each = var.pradeeplbmap
  name = each.key
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  sku = each.value.sku
  frontend_ip_configuration {
    name = each.value.frontendipname
    public_ip_address_id = data.azurerm_public_ip.datablockpip[each.key].id
  }

}