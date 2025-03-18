resource "azurerm_windows_web_app" "app" {
  for_each = var.windows_apps

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group
  app_service_plan_id = each.value.app_service_plan_id

  site_config {
    ip_restriction {
      name       = var.ip_restriction.allow_ip.name
      ip_address = var.ip_restriction.allow_ip.address
      action     = "Allow"
      priority   = 100
    }

    ip_restriction {
      name        = var.ip_restriction.allow_tm.name
      service_tag = var.ip_restriction.allow_tm.service_tag
      action      = "Allow"
      priority    = 200
    }
  }

  tags = each.value.tags
}