### Route Table 확인할 것 ### 

######## VPC ########

resource "ncloud_vpc" "shared-vpc" {
  ipv4_cidr_block = "10.0.0.0/16"
  name            = "shared-vpc"
}

resource "ncloud_vpc" "prd-vpc" {
  ipv4_cidr_block = "172.16.0.0/16"
  name            = "prd-vpc"
}

######## Subnet ########

resource "ncloud_subnet" "pub-sbn-shared" {
  vpc_no         = ncloud_vpc.shared-vpc.id
  subnet         = "10.0.1.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.shared-vpc.default_network_acl_no
  subnet_type    = "PUBLIC"
  // below fields is optional
  name           = "pub-sbn-shared"
  usage_type     = "GEN"
}

resource "ncloud_subnet" "pub-sbn-prd" {
  vpc_no         = ncloud_vpc.prd-vpc.id
  subnet         = "172.16.1.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.prd-vpc.default_network_acl_no
  subnet_type    = "PUBLIC"
  // below fields is optional
  name           = "pub-sbn-prd"
  usage_type     = "GEN"
}

resource "ncloud_subnet" "lb-sbn-prd" {
  vpc_no         = ncloud_vpc.prd-vpc.id
  subnet         = "172.16.2.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.prd-vpc.default_network_acl_no
  subnet_type    = "PRIVATE"
  // below fields is optional
  name           = "lb-sbn-prd"
  usage_type     = "LOADB"
}

resource "ncloud_subnet" "pri-sbn-prd" {
  vpc_no         = ncloud_vpc.prd-vpc.id
  subnet         = "172.16.3.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.prd-vpc.default_network_acl_no
  subnet_type    = "PRIVATE"
  // below fields is optional
  name           = "pri-sbn-prd"
  usage_type     = "GEN"
}

resource "ncloud_subnet" "nks-sbn-prd" {
  vpc_no         = ncloud_vpc.prd-vpc.id
  subnet         = "172.16.4.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.prd-vpc.default_network_acl_no
  subnet_type    = "PRIVATE"
  // below fields is optional
  name           = "nks-sbn-prd"
  usage_type     = "GEN"
}

resource "ncloud_subnet" "db-sbn-prd" {
  vpc_no         = ncloud_vpc.prd-vpc.id
  subnet         = "172.16.5.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.prd-vpc.default_network_acl_no
  subnet_type    = "PRIVATE"
  // below fields is optional
  name           = "db-sbn-prd"
  usage_type     = "GEN"
}

###### NAT Gateway ######

resource "ncloud_nat_gateway" "nat-gw" {
  vpc_no      = ncloud_vpc.prd-vpc.id
  zone        = "KR-1"
  // below fields is optional
  name        = "nat-gw"
  description = "nat-gw"

}

###### VPC Peering ######

resource "ncloud_vpc_peering" "shared-to-prd" {
  name          = "shared-to-prd"
  source_vpc_no = ncloud_vpc.shared-vpc.id
  target_vpc_no = ncloud_vpc.prd-vpc.id
}

resource "ncloud_vpc_peering" "prd-to-shared" {
  name          = "prd-to-shared"
  source_vpc_no = ncloud_vpc.prd-vpc.id
  target_vpc_no = ncloud_vpc.shared-vpc.id
}

###### Route Table ######

resource "ncloud_route" "shared-to-prd" {
  route_table_no         = ncloud_route_table.shared-vpc-default-public-table.id
  destination_cidr_block = "172.16.0.0/16"
  target_type            = "VPCPEERING"  // NATGW (NAT Gateway) | VPCPEERING (VPC Peering) | VGW (Virtual Private Gateway).
  target_name            = ncloud_nat_gateway.shared-to-prd.name
  target_no              = ncloud_nat_gateway.shared-to-prd.id
}

resource "ncloud_route" "prd-to-shared" {
  route_table_no         = ncloud_route_table.prd-vpc-default-private-table.id
  destination_cidr_block = "10.0.0.0/16"
  target_type            = "VPCPEERING"  // NATGW (NAT Gateway) | VPCPEERING (VPC Peering) | VGW (Virtual Private Gateway).
  target_name            = ncloud_nat_gateway.prd-to-shared.name
  target_no              = ncloud_nat_gateway.prd-to-shared.id
}

resource "ncloud_route" "private-to-internet" {
  route_table_no         = ncloud_route_table.prd-vpc-default-private-table.id
  destination_cidr_block = "0.0.0.0/0"
  target_type            = "NATGW"  // NATGW (NAT Gateway) | VPCPEERING (VPC Peering) | VGW (Virtual Private Gateway).
  target_name            = ncloud_nat_gateway.nat-gw.name
  target_no              = ncloud_nat_gateway.nat-gw.id
}
