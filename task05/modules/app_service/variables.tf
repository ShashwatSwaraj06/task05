variable "windows_apps" {
  type = map(object({
    name                = string
    resource_group      = string
    location            = string
    app_service_plan_id = string
    tags                = map(string)
  }))
  description = "A map of Windows App Service configurations."
}

variable "ip_restrictions" {
  type = list(object({
    name        = string
    ip_address  = string
    service_tag = string
    priority    = number
  }))
  description = "List of IP restrictions used for App Service traffic rules."
}