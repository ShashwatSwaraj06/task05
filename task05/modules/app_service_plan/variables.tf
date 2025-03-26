variable "name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the App Service Plan"
  type        = string
}

variable "location" {
  description = "The Azure location where the App Service Plan should exist"
  type        = string
}

variable "sku" {
  description = "The SKU for the App Service Plan"
  type        = string
}

variable "worker_count" {
  description = "The number of workers (instances) to run"
  type        = number
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}