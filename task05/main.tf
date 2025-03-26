locals {
  resource_group_names = {
    rg1 = "cmaz-57d8b090-mod5-rg-01"
    rg2 = "cmaz-57d8b090-mod5-rg-02"
    rg3 = "cmaz-57d8b090-mod5-rg-03"
  }

  app_service_plan_names = {
    asp1 = "cmaz-57d8b090-mod5-asp-01"
    asp2 = "cmaz-57d8b090-mod5-asp-02"
  }

  app_service_names = {
    app1 = "cmaz-57d8b090-mod5-app-01"
    app2 = "cmaz-57d8b090-mod5-app-02"
  }

  traffic_manager_name = "cmaz-57d8b090-mod5-traf"
}

# Create Resource Groups
module "resource_groups" {
  for_each = var.resource_groups
  source   = "./modules/resource_group"

  name     = local.resource_group_names[each.key]
  location = each.value.location
  tags     = var.tags
}

# Create App Service Plans
module "app_service_plans" {
  for_each = var.app_service_plans
  source   = "./modules/app_service_plan"

  name                = local.app_service_plan_names[each.key]
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

  name                = local.app_service_names[each.key]
  resource_group_name = module.resource_groups[each.value.resource_group_key].name
  location            = module.resource_groups[each.value.resource_group_key].location
  service_plan_id     = module.app_service_plans[each.value.app_service_plan_key].id
  allowed_ip          = var.allowed_ip
  tags                = var.tags
}

# Create Traffic Manager Profile
module "traffic_manager" {
  source = "./modules/traffic_manager"

  name                = local.traffic_manager_name
  resource_group_name = module.resource_groups[var.traffic_manager.resource_group_key].name
  location            = module.resource_groups[var.traffic_manager.resource_group_key].location
  routing_method      = var.traffic_manager.routing_method
  tags                = var.tags

  endpoints = [
    {
      name    = "app1-endpoint"
      target  = module.app_services["app1"].id
      enabled = true
    },
    {
      name    = "app2-endpoint"
      target  = module.app_services["app2"].id
      enabled = true
    }
  ]
}