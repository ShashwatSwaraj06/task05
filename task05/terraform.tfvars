resource_groups = {
  rg1 = {
    location = "eastus"
  }
  rg2 = {
    location = "westeurope"
  }
  rg3 = {
    location = "southeastasia"
  }
}

app_service_plans = {
  asp1 = {
    resource_group_key = "rg1"
    worker_count       = 2
    sku                = "P0v3"
  }
  asp2 = {
    resource_group_key = "rg2"
    worker_count       = 1
    sku                = "P1v3"
  }
}

app_services = {
  app1 = {
    resource_group_key   = "rg1"
    app_service_plan_key = "asp1"
  }
  app2 = {
    resource_group_key   = "rg2"
    app_service_plan_key = "asp2"
  }
}

traffic_manager = {
  resource_group_key = "rg3"
  routing_method     = "Performance"
}

allowed_ip = "18.153.146.156"

tags = {
  Creator = "shashwat_swaraj@epam.com"
}