
resource "azurerm_bastion_host" "pardeepbastion" {
  for_each = var.pardeepbastionmap
  name = each.key
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  ip_configuration {
    name = each.value.ipconfname
    subnet_id = data.azurerm_subnet.azurebastionsubnetdata[each.key].id
    public_ip_address_id = data.azurerm_public_ip.datablockpip[each.key].id
  }
}
