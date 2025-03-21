provider "azurerm" {
  features {}
}

module "resource_group" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

module "app_service_plan" {
  source   = "./modules/app_service_plan"
  for_each = var.app_service_plans

  name                = each.value.name
  resource_group_name = module.resource_group[each.value.resource_group_key].name
  location            = module.resource_group[each.value.resource_group_key].location
  sku                 = each.value.sku
  worker_count        = each.value.worker_count
  tags                = var.tags
}

module "app_service" {
  source   = "./modules/app_service"
  for_each = var.app_services

  name                = each.value.name
  resource_group_name = module.resource_group[each.value.resource_group_key].name
  location            = module.resource_group[each.value.resource_group_key].location
  service_plan_id     = module.app_service_plan[each.value.app_service_plan_key].id
  allow_ip            = var.verification_agent_ip
  tags                = var.tags
}

module "traffic_manager" {
  source = "./modules/traffic_manager"

  name                = var.traffic_manager_profile_name
  resource_group_name = module.resource_group[var.traffic_manager_resource_group_key].name
  routing_method      = var.traffic_manager_routing_method
  endpoints           = { for k, v in module.app_service : k => v.id }
  tags                = var.tags
}