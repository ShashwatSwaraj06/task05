resource "azurerm_windows_web_app" "app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  site_config {
    ip_restriction {
      action     = "Allow"
      ip_address = var.allow_ip
      name       = "allow-ip"
    }
    ip_restriction {
      action      = "Allow"
      service_tag = "AzureTrafficManager"
      name        = "allow-tm"
    }
  }

  tags = var.tags
}