module "app_service" {
  source   = "./modules/app_service"
  for_each = var.app_services

  name                = each.value.name
  resource_group_name = module.resource_group[each.value.resource_group_key].name
  location            = module.resource_group[each.value.resource_group_key].location
  service_plan_id     = module.app_service_plan[each.value.app_service_plan_key].id
  ip_restrictions     = var.ip_restrictions
  tags                = var.tags
}