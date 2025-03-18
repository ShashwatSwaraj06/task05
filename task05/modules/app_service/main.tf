resource "azurerm_windows_web_app" "app" {
  for_each = var.windows_apps

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group
  app_service_plan_id = each.value.app_service_plan_id

  site_config {
    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name        = ip_restriction.name
        ip_address  = ip_restriction.ip_address
        service_tag = ip_restriction.service_tag
        action      = "Allow"
        priority    = ip_restriction.priority
      }
    }
  }

  tags = each.value.tags
}