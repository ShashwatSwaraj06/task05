variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "A map of resource group configurations."
}

variable "app_service_plans" {
  type = map(object({
    name               = string
    resource_group_key = string
    sku                = string
    worker_count       = number
  }))
  description = "A map of App Service Plan configurations."
}

variable "app_services" {
  type = map(object({
    name                 = string
    resource_group_key   = string
    app_service_plan_key = string
  }))
  description = "A map of App Service configurations."
}

variable "traffic_manager_profile_name" {
  type        = string
  description = "Name of the Traffic Manager profile."
}

variable "traffic_manager_routing_method" {
  type        = string
  description = "Routing method for the Traffic Manager profile."
}

variable "traffic_manager_resource_group_key" {
  type        = string
  description = "Resource group key for the Traffic Manager profile."
}

variable "verification_agent_ip" {
  type        = string
  description = "IP address of the verification agent."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources."
}

variable "ip_restrictions" {
  type = list(object({
    name        = string
    action      = string
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
  description = "IP restriction rules for App Services"
}