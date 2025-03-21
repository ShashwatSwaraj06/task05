resource "azurerm_windows_web_app" "app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  site_config {
    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        action     = ip_restriction.value.action
        ip_address = ip_restriction.value.ip_address
        name       = ip_restriction.value.name
      }
    }
  }

  tags = var.tags
}