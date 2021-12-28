terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.31.1"
    }
  }
}

terraform {
    backend "azurerm" {
        resource_group_name = "BKTestStorageACRG"
        storage_account_name = "bktfstorageaccount"
        container_name = "bktfstate"
        key = "terraform.tfstate"
    }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "bktf_test" {
    name = "bktftestrg"
    location = "uksouth"
}

resource "azurerm_container_group" "bktf_cg" {
    name = "dotnetcoreapi"
    location = azurerm_resource_group.bktf_test.location
    resource_group_name = azurerm_resource_group.bktf_test.name
    ip_address_type = "public"
    dns_name_label = "bktfapidns"
    os_type = "Linux"
    container {
        name = "weatherapi"
        image = "bismsit29/weatherapi"
        cpu  = "1" 
        memory = "1"
        ports {
            port = 80
            protocol = "TCP"
        }
    }
}
