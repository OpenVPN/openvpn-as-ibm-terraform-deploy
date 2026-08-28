terraform {
  required_version = ">= 1.12"

  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.87.0"
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
