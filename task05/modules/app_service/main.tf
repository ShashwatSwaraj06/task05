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
        name        = ip_restriction.value.name
        priority    = ip_restriction.value.priority
        action      = "Allow"
        ip_address  = ip_restriction.value.ip_address != null ? ip_restriction.value.ip_address : null
        service_tag = ip_restriction.value.service_tag != null ? ip_restriction.value.service_tag : null
      }
    }
  }
}