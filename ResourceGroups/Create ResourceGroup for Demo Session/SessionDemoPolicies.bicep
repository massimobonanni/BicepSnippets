@allowed([
  'conference'
  'meetup'
  'workshop'
])
param eventType string
param eventName string
param sessionTopic string

var eventFullName ='${eventName} - ${eventType} [${sessionTopic}]'

var policyID  = '/providers/Microsoft.Authorization/policyDefinitions/2a0e14a6-b0a6-4fab-991a-187a4f81c498'

var eventTypeAssigmentName  = 'Assign tag EventType for ${eventFullName}' 

resource eventTypeAssignment 'Microsoft.Authorization/policyAssignments@2020-09-01' = {
  name: eventTypeAssigmentName
  scope: resourceGroup()
  properties: {
      policyDefinitionId: policyID
      parameters: {
        TagName : {
          value: 'EventType'
        }
        TagValue: {
          value: eventType
        }
      }
  }
}

var eventNameAssigmentName  = 'Assign tag EventName for ${eventFullName}' 

resource eventNameAssignment 'Microsoft.Authorization/policyAssignments@2020-09-01' = {
  name: eventNameAssigmentName
  scope: resourceGroup()
  properties: {
      policyDefinitionId: policyID
      parameters: {
        TagName : {
          value: 'EventName'
        }
        TagValue: {
          value: eventName
        }
      }
  }
}

var topicAssigmentName  = 'Assign tag Topic for ${eventFullName}' 

resource topicAssignment 'Microsoft.Authorization/policyAssignments@2020-09-01' = {
  name: topicAssigmentName
  scope: resourceGroup()
  properties: {
      policyDefinitionId: policyID
      parameters: {
        TagName : {
          value: 'Topic'
        }
        TagValue: {
          value: sessionTopic
        }
      }
  }
}
