Connect-AzAccount

$context = Get-AzSubscription `
                -SubscriptionName '<subscriptionName>'

Set-AzContext $context

Get-AzSubscription

$context = Get-AzSubscription `
            -SubscriptionId {Your subscription ID}

Set-AzContext $context

# FGE: Hier vorher eine Ressourcengruppe anlegen
Set-AzDefault `
    -ResourceGroupName [sandbox resource group name]

New-AzResourceGroupDeployment `
  -TemplateFile main.bicep `
  -TemplateParameterFile main.parameters.dev.json