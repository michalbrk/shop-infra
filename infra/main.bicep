// infra/main.bicep: one storage account, named from a prefix plus a unique suffix
param location string
param storagePrefix string

resource sa 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  // uniqueString returns the same 13 characters every time for this resource group
  name: '${storagePrefix}${uniqueString(resourceGroup().id)}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
