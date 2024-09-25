variable "nsgname" {
  type        = string
  description = "Network security group default"
  default     = "nsg-tf-demo-001"
}

variable "vnetname" {
  type        = string
  description = "Virtual network name"
  default     = "vnet-tf-demo-001"
}

variable "rgname" {
  type        = string
  description = "Resouce Group name"
  default     = "rg-tf-demo"
}

variable "location" {
  type        = string
  description = "(optional) describe your variable"
  default     = "westeurope"
}

variable "subnetname" {
    type = string
    description = "(optional) describe your variable"
    default = "subnet-tf-demo-001"
}

variable "public_ip_name" {
  description = "Name of the public IP."
  type        = string
}