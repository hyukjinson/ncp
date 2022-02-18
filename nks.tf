###### NKS Cluster ######

data "ncloud_nks_versions" "version" {
  filter {
    name = "value"
    values = ["1.20"]
    regex = true
  }
}

resource "ncloud_login_key" "loginkey" {
  key_name = "sample-login-key"
}

resource "ncloud_nks_cluster" "cluster" {
  cluster_type                = "SVR.VNKS.STAND.C002.M008.NET.SSD.B050.G002"
  k8s_version                 = data.ncloud_nks_versions.version.versions.0.value
  login_key_name              = ncloud_login_key.loginkey.key_name
  name                        = "nks-cluster"
  lb_private_subnet_no        = ncloud_subnet.lb-sbn-prd.id
  kube_network_plugin         = "cilium"
  subnet_no_list              = [ ncloud_subnet.nks-sbn-prd.id ]
  vpc_no                      = ncloud_vpc.prd-vpc.id
  zone                        = "KR-1"
  log {
    audit = true
  }
}

###### NKS Node Pool ######

resource "ncloud_nks_node_pool" "node_pool" {
  cluster_uuid   = ncloud_nks_cluster.cluster.uuid
  node_pool_name = "node-pool"
  node_count     = 1
  product_code   = "SVR.VSVR.HICPU.C002.M004.NET.SSD.B050.G002"
  subnet_no      = ncloud_subnet.nks-sbn-prd.id
  autoscale {
    enabled = true
    min = 1
    max = 10
  }
}
