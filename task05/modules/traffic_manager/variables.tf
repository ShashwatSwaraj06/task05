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
}

variable "endpoints" {
  type = map(object({
    name           = string
    app_service_id = string
    location       = string
  }))
}