# Create Resource Groups
module "resource_groups" {
  for_each = var.resource_groups
  source   = "./modules/resource_group"

  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

# Create App Service Plans
module "app_service_plans" {
  for_each = var.app_service_plans
  source   = "./modules/app_service_plan"

  name                = each.value.name
  resource_group_name = module.resource_groups[each.value.resource_group_key].name
  location            = module.resource_groups[each.value.resource_group_key].location
  sku                 = each.value.sku
  worker_count        = each.value.worker_count
  tags                = var.tags
}

# Create App Services
module "app_services" {
  for_each = var.app_services
  source   = "./modules/app_service"

  name                 = each.value.name
  resource_group_name  = module.resource_groups[each.value.resource_group_key].name
  location             = module.resource_groups[each.value.resource_group_key].location
  service_plan_id      = module.app_service_plans[each.value.app_service_plan_key].id
  allowed_ip           = var.allowed_ip
  ip_restriction_rules = var.ip_restriction_rules
  tags                 = var.tags
}

# Create Traffic Manager Profile
module "traffic_manager" {
  source = "./modules/traffic_manager"

  name                = var.traffic_manager.name
  resource_group_name = module.resource_groups[var.traffic_manager.resource_group_key].name
  location            = module.resource_groups[var.traffic_manager.resource_group_key].location
  routing_method      = var.traffic_manager.routing_method
  tags                = var.tags

  endpoints = [
    {
      name    = "${var.app_services["app1"].name}-endpoint"
      target  = module.app_services["app1"].id
      enabled = true
    },
    {
      name    = "${var.app_services["app2"].name}-endpoint"
      target  = module.app_services["app2"].id
      enabled = true
    }
  ]
}