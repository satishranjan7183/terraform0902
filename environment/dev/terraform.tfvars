pardeepmapmodule = {
  pardeeprg1 = "canada central"
}
pardeepvnetmapmodule = {
  pardeepvnet1 = {
  location = "canada central"
  address_space = ["10.0.0.0/16"]
  resource_group_name = "pardeeprg1"
}
}

pardeepsubnetmapmodule = {
 pardeepsubnet1 = {
  resource_group_name = "pardeeprg1"
  virtual_network_name = "pardeepvnet1"
  address_prefixes = ["10.0.0.0/19"]
 }

pardeepsubnet2 = {
  resource_group_name = "pardeeprg1"
  virtual_network_name = "pardeepvnet1"
  address_prefixes = ["10.0.32.0/19"]
 }

 pardeepsubnet3 = {
  resource_group_name = "pardeeprg1"
  virtual_network_name = "pardeepvnet1"
  address_prefixes = ["10.0.64.0/19"]
 }

 pardeepsubnet4 = {
  resource_group_name = "pardeeprg1"
  virtual_network_name = "pardeepvnet1"
  address_prefixes = ["10.0.96.0/19"]
 }

 pardeepsubnet5 = {
  resource_group_name = "pardeeprg1"
  virtual_network_name = "pardeepvnet1"
  address_prefixes = ["10.0.128.0/19"]
 }

}

pardeepnicmapmodule = {
 pardeepnic1 = {
  location = "canada central"
  resource_group_name = "pardeeprg1"
  ip_confname = "pardeepipconf"
  private_ip_address_allocation = "static"
  datasubnetname = "datapardeepsub"
  virtual_network_name = "pardeepvnet1"
 }
}
