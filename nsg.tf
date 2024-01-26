resource "azurerm_network_security_group" "nsg_one" {
  name                = var.nsg-1
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
}

resource "azurerm_subnet_network_security_group_association" "vnet1_sub1" {
  subnet_id                 = azurerm_subnet.subnet_1.id
  network_security_group_id = azurerm_network_security_group.nsg_one.id
}

resource "azurerm_network_security_rule" "vnet1_sub1_rule1" {
  name                        = "AllowRDP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "10.0.3.0/27"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.nsg_one.name
}

resource "azurerm_network_security_rule" "vnet1_sub1_rule2" {
  name                        = "AllowSSH"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "10.0.3.0/27"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.nsg_one.name
}

resource "azurerm_network_security_rule" "internet_rule_deny_nsg_one" {
  name                        = "Deny-Internet-All"
  priority                    = 115
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "Internet"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.nsg_one.name
}

resource "azurerm_network_security_group" "nsg_private" {
  name                = var.nsg-private
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
}

resource "azurerm_subnet_network_security_group_association" "vnet1_sub_private" {
  subnet_id                 = azurerm_subnet.subnet_private.id
  network_security_group_id = azurerm_network_security_group.nsg_private.id
}

##Storage rule
resource "azurerm_network_security_rule" "storage_rule_private_nsg" {
  name                        = "allow-storage-all"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "445"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "Storage"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.nsg_private.name
}


resource "azurerm_network_security_rule" "vnet1_sub_private_rule1" {
  name                        = "AllowRDP"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "10.0.3.0/27"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.nsg_private.name
}

resource "azurerm_network_security_rule" "vnet1_sub_private_rule2" {
  name                        = "AllowSSH"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "10.0.3.0/27"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.nsg_private.name
}

resource "azurerm_network_security_rule" "internet_rule_deny_private" {
  name                        = "Deny-Internet-All"
  priority                    = 115
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "Internet"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.nsg_private.name
}
