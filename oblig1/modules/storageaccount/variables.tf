variable "rgname" {
  type        = string
  description = "Name of the resource group where all resources will be deployed."
}

variable "location" {
  type        = string
  description = "Azure region where the resources will be deployed."
  default     = "westeurope"
}

variable "saname" {
  type        = string
  description = "Name of the Storage Account to be created."
}

variable "scname" {
  type        = string
  description = "Name of the Storage Container inside the Storage Account."
}
