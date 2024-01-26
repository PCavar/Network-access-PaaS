resource "azurerm_storage_account" "main_sa" {
  name                     = "myprivatestoragepcpc"
  resource_group_name      = azurerm_resource_group.main_rg.name
  location                 = azurerm_resource_group.main_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Test"
  }
}

## Fecth you IP-address dynamically as to not expose it.
data "http" "myip_fetched_dynamically" {
  url = "https://ipv4.icanhazip.com"
}

resource "azurerm_storage_account_network_rules" "main_sa_network_rules" {
  storage_account_id = azurerm_storage_account.main_sa.id

  default_action             = "Deny"
  ip_rules                   = [split("\n", data.http.myip_fetched_dynamically.body)[0]]
  virtual_network_subnet_ids = [azurerm_subnet.subnet_private.id]
  bypass                     = ["Metrics"]
}

resource "azurerm_storage_share" "private_share" {
  name                 = "myprivatesharepcpc"
  storage_account_name = azurerm_storage_account.main_sa.name
  quota                = 50
}
