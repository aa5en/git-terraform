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

variable "subnet_id" {
  type        = string
  description = "(optional) describe your variable"
  default     = ""
}

variable "vmssname" {
  type        = string
  description = "(optional) describe your variable"
  default     = "vmss-tf-demo-001"
}
variable "instances" {
  type = string
  description = "Number of VMs to run in scaleset"
}

variable "username" {
  type = string
  description = "(optional) describe your variable"
}

variable "password" {
  type = string
  description = "(optional) describe your variable"
}