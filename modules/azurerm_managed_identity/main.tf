#resource "azurerm_user_assigned_identity" "id" {

#  location            = azurerm_resource_group.example.location
#  name                = "example"
#  resource_group_name = azurerm_resource_group.example.name
#}

#resource "azurerm_federated_identity_credential" "example" {
#  name                = "example"
#  resource_group_name = azurerm_resource_group.example.name
#  audience            = ["foo"]
#  issuer              = "https://foo"
#  parent_id           = azurerm_user_assigned_identity.example.id
#  subject             = "foo"
#}