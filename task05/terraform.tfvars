ip_restrictions = [
  {
    name       = "allow-ip"
    action     = "Allow"
    ip_address = "18.153.146.156"
  },
  {
    name        = "allow-tm"
    action      = "Allow"
    service_tag = "AzureTrafficManager"
  }
]