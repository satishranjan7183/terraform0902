pardeepmapmodule = {
  pardeeprg1 = "canada central"
}
pardeepvnetmapmodule = {
  pardeepvnet1 = {
    location            = "canada central"
    address_space       = ["10.0.0.0/16"]
    resource_group_name = "pardeeprg1"
  }
}

pardeepsubnetmapmodule = {
  pardeepsubnet1 = {
    resource_group_name  = "pardeeprg1"
    virtual_network_name = "pardeepvnet1"
    address_prefixes     = ["10.0.0.0/19"]
  }



  AzureBastionSubnet = {
    resource_group_name  = "pardeeprg1"
    virtual_network_name = "pardeepvnet1"
    address_prefixes     = ["10.0.32.0/19"]
  }

  pardeepsubnet3 = {
    resource_group_name  = "pardeeprg1"
    virtual_network_name = "pardeepvnet1"
    address_prefixes     = ["10.0.64.0/19"]
  }

  pardeepsubnet4 = {
    resource_group_name  = "pardeeprg1"
    virtual_network_name = "pardeepvnet1"
    address_prefixes     = ["10.0.96.0/19"]
  }

  pardeepsubnet5 = {
    resource_group_name  = "pardeeprg1"
    virtual_network_name = "pardeepvnet1"
    address_prefixes     = ["10.0.128.0/19"]
  }

}

pardeepnicmapmodule = {
  pardeepnic1 = {
    location                      = "canada central"
    resource_group_name           = "pardeeprg1"
    ip_confname                   = "pardeepipconf"
    private_ip_address_allocation = "static"
    datasubnetname                = "datapardeepsub"
    virtual_network_name          = "pardeepvnet1"
  }
  pardeepnic2 = {
    location                      = "canada central"
    resource_group_name           = "pardeeprg1"
    ip_confname                   = "pardeepipconf"
    private_ip_address_allocation = "static"
    datasubnetname                = "datapardeepsub"
    virtual_network_name          = "pardeepvnet1"
  }
    pardeepnic3 = {
    location                      = "canada central"
    resource_group_name           = "pardeeprg1"
    ip_confname                   = "pardeepipconf"
    private_ip_address_allocation = "static"
    datasubnetname                = "datapardeepsub"
    virtual_network_name          = "pardeepvnet1"
  }
    pardeepnic4 = {
    location                      = "canada central"
    resource_group_name           = "pardeeprg1"
    ip_confname                   = "pardeepipconf"
    private_ip_address_allocation = "static"
    datasubnetname                = "datapardeepsub"
    virtual_network_name          = "pardeepvnet1"
  }
}

pardeeppipmapmodule = {
  pardeeppip1 = {
    resource_group_name = "pardeeprg1"
    location            = "canada central"
    allocation_method   = "Static"
  }
  pardeeppip2 = {
    resource_group_name = "pardeeprg1"
    location            = "canada central"
    allocation_method   = "Static"
  }
}

pardeepvmmapmodule = {
  pardeepvm1 = {
    location             = "canada central"
    resource_group_name  = "pardeeprg1"
    size                 = "Standard_DS1_v2"
    admin_username       = "admin123"
    admin_password       = "admin@123"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    version              = "latest"
    sku                  = "22_04-lts"
    offer                = "0001-com-ubuntu-server-jammy"
    publisher            = "Canonical"
    datanicblockname     = "pardeepnic1"
  }

pardeepbackendvm2 = {
    location             = "canada central"
    resource_group_name  = "pardeeprg1"
    size                 = "Standard_DS1_v2"
    admin_username       = "admin123"
    admin_password       = "admin@123"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    version              = "latest"
    sku                  = "22_04-lts"
    offer                = "0001-com-ubuntu-server-jammy"
    publisher            = "Canonical"
    datanicblockname     = "pardeepnic3"
  }

  pardeepbackendvm3 = {
    location             = "canada central"
    resource_group_name  = "pardeeprg1"
    size                 = "Standard_DS1_v2"
    admin_username       = "admin123"
    admin_password       = "admin@123"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    version              = "latest"
    sku                  = "22_04-lts"
    offer                = "0001-com-ubuntu-server-jammy"
    publisher            = "Canonical"
    datanicblockname     = "pardeepnic4"
  }

}

bastionmapmodule = {
  bastionhost1 = {
    location             = "canada central"
    resource_group_name  = "pardeeprg1"
    ipconfname           = "azureipbastion"
    subnetdataname       = "AzureBastionSubnet"
    virtual_network_name = "pardeepvnet1"
    namebastiobpub       = "pardeeppip1"

  }
}

pradeeplbmapmodule = {
  pardeeplb1 = {
    resource_group_name = "pardeeprg1"
    location            = "canada central"
    sku                 = "Standard"
    frontendipname      = "pardeepfrontendip"
    loadbalancerpip     = "pardeeppip2"
  }
}

lbbackendaddresspoolmapmodule = {
  datablockforlbpool1 = {
    resource_group_name = "pardeeprg1"
    lbnamedatablock = "pardeeplb1"
  }
}

lbbackendipaddressmodule = {
  lbbackendipaddress1 = {
    vnetname= "pardeepvnet1"
    vmname = "pardeepbackendvm3"
    lbdataname = "pardeeplb1"
    backpoolname = "datablockforlbpool1"
    resource_group_name = "pardeeprg1"
  }
    lbbackendipaddress2 = {
    vnetname= "pardeepvnet1"
    vmname = "pardeepbackendvm4"
     lbdataname = "pardeeplb1"
     backpoolname = "datablockforlbpool1"
    resource_group_name = "pardeeprg1"
  }
}

lbprobemapmodule = {
  lbprobemap1 = {
  port = 80
  lbdataname = "http-port"
  resource_group_name = "pardeeprg1"
  backpoolname = "datablockforlbpool1"
  }
}

loadbalancerrulemapmodule = {
  loadbalancerrule1 = {
    protocol = "Tcp"
    frontend_ip_configuration_name = "pardeepfrontendip"
  backend_port  = 80
  frontend_port = 80
  lbdataname = "pardeeplb1"
  backpoolname = "datablockforlbpool1"
  resource_group_name = "pardeeprg1"
  }
} 

