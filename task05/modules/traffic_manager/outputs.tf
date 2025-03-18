output "traffic_manager_fqdn" {
  value       = azurerm_traffic_manager_profile.traffic_manager.dns_config.fqdn
  description = "The FQDN of the Traffic Manager profile."
}