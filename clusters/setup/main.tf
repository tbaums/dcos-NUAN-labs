# Used to determine your public IP for forwarding rules
data "http" "whatismyip" {
  url = "http://whatismyip.akamai.com/"
}

provider "aws" {
 region = "us-west-2"
}

module "dcos" {
  source = "dcos-terraform/dcos/aws"

  subnet_range = "172.16.0.0/16"

  dcos_instance_os    = "centos_7.5"
  cluster_name        = "nuan-workshop-01"
  ssh_public_key_file = "workshop.id_rsa.pub"
  admin_ips           = ["0.0.0.0/0"]

  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  num_masters        = "1"
  num_private_agents = "6"
  num_public_agents  = "1"

  bootstrap_instance_type = "t2.medium"
  public_agents_instance_type = "m5.xlarge"
  private_agents_instance_type = "c5.4xlarge"
  masters_instance_type = "m5.xlarge"
  dcos_version = "1.13.1"
 #  dcos_resolvers      = "\n   - 169.254.169.253"

  # dcos_variant = "open"
  dcos_variant = "ee"
  dcos_license_key_contents = "${file("~/scripts/license.txt")}"

  tags = {owner = "mtanenbaum", expiration = "4h"} 

  public_agents_additional_ports = ["6090", "6443", "7443", "3000", "9090", "9093", "9091", "30001", "30443"]

}

output "masters-ips" {
  value = "${module.dcos.masters-ips}"
}

output "cluster-address" {
  value = "${module.dcos.masters-loadbalancer}"
}

output "public-agents-loadbalancer" {
  value = "${module.dcos.public-agents-loadbalancer}"
}
