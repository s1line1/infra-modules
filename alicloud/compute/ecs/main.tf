terraform {
  required_providers {
    alicloud = {
      source = "aliyun/alicloud"
    }
  }
}

resource "alicloud_instance" "this" {
  count           = var.ecs_count
  instance_name   = "${var.project_name}-ecs-${count.index}"
  vswitch_id      = var.vswitch_id
  security_groups = [var.security_group_id]
  image_id        = var.image_id
  instance_type   = var.instance_type

  system_disk_category       = var.system_disk_category
  system_disk_size           = var.system_disk_size
  key_name                   = var.key_name
  host_name                  = "${var.project_name}-${count.index}"
  instance_charge_type       = var.instance_charge_type
  internet_charge_type       = var.internet_charge_type
  internet_max_bandwidth_out = var.internet_max_bandwidth_out

  user_data = var.user_data

}
