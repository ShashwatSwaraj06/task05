variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  type = map(object({
    name               = string
    resource_group_key = string
    sku                = string
    worker_count       = number
  }))
}

variable "app_services" {
  type = map(object({
    name                 = string
    resource_group_key   = string
    app_service_plan_key = string
  }))
}

variable "traffic_manager_profile_name" {
  type = string
}

variable "traffic_manager_routing_method" {
  type = string
}

variable "traffic_manager_resource_group_key" {
  type = string
}

variable "verification_agent_ip" {
  type = string
}

variable "tags" {
  type = map(string)
}