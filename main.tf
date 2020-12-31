terraform {
  required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.2"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}


resource "libvirt_volume" "centos7" {
  name = "centos7.qcow2"
  pool = "default"
  source = "/media/DATA/centos7-base-img/centos7-base.qcow2"
  format = "qcow2"
}

resource "libvirt_volume" "centos7_raid1" {
  name   = "centos7_raid1.qcow2"
  pool   = "default"
  source = "/media/DATA/centos7-base-img/centos7-base.qcow2-1"
  format = "qcow2"
}



resource "libvirt_domain" "test" {
  name   = "test-centos7"
  memory = "4096"
  vcpu   = 1


  disk {
    volume_id = libvirt_volume.centos7.id
  }

  disk {
    volume_id = libvirt_volume.centos7_raid1.id
  }


  network_interface {
    network_name = "default"
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = "true"
  }

}
