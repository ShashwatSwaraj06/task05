resource "azurerm_app_service_plan" "asp" {
  for_each = var.app_service_plans

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group
  sku {
    tier     = each.value.sku.tier
    size     = each.value.sku.size
    capacity = each.value.sku.capacity
  }

  tags = each.value.tags
}