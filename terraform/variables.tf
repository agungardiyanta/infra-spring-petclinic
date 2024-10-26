variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default = "diorama-cloud"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "machine_type" {
  description = "Machine type for the VM"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 50
}

variable "disk_type" {
  description = "Disk type"
  type        = string
  default     = "pd-ssd"
}

variable "image" {
  description = "OS Image"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}
