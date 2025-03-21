variable "ip_restrictions" {
  type = list(object({
    action     = string
    ip_address = string
    name       = string
  }))
  description = "List of IP restrictions for the App Service"
}