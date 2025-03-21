resource "azurerm_traffic_manager_profile" "tm" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.routing_method

  dns_config {
    relative_name = var.name
    ttl           = 100
  }

  monitor_config {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }

  tags = var.tags
}

resource "azurerm_traffic_manager_azure_endpoint" "endpoint" {
  for_each = var.endpoints

  name               = each.key
  profile_id         = azurerm_traffic_manager_profile.tm.id
  target_resource_id = each.value
}