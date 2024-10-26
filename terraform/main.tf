provider "google" {
  project = var.project_id
  region  = var.region
}

module "petclinic_vm" {
  source          = "./modules/gcp_vm"
  instance_name   = "petclinic-vm"
  machine_type    = "e2-standard-4"
  zone            = var.zone
  disk_size       = var.disk_size
  disk_type       = var.disk_type
  image           = var.image
  tags            = ["https-server", "http-server"]
}
