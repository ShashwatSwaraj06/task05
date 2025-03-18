variable "windows_apps" {
  type = map(object({
    name                = string
    location            = string
    resource_group      = string
    app_service_plan_id = string
    tags                = map(string)
  }))
}

variable "ip_restriction" {
  type = object({
    allow_ip = object({
      name    = string
      address = string
    })
    allow_tm = object({
      name        = string
      service_tag = string
    })
  })
}