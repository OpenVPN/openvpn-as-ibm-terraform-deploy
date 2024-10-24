module "vpc" {
  source = "./vpc.tf"
}

module "instance" {
  source = "./instance.tf"
}

module "image" {
  source = "./image.tf"
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}
