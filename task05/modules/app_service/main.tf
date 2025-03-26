resource "azurerm_windows_web_app" "app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  tags                = var.tags

  resource "azurerm_windows_web_app" "app" {
    # ... other configuration ...

    site_config {
      always_on = false

      dynamic "ip_restriction" {
        for_each = var.ip_restriction_rules
        content {
          name        = ip_restriction.value.name
          priority    = ip_restriction.value.priority
          action      = "Allow"
          ip_address  = ip_restriction.value.ip_address
          service_tag = ip_restriction.value.service_tag
        }
      }

      # Explicit deny all rule
      ip_restriction {
        name       = "Deny all"
        priority   = 2147483647
        action     = "Deny"
        ip_address = "Any"
      }
    }
  }
}