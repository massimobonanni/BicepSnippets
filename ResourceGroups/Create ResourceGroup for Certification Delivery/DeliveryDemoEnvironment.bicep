targetScope = 'subscription'

@allowed([
  'AZ900'
  'AZ104'
  'AZ204'
  'AZ304'
  'AZ303'
  'AZ400'
  'AZ305'
  'AZ700'
  'AI102'
])
param deliveryType string
param deliveryId string
param location string= deployment().location

var resourceGroupName = '${deliveryType}Demo-rg'


resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: location
  tags:{
     Delivery : deliveryType
     DeliveryId: deliveryId
  }
}

module policyModules 'DeliveryDemoPolicies.bicep' = {
  scope: resourceGroup
  name: 'policies'
  params: {
    deliveryType:deliveryType
    deliveryId:deliveryId
  }
}
