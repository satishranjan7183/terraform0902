
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

