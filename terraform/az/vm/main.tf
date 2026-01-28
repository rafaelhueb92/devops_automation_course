data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_public_ip" "public_ip" {
  name                = "mdc-public-ip"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Basic"
}


resource "azurerm_virtual_network" "vnet" {
  name                = "mdc-vnet"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}


resource "azurerm_subnet" "subnet" {
  name                 = "mdc-subnet"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}


resource "azurerm_network_interface" "nic" {
  name                = "devops-nic"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "devops-vm"
  resource_group_name             = data.azurerm_resource_group.rg.name
  location                        = var.location
  size                            = local.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interace_ids = [
    azurerm_network_interface.nic.id
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    ski       = "20_04-lts"
    version   = "latest"
  }

}