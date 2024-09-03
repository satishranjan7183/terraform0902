data "azurerm_network_interface" "nicdatablock" {
  for_each = var.pardeepbastionmap
  name = each.value.datanicblocknamebastion
  resource_group_name = each.value.resource_group_name
}

data "azurerm_public_ip" "datablockpip" {
     for_each = var.pardeepbastionmap
  name = each.value.namebastiobpub
  resource_group_name = each.value.resource_group_name
}