###### NKS Cluster ######

data "ncloud_nks_versions" "version" {
  filter {
    name = "value"
    values = ["1.20"]                                                                           ################ NKS 버전 변경
    regex = true
  }
}

resource "ncloud_login_key" "loginkey" {
  key_name = "lgcns"                                                                            ################ 서버키값 변경
}

resource "ncloud_nks_cluster" "cluster" {                                                       
  cluster_type                = "SVR.VNKS.STAND.C002.M008.NET.SSD.B050.G002"                    ################ 마스터서버 사이즈 변경
  k8s_version                 = data.ncloud_nks_versions.version.versions.0.value              
  login_key_name              = ncloud_login_key.loginkey.key_name
  name                        = "nks-cluster"                                                   ################ 클러스터명 변경
  lb_private_subnet_no        = ncloud_subnet.lb-sbn-prd.id                                     ################ 클러스터의 LB서브넷 이름 변경
  kube_network_plugin         = "cilium"
  subnet_no_list              = [ ncloud_subnet.nks-sbn-prd.id ]
  vpc_no                      = ncloud_vpc.prd-vpc.id                                           ################ 클러스터 VPC명 변경
  zone                        = "KR-1"                                                          ################ 클러스터 존 변경
  log {
    audit = true
  }
}

###### NKS Node Pool ######

resource "ncloud_nks_node_pool" "node_pool" {
  cluster_uuid   = ncloud_nks_cluster.cluster.uuid
  node_pool_name = "node-pool"                                                                  ################ 클러스터의 노드풀 이름 변경
  node_count     = 1                                                                            ################ 노드풀 개수 변경
  product_code   = "SVR.VSVR.HICPU.C002.M004.NET.SSD.B050.G002"                                 ################ 노드풀 서버 스펙 변경
  subnet_no      = ncloud_subnet.nks-sbn-prd.id                                                 ################ 노드풀 서브넷 이름 변경
  autoscale {
    enabled = true
    min = 1                                                                                     ################ 노드풀 서버 Min 개수 정의(오토스케일링)        
    max = 10                                                                                    ################ 노드풀 서버 Max 개수 정의(오토스케일링)
  }
}
