# This policy definition is used to ensure that resources are only deployed to specific locations. 
#And it is assigned to a management group.

# Change this if needed

resource "azurerm_management_group" "ATEAexample" {
  display_name = "AteaExample Management Group"
}
#Name of the policy definition
data "azurerm_policy_definition" "ATEAexample" {
  display_name = "Allowed locations"
}
 #Name of the assignement
resource "azurerm_management_group_policy_assignment" "ATEAexample" {
  name                 = "ATEAexampleAssignment"
  management_group_id  = azurerm_management_group.ATEAexample.id
  policy_definition_id = data.azurerm_policy_definition.ATEAexample.id
  parameters = jsonencode({
    "listOfAllowedLocations" = {
      "value" = ["East US"]
    }
  })
}

resource "azurerm_management_group_policy_remediation" "ATEAexample" {
  name                 = "example"
  management_group_id  = azurerm_management_group.ATEAexample.id
  policy_assignment_id = azurerm_management_group_policy_assignment.ATEAexample.id
}