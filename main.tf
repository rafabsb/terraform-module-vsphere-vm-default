terraform {
  required_version = ">= 0.11.6"
}

provider "vsphere" {
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  vsphere_server       = "${var.vsphere_server}"
  user                 = "${var.vsphere_user}"
  password             = "${var.vsphere_user_password}"
}

resource "vsphere_virtual_machine" "vm" {
  count                = "${length(var.vm_ips)}"
  name                 = "${var.vm_hostname}${count.index}"
  resource_pool_id     = "${data.vsphere_resource_pool.pool.id}"
  datastore_cluster_id = "${data.vsphere_datastore_cluster.datastore.id}"

  num_cpus          = "${var.vm_cpus}"
  memory            = "${var.vm_memory}"
  guest_id          = "${data.vsphere_virtual_machine.template.guest_id}"
  nested_hv_enabled = "${var.nested_hv_enabled}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk1"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  disk {
    label       = "disk2"
    size        = "${var.disk2_size}"
    unit_number = 1
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.vm_hostname}${count.index}"
        domain    = "${var.network_domain}"
      }

      network_interface {
        ipv4_address = "${element(var.vm_ips, count.index)}"
        ipv4_netmask = "${var.ipv4_netmask}"
      }

      ipv4_gateway = "${var.vm_network_gateway}"

      # dns_suffix_list = ["${var.dns_suffix_list}"]
      dns_server_list = ["${var.dns_server_list}"]
    }
  }

# connection {
#   type     = "ssh"
#   user     = "${var.vm_user}"
#   password = "${var.vm_password}"
# }
#
# # install and mount additional disks.
# provisioner "remote-exec" {
#   inline = [
#     "sudo sed -i 's/#Port 22/Port 22\\nPort ${var.secondary_sshd_port}/' /etc/ssh/sshd_config",
#     "systemctl restart sshd",
#   ]
# }


  # provisioner "remote-exec" {
  #   inline = [
  #     "vgchange -ay",
  #     "pvcreate ${var.device_path}",
  #     "vgcreate ${var.vg_name} ${var.device_path}",
  #     "lvcreate --name volume1 -l 100%FREE ${var.vg_name}",
  #     "mkfs.ext4 /dev/${var.vg_name}/volume1",
  #     "mkdir -p ${var.filesystem_path}",
  #     "echo /dev/${var.vg_name}/volume1 ${var.filesystem_path} ext4 defaults 0 0 >> /etc/fstab",
  #     "mount ${var.filesystem_path}",
  #   ]
  # }
}
