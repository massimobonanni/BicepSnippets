
param deliveryType string 
param deliveryId string

var deliveryIdAssigmentName  = 'Assign tag DeliveryID (delivery ID ${deliveryId})' 
var policyID  = '/providers/Microsoft.Authorization/policyDefinitions/2a0e14a6-b0a6-4fab-991a-187a4f81c498'

resource idAssignament 'Microsoft.Authorization/policyAssignments@2020-09-01' = {
  name: deliveryIdAssigmentName
  scope: resourceGroup()
  properties: {
      policyDefinitionId: policyID
      parameters: {
        TagName : {
          value: 'Delivery'
        }
        TagValue: {
          value: deliveryType
        }
      }
  }
}

var deliveryTypeAssigmentName  = 'Assign tag Delivery (delivery ID ${deliveryId})' 

resource typeAssignemnt 'Microsoft.Authorization/policyAssignments@2020-09-01' = {
  name: deliveryTypeAssigmentName
  scope: resourceGroup()
  properties: {
      policyDefinitionId: policyID
      parameters: {
        TagName : {
          value: 'DeliveryId'
        }
        TagValue: {
          value: deliveryId
        }
      }
  }
}
