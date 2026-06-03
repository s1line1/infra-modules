resource "alicloud_vswitch" "vswitch" {
  vpc_id     = var.vpc_id
  cidr_block = var.vswitch_cidr
  zone_id    = var.vswitch_zone
  vswitch_name = "${var.vpc_name}-vsw"
}