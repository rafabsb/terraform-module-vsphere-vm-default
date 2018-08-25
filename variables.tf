variable "allow_unverified_ssl" {
  type        = "string"
  default     = "true"
  description = "allow_unverified_ssl when interacting with providers."
}

variable "service_name" {
  type        = "string"
  default     = "default"
  description = "name of the service that provisioned the infra."
}

variable "vsphere_server" {
  type        = "string"
  description = "The address of vshpere/vcenter api. If HTTPS and cert is untrust, allow_unverified_ssl must be true."
}

variable "vsphere_user" {
  type        = "string"
  description = "Login user name to access vsphere."
}

variable "vsphere_user_password" {
  type        = "string"
  description = "Login user password to access vsphere."
}

# variable "secondary_sshd_port" {
#   type        = "string"
#   description = "secondary sshd port"
#   default     = "30022"
# }

# variable "device_path" {
#   type        = "string"
#   description = "provisioner var: the device path of the additional attached disk"
#   default     = "/dev/sdb"
# }

# variable "filesystem_path" {
#   type        = "string"
#   description = "provisioner var: the filesystem path to mount the device of additional disk."
# }

# variable "vg_name" {
#   type        = "string"
#   description = "provisioner var: volume group name of the additional disk attached."
#   default     = "commondata"
# }
#
# variable "vm_user" {
#   type        = "string"
#   description = "provisioner var: user login name into vm to enable terraform provisioner execute shell script."
# }
#
# variable "vm_password" {
#   type        = "string"
#   description = "provisioner var: user password for terraform provisioner."
# }

variable "disk2_size" {
  type        = "string"
  description = "the size of aditional disk attached to the vm."
}

variable "vm_hostname" {
  type        = "string"
  description = "The hostname prefix of VMs. Will be concatenated with #index number. Multiple VMs."
}

variable "vm_cpus" {
  type        = "string"
  description = "Amount of allocated CPU cores per node."
}

variable "vm_memory" {
  type        = "string"
  description = "Amount of allocated Memory per node."
}

variable "vm_template_name" {
  type        = "string"
  description = "Name of the VM Template that will be cloned by VSphere"
}

variable "vsphere_resource_pool" {
  type        = "string"
  description = "The resource pool in vsprhere where the VMs will be instantiated."
}

variable "vsphere_datastore_cluster" {
  type        = "string"
  description = "Datastore cluster where disks will be allocated."
}

variable "vsphere_datacenter" {
  type        = "string"
  description = "VSphere datacenter where the resources will be allocated."
}

variable "vm_ips" {
  type        = "list"
  description = "The list of IPv4 allocated to instantiate VMs. The # of IPs will be the total number of VMs instantiated"
}

variable "ipv4_netmask" {
  type        = "string"
  description = "The IPv4 subnet mask, in bits (example: 24 for 255.255.255.0)."
}

variable "vm_network" {
  type        = "string"
  description = "VSphere Port Group (vlan) where the IPv4 of VMs got allocated."
}

variable "vm_network_gateway" {
  type        = "string"
  description = "Gateway of the vlan where the vm IPs got allocated."
}

variable "network_domain" {
  type        = "string"
  description = "Network Domain where VMs will be instantiated"
}

variable "dns_server_list" {
  type        = "list"
  description = "The list of DNS servers to configure on a virtual machine."
}

# variable "dns_suffix_list" {
#   type        = "list"
#   description = "A list of DNS search domains to add to the DNS configuration on the virtual machine."
# }

variable "nested_hv_enabled" {
  type        = "string"
  default     = "false"
  description = "Enable nested hardware virtualization on this virtual machine, facilitating nested virtualization in the guest."
}
