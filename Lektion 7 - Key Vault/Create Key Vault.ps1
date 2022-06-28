$keyVaultName = 'YOUR-KEY-VAULT-NAME' # A unique name for the key vault.
$login = 'YOUR-LOGIN' # The login that you used in the previous step.
$password = 'YOUR-PASSWORD' # The password that you used in the previous step.

$sqlServerAdministratorLogin = ConvertTo-SecureString $login `
                                    -AsPlainText `
                                    -Force

$sqlServerAdministratorPassword = ConvertTo-SecureString $password `
                                    -AsPlainText `
                                    -Force

New-AzKeyVault `
    -VaultName $keyVaultName `
    -Location northeurope `
    -EnabledForTemplateDeployment

Set-AzKeyVaultSecret `
    -VaultName $keyVaultName `
    -Name 'sqlServerAdministratorLogin' `
    -SecretValue $sqlServerAdministratorLogin

Set-AzKeyVaultSecret `
    -VaultName $keyVaultName `
    -Name 'sqlServerAdministratorPassword' `
    -SecretValue $sqlServerAdministratorPassword

# Ressource ID des Keyvault
(Get-AzKeyVault -Name $keyVaultName).ResourceId

# Ressourcen ID sieht aus wie
# /subscriptions/f0750bbe-ea75-4ae5-b24d-a92ca601da2c/resourceGroups/PlatformResources/providers/Microsoft.KeyVault/vaults/toysecrets

