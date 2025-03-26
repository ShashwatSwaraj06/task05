variable "ip_restriction_rules" {
  description = "IP restriction rules"
  type = map(object({
    name        = string
    ip          = optional(string)
    service_tag = optional(string)
  }))
}