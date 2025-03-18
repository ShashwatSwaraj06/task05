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
  description = "A map of App Service Plans with properties such as name, location, SKU configuration, capacity, and associated tags."
}

variable "windows_apps" {
  type = map(object({
    name                = string
    resource_group      = string
    location            = string
    app_service_plan_id = string
    tags                = map(string)
  }))
  description = "A map of Windows Web Apps, containing the app name, associated resource group, location, linked app service plan ID, and tags."
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
  description = "Traffic Manager Profile configuration, specifying the name, resource group, TTL, routing method, DNS name, and tags."
}

variable "traffic_manager_endpoints" {
  type = map(object({
    name           = string
    app_service_id = string
    location       = string
  }))
  description = "A map of Traffic Manager endpoints, with each entry including the endpoint name, associated app ID, and location."
}

variable "verification_agent_ip" {
  type        = string
  description = "The IP address of the verification agent used to test access restrictions for the App Services."
}

variable "ip_restrictions" {
  type = list(object({
    name        = string
    ip_address  = string
    service_tag = string
    priority    = number
  }))
  description = "A list of IP restrictions that define network restrictions for App Services, including IP address, service tag, and priority."
}