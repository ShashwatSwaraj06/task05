variable "name" {
  description = "The name of the Traffic Manager profile"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Traffic Manager profile"
  type        = string
}

variable "location" {
  description = "The Azure location where the Traffic Manager profile should exist"
  type        = string
}

variable "routing_method" {
  description = "The routing method of the Traffic Manager profile"
  type        = string
}

variable "endpoints" {
  description = "List of endpoints to add to the Traffic Manager profile"
  type = list(object({
    name    = string
    target  = string
    enabled = bool
  }))
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}