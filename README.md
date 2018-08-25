# Kubernetes Node

This folder contains a [Terraform](https://www.terraform.io/) module to deploy a
[kubernetes](https://kubernetes.io/) node in [VMWare VSphere](https://www.vmware.com/products/vsphere.html).

## How do you use this module?

This folder defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this folder:

```hcl
module "vsphere_k8s_node" {
  # TODO: update this to the final URL
  source = "github.com/rafabsb/vsphere-k8s-node.git"


  # ... See vars.tf for the other parameters you must define for the consul-cluster module
}
```

You can find the other parameters in [vars.tf](vars.tf).

## How do you connect to the Consul cluster?

### Using the HTTP API from your own computer

## What's included in this module?

This module creates the following architecture:

![Consul architecture](https://github.com/hashicorp/terraform-azurerm-vault/tree/master/_docs/architecture.png)

## How do you roll out updates?

## What happens if a node crashes?

## Security

Here are some of the main security considerations to keep in mind when using this module:

1.  [Encryption in transit](#encryption-in-transit)
2.  [Encryption at rest](#encryption-at-rest)
3.  [Dedicated instances](#dedicated-instances)
4.  [Security groups](#security-groups)
5.  [SSH access](#ssh-access)
