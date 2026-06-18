resource "azurerm_resource_group" "main" {
  name = var.resource_group_name
  location = var.location

}

resource "azurerm_storage_account" "sa" {
  name = var.storage_account_name
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  account_tier =  "Standard"
  account_replication_type = "LRS"


  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }

  allow_nested_items_to_be_public = false
  public_network_access_enabled = false
  https_traffic_only_enabled = true
  min_tls_version = "TLS1_2"
}