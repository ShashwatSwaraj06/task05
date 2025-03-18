output "traffic_manager_fqdn" {
  value       = module.traffic_manager.traffic_manager_fqdn
  description = "The fully qualified domain name (FQDN) of the Traffic Manager profile deployed in the infrastructure."
}