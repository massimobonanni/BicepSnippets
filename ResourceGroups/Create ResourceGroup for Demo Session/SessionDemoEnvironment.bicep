targetScope = 'subscription'

@allowed([
  'conference'
  'meetup'
  'workshop'
])
param eventType string
param eventName string
param sessionTopic string
param location string= deployment().location

var resourceGroupName = '${replace(eventName, ' ', '-')}-Demo-rg'


resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: location
  tags:{
     EventName: eventName
     EventType: eventType
     Topic: sessionTopic
  }
}

module policyModules 'SessionDemoPolicies.bicep' = {
  scope: resourceGroup
  name: 'policies'
  params: {
    eventName: eventName
    eventType: eventType
    sessionTopic: sessionTopic
  }
}
