terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.70.1"
    }
  }
}

provider "ibm" {
  region = var.region
}
