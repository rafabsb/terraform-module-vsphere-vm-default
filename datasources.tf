data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_datastore_cluster" "datastore" {
  name          = "${var.vsphere_datastore_cluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vm_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

// template looks up the template to create the virtual machines as.
data "vsphere_virtual_machine" "template" {
  name          = "${var.vm_template_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
