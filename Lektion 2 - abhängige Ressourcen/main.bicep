resource appServicePlan 'Microsoft.Web/serverFarms@2021-03-01' = {
  name: 'pass-resource-plan'
  location: 'northeurope'
  sku: {
    name: 'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2021-03-01' = {
  name: 'pass-site-${uniqueString(resourceGroup().id)}'
  location: 'northeurope'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
