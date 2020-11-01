variable "username" {}
variable "tenantName" {}
variable "password" {}
variable "region" {}

provider "openstack" {
  user_name   = var.username
  tenant_name = var.tenantName
  password    = var.password
  auth_url    = "http://45.153.243.250:5000/v2.0"
  region      = "var.region"
}

variable "instanceName" {}
variable "imageId" {}
variable "flavorId" {}
variable "networkId" {}

resource "openstack_compute_instance_v2" "Test-Terraform" {
  name      = var.instanceName
  region    = var.region
  flavor_id = var.flavorId

  block_device {
    uuid                  = var.imageId
    source_type           = "image"
    volume_size           = 1
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = false
  }

  network {
    uuid = var.networkId
  }
}
