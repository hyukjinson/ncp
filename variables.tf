variable "access_key" { # export TF_VAR_access_key=...
  default = ""
}

variable "secret_key" { # export TF_VAR_secret_key=...
  default = ""
}

variable "region" {
  default = "KR"
}

variable "ncloud_zones" {
  default = ["KR-1", "KR-2"]
}

# centos 7.3
variable "server_image_centos7_3" {
  default = "SW.VSVR.OS.LNX64.CNTOS.0703.B050"
}

# centos 7.8
variable "server_image_centos7_8" {
  default = "SW.VSVR.OS.LNX64.CNTOS.0708.B050"
}

# ubuntu 16.04
variable "server_image_ubuntu16_04" {
  default = "SW.VSVR.OS.LNX64.UBNTU.SVR1604.B050"
}

# ubuntu 18.04
variable "server_image_ubuntu18_04" {
  default = "SW.VSVR.OS.LNX64.UBNTU.SVR1804.B050"
}

# tomcat centos 7.8
variable "server_image_tomcat_centos7_8" {
  default = "SW.VSVR.APP.LNX64.CNTOS.0708.TOMCAT.B050"
}

# tomcat ubuntu 16.04
variable "server_image_tomcat_ubuntu16_04" {
  default = "SW.VSVR.APP.LNX64.UBNTU.SVR1604.TOMCAT.B050"
}

#standard, cpu 2, Memory 8GB, Disk 50,
variable "server_product_standard_2cpu" {
  default = "SVR.VSVR.STAND.C002.M008.NET.SSD.B050.G002"
}

#standard, cpu 4, Memory 16GB, Disk 50,
variable "server_product_standard_4cpu" {
  default = "SVR.VSVR.STAND.C004.M016.NET.SSD.B050.G002"
}

#standard, cpu 8, Memory 32GB, Disk 50,
variable "server_product_standard_8cpu" {
  default = "SVR.VSVR.STAND.C008.M032.NET.SSD.B050.G002"
}

#standard, cpu 32, Memory 128GB, Disk 50,
variable "server_product_standard_32cpu" {
  default = "SVR.VSVR.STAND.C032.M128.NET.SSD.B050.G002"
}


#HICPU, cpu 2, Memory 4GB, Disk 50,
variable "server_product_hicpu_2cpu" {
  default = "SVR.VSVR.HICPU.C002.M004.NET.SSD.B050.G002"
}

#HICPU, cpu 4, Memory 8GB, Disk 50,
variable "server_product_hicpu_4cpu" {
  default = "SVR.VSVR.HICPU.C004.M008.NET.SSD.B050.G002"
}

#HICPU, cpu 8, Memory 16GB, Disk 50,
variable "server_product_hicpu_8cpu" {
  default = "SVR.VSVR.HICPU.C008.M016.NET.SSD.B050.G002"
}

#HIMemory, cpu 2, Memory 16GB, Disk 50,
variable "server_product_himem_2cpu" {
  default = "SVR.VSVR.HIMEM.C002.M016.NET.SSD.B050.G002"
}

#HIMemory, cpu 32, Memory 256GB, Disk 50,
variable "server_product_himem_32cpu" {
  default = "SVR.VSVR.HIMEM.C032.M256.NET.SSD.B050.G002"
}

#Kubernetes Cluster type for Maximum number of  10 nodes : standard, cpu 2, Memory 8GB, Disk 50,
variable "k8s_cluster_type_max_10ea" {
  default = "SVR.VNKS.STAND.C002.M008.NET.SSD.B050.G002"
}

#Kubernetes Cluster type for Maximum number of  50 nodes : standard, cpu 4, Memory 16GB, Disk 50,
variable "k8s_cluster_type_max_50ea" {
  default = "SVR.VNKS.STAND.C004.M016.NET.SSD.B050.G002"
}

// list_image = {
//   "SW.VSVR.APP.LNX64.CNTOS.0703.PINPT.173.B050" = "Pinpoint(1.7.3)-centos-7.3-64"
//   "SW.VSVR.OS.LNX64.CNTOS.0703.B050" = "centos-7.3-64"
//   "SW.VSVR.OS.LNX64.CNTOS.0708.B050" = "CentOS 7.8 (64-bit)"
//   "SW.VSVR.OS.LNX64.UBNTU.SVR1604.B050" = "ubuntu-16.04-64-server"
//   "SW.VSVR.OS.LNX64.UBNTU.SVR1804.B050" = "ubuntu-18.04-64-server"
//   "SW.VSVR.OS.WND64.WND.SVR2016EN.B100" = "Windows Server 2016 (64-bit) English Edition"
// }

// products = {
//   "SVR.VSVR.STAND.C002.M008.NET.SSD.B050.G002" = "standard, vCPU 2EA, Memory 8GB, [SSD]Disk 50GB"
//   "SVR.VSVR.HICPU.C002.M004.NET.SSD.B050.G002" = "hi cpu, vCPU 2EA, Memory 4GB, [SSD]Disk 50GB"
//   "SVR.VSVR.HIMEM.C002.M016.NET.SSD.B050.G002" = "hi Memory, vCPU 2EA, Memory 16GB, [SSD]Disk 50GB"
// }

#ncloud init script
#variable "init-script-utm1_no" {
#  default = "SVR.VSVR.HICPU.C002.M004.NET.SSD.B050.G002"
#}
