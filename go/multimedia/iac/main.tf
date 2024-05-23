terraform {
  required_version = ">= 0.12"
  backend "local" {
    path = "/home/egui/Dev/grpc/apps/go/multimedia/terraform.tfstate"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

data "terraform_remote_state" "infra" {
  backend = "local"
  config  = {
    path = "/home/egui/terraform/grpc/infra/terraform.tfstate"
  }
}