# Create a ResourceGroup for Demo Session

This templates allow you to create a resource group and set the policies to add tags to every resources you create in it.

The template creates a resource group with the following name:

`<event name>-Demo-rg`

and applies the <a href="https://github.com/Azure/azure-policy/blob/master/built-in-policies/policyDefinitions/Tags/ApplyTag_Append.json" target="_blank">Append a tag and its value to resources</a> policy two times to automatically append the following tags to every resource you create in the resource group:

`EventName : <event name>`

`EventType : <event type>`

`Topic : <topic>`

## Sintax

This is the command to use the template:

```bash
az deployment sub create --location <resource group location> --template-file SessionDemoEnvironment.bicep --parameters eventType=<event type> eventName=<event Name> topic=<topic> 
```


## Parameters

| Parameter    | Description                                                         |
|--------------|---------------------------------------------------------------------|
| eventName | The name of the conference, meetup or workshop for wich you are creating the resource group. For example `Azure Serverless Conf`.    |
| eventType   | The type of the event. Must be one of `conference`, `meetup` or `workshop`. |
| topic   | The topic of the event. For example `serverless`. |
