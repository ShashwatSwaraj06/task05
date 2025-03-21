resource_groups = {
  rg1 = {
    name     = "cmaz-57d8b090-mod5-rg-01"
    location = "East US"
  },
  rg2 = {
    name     = "cmaz-57d8b090-mod5-rg-02"
    location = "West US"
  },
  rg3 = {
    name     = "cmaz-57d8b090-mod5-rg-03"
    location = "Central US"
  }
}

app_service_plans = {
  asp1 = {
    name               = "cmaz-57d8b090-mod5-asp-01"
    resource_group_key = "rg1"
    sku                = "P0v3"
    worker_count       = 2
  },
  asp2 = {
    name               = "cmaz-57d8b090-mod5-asp-02"
    resource_group_key = "rg2"
    sku                = "P1v3"
    worker_count       = 1
  }
}

app_services = {
  app1 = {
    name                 = "cmaz-57d8b090-mod5-app-01"
    resource_group_key   = "rg1"
    app_service_plan_key = "asp1"
  },
  app2 = {
    name                 = "cmaz-57d8b090-mod5-app-02"
    resource_group_key   = "rg2"
    app_service_plan_key = "asp2"
  }
}

traffic_manager_profile_name       = "cmaz-57d8b090-mod5-traf"
traffic_manager_routing_method     = "Performance"
traffic_manager_resource_group_key = "rg3"
verification_agent_ip              = "18.153.146.156"

ip_restrictions = [
  {
    action     = "Allow"
    ip_address = "18.153.146.156"
    name       = "allow-ip"
  },
  {
    action      = "Allow"
    service_tag = "AzureTrafficManager"
    name        = "allow-tm"
  }
]

tags = {
  Creator = "shashwat_swaraj@epam.com"
}