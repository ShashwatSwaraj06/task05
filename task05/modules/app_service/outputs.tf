output "app_service_ids" {
  value       = { for app_key, app_val in azurerm_windows_web_app.app : app_key => app_val.id }
  description = "IDs of the deployed app services in the module."
}