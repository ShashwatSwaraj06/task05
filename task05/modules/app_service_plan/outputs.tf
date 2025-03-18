output "app_service_plan_ids" {
  value = { for asp_key, asp_val in azurerm_app_service_plan.asp : asp_key => asp_val.id }
}