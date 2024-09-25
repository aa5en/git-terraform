variable "rgname" {
  type        = string
  description = "Resouce Group name"
}

variable "location" {
  type        = string
  description = "(optional) describe your variable"
  default     = "westeurope"
}

variable "subnet_id" {
  type        = string
  description = "(optional) describe your variable"
}

variable "vmname" {
  type        = string
  description = "(optional) describe your variable"
}

variable "username" {
  type = string
  description = "(optional) describe your variable"
}

variable "password" {
  type = string
  description = "(optional) describe your variable"
}

variable "nicname" {
  type = string
  description = "(optional) describe your variable"
}

variable "vmpublisher" {
  type = string
  description = "(optional) describe your variable"
  default = "Canonical"
}

variable "vmoffer" {
  type = string
  description = "(optional) describe your variable"
  default = "0001-com-ubuntu-server-jammy"
}
variable "vmsku" {
  type = string
  description = "(optional) describe your variable"
  default = "22_04-lts"
}
variable "vmversion" {
  type = string
  description = "(optional) describe your variable"
  default = "latest"
}

variable "nicipname" {
  type = string
  description = "(optional) describe your variable"
}

variable "public_ip_id" {
  type = string
  description = "(optional) describe your variable"
}

variable "vmsize" {
  type = string
  description = "(optional) describe your variable"
  default = "Standard_F2"
}

variable "nsg_id" {
  type = string
  description = "(optional) describe your variable"
}