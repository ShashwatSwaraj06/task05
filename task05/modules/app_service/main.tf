resource "azurerm_windows_web_app" "app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  tags                = var.tags

  site_config {
    always_on = false

    # Explicitly set default action to Deny
    scm_ip_restriction_use_main   = true
    ip_restriction_default_action = "Deny"

    # Custom IP restrictions
    dynamic "ip_restriction" {
      for_each = var.ip_restriction_rules

      content {
        name     = ip_restriction.value.name
        priority = 100 + index(keys(var.ip_restriction_rules), ip_restriction.key) * 10
        action   = "Allow"

        ip_address  = lookup(ip_restriction.value, "ip", null)
        service_tag = lookup(ip_restriction.value, "service_tag", null)
      }
    }
  }
}