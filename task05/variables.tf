variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
  description = "Defines the resource groups with name, location, and tags."
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
  description = "Defines the App Service Plans with name, location, SKU configuration, and associated tags."
}

variable "windows_apps" {
  type = map(object({
    name                = string
    resource_group      = string
    location            = string
    app_service_plan_id = string
    tags                = map(string)
  }))
  description = "Defines the Windows Web Apps with name, resource group, location, associated App Service Plan ID, and tags."
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

  description = "Defines the Traffic Manager Profile properties with TTL, routing method, and tags."
}

variable "traffic_manager_endpoints" {
  type = map(object({
    name           = string
    app_service_id = string
    location       = string
  }))
  description = "Defines Traffic Manager endpoints with names, associated App Service IDs, and locations."
}

variable "verification_agent_ip" {
  type        = string
  description = "The IP address of the verification agent used to test access restrictions on the Web Apps."
}

variable "ip_restrictions" {
  type = list(object({
    name        = string
    ip_address  = string
    service_tag = string
    priority    = number
  }))
  description = "Defines the IP restrictions applied to Web Apps, including allowed IP addresses, Azure Service Tags, and their priorities."
}