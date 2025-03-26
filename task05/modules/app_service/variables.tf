variable "name" {
  description = "The name of the Windows Web App"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Windows Web App"
  type        = string
}

variable "location" {
  description = "The Azure location where the Windows Web App should exist"
  type        = string
}

variable "service_plan_id" {
  description = "The ID of the App Service Plan to use"
  type        = string
}

variable "allowed_ip" {
  description = "IP address to allow access"
  type        = string
}

variable "ip_restriction_rules" {
  description = "IP restriction rules configuration"
  type = list(object({
    name        = string
    priority    = number
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}