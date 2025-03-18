variable "profile" {
  type = object({
    name           = string
    resource_group = string
    location       = string
    ttl            = number
    routing_method = string
    relative_name  = string
    tags           = map(string)
  })
  description = "Details of the Traffic Manager Profile, including routing methods, DNS settings, and tags."
}

variable "endpoints" {
  type = map(object({
    name           = string
    app_service_id = string
    location       = string
  }))
  description = "Endpoints for the Traffic Manager managing app services across regions."
}