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
  description = "A map of Windows Web Apps with configurations including associated names, resource groups, locations, and service plans."
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
  description = "Defines the Traffic Manager profile configuration, including its DNS name, TTL, and routing methods."
}

variable "traffic_manager_endpoints" {
  type = map(object({
    name           = string
    app_service_id = string
    location       = string
  }))
  description = "A map of Traffic Manager endpoints, including names, IDs of linked services, and regional locations."
}

variable "verification_agent_ip" {
  type        = string
  description = "The static IP address of the verification agent used to test access to App Services."
}

variable "ip_restrictions" {
  type = list(object({
    name        = string
    ip_address  = string
    service_tag = string
    priority    = number
  }))
  description = "A list of rules to restrict access to Web Apps, including allowed IPs, Azure service tags, and their priorities."
}