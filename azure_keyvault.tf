resource "azurerm_resource_group" "ecommerce_admin" {
  name     = "ecommerce-admin"
  location = "East US"
}

resource "azurerm_virtual_machine" "ecommerce" {
  # ... (otras configuraciones requeridas para la VM)
  name                  = "ecommerce"
  resource_group_name   = azurerm_resource_group.ecommerce_admin.name
  # ... (otras configuraciones requeridas para la VM)
}

resource "azurerm_key_vault" "ecommerce_keyvault" {
  name                = "ecommerceKeyVault"
  location            = azurerm_resource_group.ecommerce_admin.location
  resource_group_name = azurerm_resource_group.ecommerce_admin.name
  sku_name            = "standard"

  tenant_id = "e994072b-523e-4bfe-86e2-442c5e10b244" # Reemplaza con tu Azure Tenant ID
  soft_delete_enabled = true

  access_policy {
    tenant_id = "e994072b-523e-4bfe-86e2-442c5e10b244" # Reemplaza con tu Azure Tenant ID
    object_id = "your-object-id" # Reemplaza con tu Azure Object ID

    key_permissions = [
      "get",
      "list",
      "delete",
      "create",
      "import",
      "update",
      "recover",
      "backup",
      "restore",
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete",
      "recover",
      "backup",
      "restore",
    ]

    storage_permissions = [
      "get",
      "list",
      "delete",
      "set",
      "update",
      "regeneratekey",
      "setsas",
      "listsas",
      "getsas",
      "deletesas",
    ]
  }
}
