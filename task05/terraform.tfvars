resource_groups = {
  rg1 = {
    name     = "cmaz-57d8b090-mod5-rg-01"
    location = "East US"
    tags = {
      Creator = "shashwat_swaraj@epam.com"
    }
  }
  rg2 = {
    name     = "cmaz-57d8b090-mod5-rg-02"
    location = "West Europe"
    tags = {
      Creator = "shashwat_swaraj@epam.com"
    }
  }
  rg3 = {
    name     = "cmaz-57d8b090-mod5-rg-03"
    location = "Central US"
    tags = {
      Creator = "shashwat_swaraj@epam.com"
    }
  }
}

app_service_plans = {
  asp1 = {
    name           = "cmaz-57d8b090-mod5-asp-01"
    resource_group = "cmaz-57d8b090-mod5-rg-01"
    location       = "East US"
    sku = {
      tier     = "PremiumV3"
      size     = "P0v3"
      capacity = 2
    }
    tags = {
      Creator = "shashwat_swaraj@epam.com"
    }
  }
  asp2 = {
    name           = "cmaz-57d8b090-mod5-asp-02"
    resource_group = "cmaz-57d8b090-mod5-rg-02"
    location       = "West Europe"
    sku = {
      tier     = "PremiumV3"
      size     = "P1v3"
      capacity = 1
    }
    tags = {
      Creator = "shashwat_swaraj@epam.com"
    }
  }
}

windows_apps = {
  app1 = {
    name                = "cmaz-57d8b090-mod5-app-01"
    resource_group      = "cmaz-57d8b090-mod5-rg-01"
    location            = "East US"
    app_service_plan_id = "asp1"
    tags = {
      Creator = "shashwat_swaraj@epam.com"
    }
  }
  app2 = {
    name                = "cmaz-57d8b090-mod5-app-02"
    resource_group      = "cmaz-57d8b090-mod5-rg-02"
    location            = "West Europe"
    app_service_plan_id = "asp2"
    tags = {
      Creator = "shashwat_swaraj@epam.com"
    }
  }
}

traffic_manager_profile = {
  name           = "cmaz-57d8b090-mod5-traf"
  resource_group = "cmaz-57d8b090-mod5-rg-03"
  location       = "Central US"
  ttl            = 30
  routing_method = "Performance"
  relative_name  = "cmaz-57d8b090-mod5"
  tags = {
    Creator = "shashwat_swaraj@epam.com"
  }
}

traffic_manager_endpoints = {
  app1 = {
    name           = "app1-endpoint"
    app_service_id = "app1-service-id"
    location       = "East US"
  }
  app2 = {
    name           = "app2-endpoint"
    app_service_id = "app2-service-id"
    location       = "West Europe"
  }
}

verification_agent_ip = "18.153.146.156"