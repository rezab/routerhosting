variable "username" {}
variable "tenantName" {}
variable "password" {}
variable "region" {}

provider "openstack" {
  user_name   = var.username
  tenant_name = var.tenantName
  password    = var.password
  auth_url    = "http://45.153.243.250:5000/v3"
  region      = "var.region"
}

variable "instanceName" {}
variable "imageId" {}
variable "flavorId" {}
variable "networkId" {}

resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = var.imageId
  flavor_id       = var.flavorId
  security_groups = ["default"]

  network {
    uuid = var.networkId
  }
}
