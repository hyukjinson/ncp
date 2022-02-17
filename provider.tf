###### Provider Information ######

terraform {
  required_providers {
    ncloud = {
      source = "NaverCloudPlatform/ncloud"
    }
  }
  required_version = ">= 0.13"
}

// Configure the ncloud provider
provider "ncloud" {
  #access_key  = var.access_key
  #secret_key  = var.secret_key
  region     = "KR"
  #  site        = var.site \\ KR
  support_vpc = "true"
}
