### Public IP 붙이는 방법 확인할 것 ### 

###### Server ######

resource "ncloud_login_key" "loginkey" {
  key_name = "lgcns"                                                                          ################ 키네임 변경
}

resource "ncloud_server" "server" {
  subnet_no                 = ncloud_subnet.pub-sbn-shared.id                                 ################ 서브넷이름 변경
  name                      = "bastion-lnx-svr"                                               ################ 서버네임 변경
  server_image_product_code = "SW.VSVR.OS.LNX64.CNTOS.0708.B050"                              ################ 서버이미지 변경
  login_key_name            = ncloud_login_key.loginkey.key_name
}

data "ncloud_server_product" "product" {
  server_image_product_code = "SW.VSVR.OS.LNX64.CNTOS.0708.B050"                              ################ 서버스펙 변경

  filter {
    name   = "product_code"
    values = ["SSD"]                                                                          ################ 타입변경
    regex  = true
  }

  filter {
    name   = "cpu_count"
    values = ["2"]                                                                            ################ vCPU값 변경
  }

  filter {
    name   = "memory_size"
    values = ["4GB"]                                                                          ################ Memory값 변경
  }

  filter {
    name   = "base_block_storage_size"
    values = ["50GB"]                                                                          ################ 부팅디스크값 변경
  }

  filter {
    name   = "product_type"
    values = ["HICPU"]                                                                         ################ CPU타입 변경
  }
}
