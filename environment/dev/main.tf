
module "pardeeprgmodule" {
  source = "../../module/resource_group"
  pardeepmap = var.pardeepmapmodule
}

module "pardeepvnetmodule" {
  source = "../../module/virtual_net"
  pardeepvnetmap = var.pardeepvnetmapmodule
  depends_on = [ module.pardeeprgmodule ]
}

module "pardeepsubnetmodule" {
  source = "../../module/subnet"
  pardeepsubnetmap = var.pardeepsubnetmapmodule
  depends_on = [ module.pardeepvnetmodule, module.pardeeprgmodule]
}

module "parrdeepvnicmodule" {
  source = "../../module/nic"
  pardeepnicmap = var.pardeepnicmapmodule
  depends_on = [ module.pardeeprgmodule, module.pardeepsubnetmodule ]
}

module "pardeeppipmodule" {
  source = "../../module/publicip"
  pardeeppipmap = var.pardeeppipmapmodule
  depends_on = [ module.pardeeprgmodule ]
}
module "pardeepvmmodule" {
  source = "../../module/vm"
  pardeepvm = var.pardeepvmmapmodule
  depends_on = [module.pardeeprgmodule,module.pardeepvnetmodule,module.parrdeepvnicmodule,module.pardeepsubnetmodule ]
}


module "bastionmodule" {
  source = "../../module/bastion"
  pardeepbastionmap = var.bastionmapmodule
  depends_on = [ module.pardeeprgmodule, module.pardeepsubnetmodule, module.pardeeppipmodule, module.parrdeepvnicmodule ]
}