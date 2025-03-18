variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "app_service_plans" {
  type = map(object({
    name           = string
    resource_group = string
    location       = string
    sku = object({
      tier     = string
      size     = string
      capacity = number
    })
    tags = map(string)
  }))
}

variable "windows_apps" {
  type = map(object({
    name                = string
    resource_group      = string
    location            = string
    app_service_plan_id = string
    tags                = map(string)
  }))
}

variable "traffic_manager_profile" {
  type = object({
    name           = string
    resource_group = string
    location       = string
    ttl            = number
    routing_method = string
    relative_name  = string
    tags           = map(string)
  })
}

variable "traffic_manager_endpoints" {
  type = map(object({
    name           = string
    app_service_id = string
    location       = string
  }))
}

variable "verification_agent_ip" {
  type = string
}