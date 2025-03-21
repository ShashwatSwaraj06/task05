variable "name" {
  type        = string
  description = "Name of the Windows Web App"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region location"
}

variable "service_plan_id" {
  type        = string
  description = "ID of the associated App Service Plan"
}

variable "ip_restrictions" {
  type = list(object({
    name        = string
    action      = string
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
  description = "List of IP restriction rules"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}