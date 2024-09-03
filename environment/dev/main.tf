
module "pardeeprgmodule" {
  source     = "../../module/resource_group"
  pardeepmap = var.pardeepmapmodule
}

module "pardeepvnetmodule" {
  source         = "../../module/virtual_net"
  pardeepvnetmap = var.pardeepvnetmapmodule
  depends_on     = [module.pardeeprgmodule]
}

module "pardeepsubnetmodule" {
  source           = "../../module/subnet"
  pardeepsubnetmap = var.pardeepsubnetmapmodule
  depends_on       = [module.pardeepvnetmodule, module.pardeeprgmodule]
}

module "parrdeepvnicmodule" {
  source        = "../../module/nic"
  pardeepnicmap = var.pardeepnicmapmodule
  depends_on    = [module.pardeeprgmodule, module.pardeepsubnetmodule]
}

module "pardeeppipmodule" {
  source        = "../../module/publicip"
  pardeeppipmap = var.pardeeppipmapmodule
  depends_on    = [module.pardeeprgmodule]
}
module "pardeepvmmodule" {
  source     = "../../module/vm"
  pardeepvm  = var.pardeepvmmapmodule
  depends_on = [module.pardeeprgmodule, module.pardeepvnetmodule, module.parrdeepvnicmodule, module.pardeepsubnetmodule]
}

module "bastionmodule" {
  source            = "../../module/bastion"
  pardeepbastionmap = var.bastionmapmodule
  depends_on        = [module.pardeeprgmodule, module.pardeepsubnetmodule, module.pardeeppipmodule, module.parrdeepvnicmodule]
}

module "loadbalancermodule" {
  source       = "../../module/loadbalancer"
  pradeeplbmap = var.pradeeplbmapmodule
  depends_on   = [module.pardeeprgmodule, module.pardeepsubnetmodule]

}

module "loadbalancerbackedpoolmodule" {
  source = "../../module/loadbalancer_backendippool"
lbbackendaddresspoolmap = var.lbbackendaddresspoolmapmodule
depends_on = [ module.pardeeprgmodule, module.loadbalancermodule ]
}

module "loadbalancerpoolip" {
  source = "../../module/loadbalancer_backendpooladdress"
  lbbackendipaddress = var.lbbackendipaddressmodule
  depends_on = [ module.loadbalancerbackedpoolmodule, module.pardeeprgmodule, module.pardeepvnetmodule ]
}

module "lbprobe" {
  source = "../../module/loadbalancer_probe"
  lbprobemap = var.lbprobemapmodule
  depends_on = [ module.loadbalancerpoolip, module.loadbalancermodule, module.pardeeprgmodule ]
}

module "lbproberule" {
  source = "../../module/loadbalancerrule"
  loadbalancerrulemap = var.loadbalancerrulemapmodule
  depends_on = [ module.lbprobe, module.loadbalancermodule ]
}