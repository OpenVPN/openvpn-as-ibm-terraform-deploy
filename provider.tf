terraform {
  required_version = ">= 1.12"

  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.70.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "ibm" {
  region = var.region
}
