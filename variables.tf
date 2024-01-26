variable "prefix" {
  default = "non-prod"
}

variable "region" {
  type        = string
  description = "Region for deployed resources"
  default     = "Sweden Central"
}

variable "main_rg" {
  type        = string
  description = "Main resource-group for this assignment"
  default     = "Network-Access-Storage-RG"
}

variable "nsg-private" {
  type        = string
  description = "This NSG will be assigned to vm-2"
  default     = "nsg-private"
}

variable "nsg-1" {
  type        = string
  description = "This NSG will be assigned to vm-1"
  default     = "nsg-1"
}

variable "main_vnet" {
  type = map(object({
    vnet_name           = string
    vnet_cidr           = string
    subnet_1_cidr       = string
    subnet_1_name       = string
    subnet_private_cidr = string
    subnet_private_name = string
    subnet_bastion_cidr = string
    subnet_bastion_name = string
  }))
  default = {
    vnet1 = {
      vnet_name           = "Vnet-1"
      vnet_cidr           = "10.0.0.0/16"
      subnet_1_cidr       = "10.0.0.0/24"
      subnet_1_name       = "subnet-1"
      subnet_private_cidr = "10.0.2.0/24"
      subnet_private_name = "subnet-private"
      subnet_bastion_cidr = "10.0.3.0/27"
      subnet_bastion_name = "AzureBastionSubnet"
    }
  }
}

variable "vm1_password" {
  type        = string
  description = "Password for VM1"
  sensitive   = true
}

variable "vm2_password" {
  type        = string
  description = "Password for VM2"
  sensitive   = true
}
