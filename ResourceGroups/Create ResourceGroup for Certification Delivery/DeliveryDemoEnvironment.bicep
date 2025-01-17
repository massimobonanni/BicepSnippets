targetScope = 'subscription'

@allowed([
  'AZ900'
  'AZ104'
  'AZ204'
  'AZ400'
  'AZ305'
  'AZ700'
  'AI102'
  'AI050'
  'AZ2001'
  'AZ2002'
  'AZ2003'
  'AI3002'
  'AI3003'
  'AI3004'
  'MS4005'
  'AZ2005'
  'MS4010'
  'AI3016'
  'AZ2008'
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
