terraform {
  backend "gcs" {
    bucket      = "tf-state-prod-infr"
    prefix      = "terraform/test-state"
    credentials = "keys/infra.json"
  }
}


provider "google" {
  credentials = file("./keys/infra.json")
  project     = "infrastructure-253908"
  region      = "europe-west2"
  zone        = "europe-west2-c"
}

module "customer-1" {
  source = "./modules/compute"

  customer_name = "test1"
  machine_type = "f1-micro"
  
  labels = {
    terraform   = "true"
    environment = "dev"
  }
}

module "customer-2" {
  source = "./modules/compute"

  customer_name = "test2"
  #machine_type = "e2-standard-2"
  
  labels = {
    terraform   = "true"
    environment = "prod"
  }

  tags = [
    "http-server",
    "https-server",
    "bob"
  ]
}