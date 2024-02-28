### RESOURCE GROUPS ###
locals {
  rg = {
    avd = {
      name     = lower("rg-avd-${var.prefix}-${var.location}-001")
      location = var.location
    }
  }
}

### VIRTUAL DESKTOP WORKSPACES ###
locals {
  vdws = {
    avd = {
      name                = lower("vdws-avd-${var.prefix}-${var.location_westeurope}-001")
      resource_group_name = azurerm_resource_group.rg["avd"].name
      location            = var.location_westeurope
    }

  }
}

### VIRTUAL DESKTOP HOST POOLS ###
locals {
  vdpool = {
    avd = {
      name                = lower("vdpool-avd-${var.prefix}-${var.location_westeurope}-001")
      resource_group_name = azurerm_resource_group.rg["avd"].name
      location            = var.location_westeurope
      type                = "Pooled"
      load_balancer_type  = "DepthFirst"
    }

  }
}

### VIRTUAL DESKTOP APPLICATION GROUPS ###
locals {
  vdag = {
    avd = {
      name                = lower("vdag-avd-${var.prefix}-${var.location_westeurope}-001")
      resource_group_name = azurerm_resource_group.rg["avd"].name
      location            = var.location_westeurope
      type                = "Desktop"
      host_pool_id        = azurerm_virtual_desktop_host_pool.vdpool["avd"].id
    }

  }
}

### VIRTUAL NETWORKS ###
#locals {
#  vnet = {
#    azure01 = {
#      name          = lower("vnet-azure01-${var.prefix}-${var.location}")
#      address_space = ["172.16.0.0/16", "fd54:544b:bef7::/48"]
#      rg            = azurerm_resource_group.rg["infrastructure"]
#    }
#  }
#}

### SUBNETS ###
#locals {
#  subnet = {
#    server01 = {
#      name              = lower("snet-server-${var.prefix}-${var.location}")
#      address_prefixes  = ["172.16.10.0/24", "fd54:544b:bef7:a::/64"]
#      vnet              = azurerm_virtual_network.vnet["azure01"]
#      rg                = azurerm_resource_group.rg["infrastructure"]
#      service_endpoints = []
#    }
#  }
#}