variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
  description = "A map of Resource Groups. Each group includes name, location, and associated tags."
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
  description = "A map of App Service Plans with properties such as name, location, SKU configuration, and associated tags."
}

variable "windows_apps" {
  type = map(object({
    name                = string
    resource_group      = string
    location            = string
    app_service_plan_id = string
    tags                = map(string)
  }))
  description = "A map of Windows Web Apps with properties including app name, resource group, location, associated app service plan, and tags."
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
  description = "Traffic Manager Profile configurations, including the profile name, associated resource group, routing method, and DNS settings."
}

variable "traffic_manager_endpoints" {
  type = map(object({
    name           = string
    app_service_id = string
    location       = string
  }))
  description = "A map of Traffic Manager endpoints, each containing the endpoint name, ID of the associated App Service, and location."
}

variable "verification_agent_ip" {
  type        = string
  description = "The IP address of the verification agent that tests access restrictions for the Web Apps."
}

variable "ip_restrictions" {
  type = list(object({
    name        = string
    ip_address  = string
    service_tag = string
    priority    = number
  }))
  description = "A list of IP restriction rules applied to the App Services, including the IP address, Azure service tag, and priority."
}