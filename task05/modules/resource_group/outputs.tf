output "resource_group_details" {
  value = { for rg_key, rg_val in azurerm_resource_group.rg : rg_key => rg_val }
}