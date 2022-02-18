######## Version ########

terraform {
  required_providers {
    ncloud = {
      source = "NaverCloudPlatform/ncloud"
    }
  }
  required_version = ">= 0.13"
}

######## Provider ########

provider "ncloud" {
  #access_key  = var.access_key                                                    ################ 키값 변경
  #secret_key  = var.secret_key                                                    ################ 시크릿값 변경
  region     = "KR"
  #  site        = var.site \\ KR
  support_vpc = "true"
}
