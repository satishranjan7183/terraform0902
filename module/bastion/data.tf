data "azurerm_public_ip" "datablockpip" {
     for_each = var.pardeepbastionmap
  name = each.value.namebastiobpub
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "azurebastionsubnetdata" {
  for_each = var.pardeepbastionmap
  name = each.value.subnetdataname
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}