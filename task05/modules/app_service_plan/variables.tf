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