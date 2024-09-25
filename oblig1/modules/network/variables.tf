variable "nsgname" {
  type        = string
  description = "Network security group default"
}

variable "vnetname" {
  type        = string
  description = "Virtual network name"
}

variable "rgname" {
  type        = string
  description = "Resouce Group name"
}

variable "location" {
  type        = string
  description = "(optional) describe your variable"
  default     = "westeurope"
}

variable "subnetname" {
    type = string
    description = "(optional) describe your variable"
}

variable "public_ip_name" {
  description = "Name of the public IP."
  type        = string
}