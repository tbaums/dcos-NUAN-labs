# Used to determine your public IP for forwarding rules
data "http" "whatismyip" {
  url = "http://whatismyip.akamai.com/"
}

provider "aws" {
 region = "us-east-1"
}

module "dcos" {
  source = "dcos-terraform/dcos/aws"

  subnet_range = "172.16.0.0/16"

  dcos_instance_os    = "centos_7.5"
  cluster_name        = "mtb-workshop"
  ssh_public_key_file = "workshop.id_rsa.pub"
  admin_ips           = ["0.0.0.0/0"]

  num_masters        = "1"
  # num_private_agents = "4"
  num_private_agents = "1"
  num_public_agents  = "1"

  bootstrap_instance_type = "t2.medium"
  public_agents_instance_type = "m5.xlarge"
  # private_agents_instance_type = "c5.4xlarge"
  private_agents_instance_type = "m5.xlarge"
  masters_instance_type = "m5.xlarge"
  dcos_version = "1.12.1"

  # dcos_variant = "open"
  dcos_variant = "ee"
  dcos_license_key_contents = "${file("license.txt")}"

  tags = {workshop = "MTBank"} 

  public_agents_additional_ports = ["6090", "6443", "7443", "3000", "9090", "9093", "9091", "30443"]

  dcos_superuser_username = "admin"

  dcos_superuser_password_hash = "$6$rounds=656000$3/4kWPCJ3Cdk.Xas$5XANsC7vyLdGnPDe7euYJUhowoHDWA/0182ttTt8Lw3pZd4DzZgAz3R6v/.5oe9IJvOLl2bGFeM/g74qc9Vmz."
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