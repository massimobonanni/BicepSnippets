# Create a ResourceGroup for Certification Delivery

This templates allow you to create a resource group and set a couple of policy to automatically add tags to it.

The template creates a resource group with the following name:

`<delivery type>Demo-rg`

and applies the <a href="https://github.com/Azure/azure-policy/blob/master/built-in-policies/policyDefinitions/Tags/ApplyTag_Append.json" target="_blank">Append a tag and its value to resources</a> policy two times to automatically append the following tags to every resource you create in the resource group:

`Delivery : <deliveryType>`

`DeliveryId : <delivery id>`

## Sintax

This is the command to use the template:

```bash
az deployment sub create --location <resource group location> --template-file DeliveryDemoEnvironment.bicep --parameters deliveryType=<delivery type> deliveryId=<delivery id>
```


## Parameters

| Parameter    | Description                                                         |
|--------------|---------------------------------------------------------------------|
| deliveryType | It is the delivery type you are delivering. For example `AZ-104`.    |
| deliveryId   | It is the internal delivery id for the delivery. For example `31288`. |
