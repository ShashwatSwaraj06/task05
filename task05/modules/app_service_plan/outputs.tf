output "app_service_plan_ids" {
  value       = { for asp_key, asp_val in azurerm_app_service_plan.asp : asp_key => asp_val.id }
  description = "IDs of the created App Service Plans in the module."
}