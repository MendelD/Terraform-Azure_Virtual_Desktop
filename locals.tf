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

### VIRTUAL DESKTOP HOST POOL REGISTRATION INFO ###
locals {
  vdpoolregistration = {
    avd = {
      hostpool_id     = azurerm_virtual_desktop_host_pool.vdpool["avd"].id
      expiration_date = var.rfc3339
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

### VIRTUAL DESKTOP LOCAL PASSWORD ###
locals {
  localpwd = {
    avd = {
      length           = 16
      special          = true
      min_special      = 2
      override_special = "*!@#?"
    }

  }
}

### VIRTUAL NETWORKS ###
locals {
  vnet = {
    avd = {
      name                = lower("vnet-avd-${var.prefix}-${var.location}-001")
      address_space       = ["172.16.0.0/16", "fd54:544b:bef7::/48"]
      resource_group_name = azurerm_resource_group.rg["avd"].name
      location            = var.location
    }
  }
}

### SUBNETS ###
locals {
  snet = {
    avd = {
      name                 = lower("snet-avd-${var.prefix}-${var.location}-001")
      address_prefixes     = ["172.16.10.0/24", "fd54:544b:bef7:a::/64"]
      virtual_network_name = azurerm_virtual_network.vnet["avd"].name
      resource_group_name  = azurerm_resource_group.rg["avd"].name
      service_endpoints    = []
    }
  }
}

### VIRTUAL DESKTOP NETWORK INTERFACE ###
locals {
  nic = {
    avd = {
      name                = lower("nic-avd-${var.prefix}-${var.location}-001")
      resource_group_name = azurerm_resource_group.rg["avd"].name
      location            = var.location

      ip_configuration = {
        name                          = lower("nic_config-avd-${var.prefix}-${var.location}-001")
        subnet_id                     = azurerm_subnet.snet["avd"].id
        private_ip_address_allocation = "dynamic"
      }

      depends_on = [
        azurerm_resource_group.rg["avd"]
      ]
    }

  }
}

