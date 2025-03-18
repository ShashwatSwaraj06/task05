module "resource_groups" {
  source = "./modules/resource_group"

  resource_groups = var.resource_groups
}

module "app_service_plans" {
  source = "./modules/app_service_plan"

  app_service_plans = var.app_service_plans
}

module "windows_apps" {
  source = "./modules/app_service"

  windows_apps = var.windows_apps
  ip_restriction = {
    allow_ip = {
      name    = "allow-ip"
      address = var.verification_agent_ip
    }
    allow_tm = {
      name        = "allow-tm"
      service_tag = "AzureTrafficManager"
    }
  }
}

module "traffic_manager" {
  source = "./modules/traffic_manager"

  profile   = var.traffic_manager_profile
  endpoints = var.traffic_manager_endpoints
}