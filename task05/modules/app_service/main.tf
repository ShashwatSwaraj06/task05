resource "azurerm_windows_web_app" "app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  tags                = var.tags

  site_config {
    always_on = false

    dynamic "ip_restriction" {
      for_each = [
        {
          name       = "allow-ip"
          ip_address = "${var.allowed_ip}/32"
          priority   = 100
          action     = "Allow"
        },
        {
          name        = "allow-tm"
          service_tag = "AzureTrafficManager"
          priority    = 110
          action      = "Allow"
        }
      ]

      content {
        name     = ip_restriction.value.name
        priority = ip_restriction.value.priority
        action   = ip_restriction.value.action

        ip_address  = lookup(ip_restriction.value, "ip_address", null)
        service_tag = lookup(ip_restriction.value, "service_tag", null)
      }
    }
  }
}
