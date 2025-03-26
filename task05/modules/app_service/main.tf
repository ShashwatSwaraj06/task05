resource "azurerm_windows_web_app" "app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  tags                = var.tags

  site_config {
    always_on                     = false
    ip_restriction_default_action = "Deny"

    dynamic "ip_restriction" {
      for_each = var.ip_restriction_rules

      content {
        name     = ip_restriction.value.name
        priority = 100 + index(keys(var.ip_restriction_rules), ip_restriction.key) * 10
        action   = "Allow"

        # Only set ip_address if ip is specified
        ip_address = can(ip_restriction.value.ip) ? ip_restriction.value.ip : null
        # Only set service_tag if service_tag is specified
        service_tag = can(ip_restriction.value.service_tag) ? ip_restriction.value.service_tag : null
      }
    }
  }
}