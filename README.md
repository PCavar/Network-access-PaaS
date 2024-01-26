## Restrict network access to PaaS resources, in this case Storage account
## with virtual network service endpoints using Terraform

## Topology picture added to get an overview

## Deployment overview:
## Virtual Network - 3 subnets (subnet-private) connected with service endpoint (Microsoft.Storage)
## NSG for both subnets
## Two Virtual machines, one in each subnet - Not exposing VM-password, these will be applied in console when running apply
## Azure Bastion (AzureBastionSubnet) with a public IP - (Both subnets only accessibly through SSH/RDP via Bastion) - NSG Rules applied
## Storage account with a file share
## Powershell script to connect VM to file share

## Objective - Only non-prod-vm2 as shown in Topology should have access to the SA file share
## NOTE! - check if you have the right RBAC

## Smooth deployment - NOTE - When deploying storage account, I've added the service endpoint (subnet-private) and whitelisting
## your public-ip address cause requests seent while deploying need to come from either the service endpoint subnet or a whitelisted IP

## Task One
## 1. To check if deployed correctly - copy your key1 fron SA as show in access-key-sa
## 2. Use Azure Bastion to access non-prod-vm2 (Sitting in the private subnet with the service endpoint)
## 3. Run the following Powershell script - "connecting-fileshare-to-vm-drive.ps1"
## 4. Following success message should be displayed - see picture "confirming-access-to-sa-fileshare-succedded.png"

## Task Two
## 1. Repeate the same procedure with non-prod-vm1, this one will not work
## See Topology and Powershell will if configured correctly provide you with
## a Access denied message - see picture "confirming-access-to-sa-fileshare-denied.png"

## The same results will be displayed when accessing the SA from VMs Azure Portal
## Hope you enjoyed this!