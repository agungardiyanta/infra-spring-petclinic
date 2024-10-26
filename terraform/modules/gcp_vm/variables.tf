variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the VM"
  type        = string
  default = "e2-standard-4"
}

variable "zone" {
  description = "Zone for the VM"
  type        = string
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
}

variable "disk_type" {
  description = "Disk type (pd-standard or pd-ssd)"
  type        = string
}

variable "image" {
  description = "OS Image for the instance"
  type        = string
}

variable "tags" {
  description = "Tags for the instance"
  type        = list(string)
  default     = ["petclinic"]
}
