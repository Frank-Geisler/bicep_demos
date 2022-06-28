resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: 'passstorage${uniqueString(resourceGroup().id)}'
  location: 'northeurope'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
