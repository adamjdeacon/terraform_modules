variable machine_type {
  description = "Machine Type"
  type = string
  default = "f1-micro"
}

variable "compute_service_account" {
  default = "810389537738-compute@developer.gserviceaccount.com"
}

variable "num_of_servers" {
  description = "Total Number of servers"
  default = 1
}

variable "customer_name" {
  description = "Name of instance. Must be unique"
  type        = string
}

variable "labels" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Labels."
  type        = list
  default = ["https-server","http-server"]
}