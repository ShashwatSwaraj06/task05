variable "resource_groups" {
  description = "Map of resource groups to create"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  description = "Map of App Service Plans to create"
  type = map(object({
    name               = string
    resource_group_key = string
    worker_count       = number
    sku                = string
  }))
}

variable "app_services" {
  description = "Map of App Services to create"
  type = map(object({
    name                 = string
    resource_group_key   = string
    app_service_plan_key = string
  }))
}

variable "traffic_manager" {
  description = "Traffic Manager configuration"
  type = object({
    name               = string
    resource_group_key = string
    routing_method     = string
  })
}

variable "allowed_ip" {
  description = "IP address to allow access to App Services"
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
  description = "Tags to apply to resources"
  type        = map(string)
}