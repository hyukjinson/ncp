### Public IP 붙이는 방법 확인할 것 ### 

###### Server ######

resource "ncloud_login_key" "loginkey" {
  key_name = "lgcns"
}

resource "ncloud_server" "server" {
  subnet_no                 = ncloud_subnet.pub-sbn-shared.id
  name                      = "bastion-lnx-svr"
  server_image_product_code = "SW.VSVR.OS.LNX64.CNTOS.0708.B050"
  login_key_name            = ncloud_login_key.loginkey.key_name
}

data "ncloud_server_product" "product" {
  server_image_product_code = "SW.VSVR.OS.LNX64.CNTOS.0708.B050"

  filter {
    name   = "product_code"
    values = ["SSD"]
    regex  = true
  }

  filter {
    name   = "cpu_count"
    values = ["2"]
  }

  filter {
    name   = "memory_size"
    values = ["4GB"]
  }

  filter {
    name   = "base_block_storage_size"
    values = ["50GB"]
  }

  filter {
    name   = "product_type"
    values = ["HICPU"]
  }
}
