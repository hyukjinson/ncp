######## VPC ########

resource "ncloud_vpc" "prd-vpc" {
  ipv4_cidr_block = "172.16.0.0/16"
  name            = "prd-vpc"
}

######## Subnet ########



####### Route Table #######
