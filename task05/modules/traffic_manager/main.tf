resource "azurerm_traffic_manager_profile" "traffic_manager" {
  name                   = var.profile.name
  resource_group_name    = var.profile.resource_group
  location               = var.profile.location
  traffic_routing_method = var.profile.routing_method

  dns_config {
    relative_name = var.profile.relative_name
    ttl           = var.profile.ttl
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 3
  }

  tags = var.profile.tags
}

resource "azurerm_traffic_manager_endpoint" "tm_endpoint" {
  for_each = var.endpoints

  name                = each.value.name
  profile_name        = azurerm_traffic_manager_profile.traffic_manager.name
  resource_group_name = var.profile.resource_group
  type                = "azurerm_web_app"
  target_resource_id  = each.value.app_service_id
  endpoint_location   = each.value.location
}