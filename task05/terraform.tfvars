resource_groups = {
  rg1 = {
    name     = "cmaz-57d8b090-mod5-rg-01"
    location = "eastus"
  }
  rg2 = {
    name     = "cmaz-57d8b090-mod5-rg-02"
    location = "westeurope"
  }
  rg3 = {
    name     = "cmaz-57d8b090-mod5-rg-03"
    location = "southeastasia"
  }
}

app_service_plans = {
  asp1 = {
    name               = "cmaz-57d8b090-mod5-asp-01"
    resource_group_key = "rg1"
    worker_count       = 2
    sku                = "P0v3"
  }
  asp2 = {
    name               = "cmaz-57d8b090-mod5-asp-02"
    resource_group_key = "rg2"
    worker_count       = 1
    sku                = "P1v3"
  }
}

app_services = {
  app1 = {
    name                 = "cmaz-57d8b090-mod5-app-01"
    resource_group_key   = "rg1"
    app_service_plan_key = "asp1"
  }
  app2 = {
    name                 = "cmaz-57d8b090-mod5-app-02"
    resource_group_key   = "rg2"
    app_service_plan_key = "asp2"
  }
}

traffic_manager = {
  name               = "cmaz-57d8b090-mod5-traf"
  resource_group_key = "rg3"
  routing_method     = "Performance"
}

allowed_ip = "18.153.146.156"

ip_restriction_rules = {
  allow_ip = {
    name = "allow-ip"
    ip   = "18.153.146.156/32" # Added /32 for single IP
  }
  allow_tm = {
    name        = "allow-tm"
    service_tag = "AzureTrafficManager"
  }
}
tags = {
  Creator = "shashwat_swaraj@epam.com"
}