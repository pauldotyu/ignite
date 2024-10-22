# Register the required providers
Register-AzResourceProvider -ProviderNamespace "Microsoft.PolicyInsights"
Register-AzResourceProvider -ProviderNamespace "Microsoft.Compute"
Register-AzResourceProvider -ProviderNamespace "Microsoft.KeyVault"
Register-AzResourceProvider -ProviderNamespace "Microsoft.AppConfiguration"
Register-AzResourceProvider -ProviderNamespace "Microsoft.ServiceLinker"
Register-AzResourceProvider -ProviderNamespace "Microsoft.ContainerRegistry"

# Register the required preview feature
Register-AzProviderFeature -FeatureName "AutomaticSKUPreview" -ProviderNamespace "Microsoft.ContainerService"
Register-AzProviderFeature -FeatureName "EnableImageIntegrityPreview" -ProviderNamespace "Microsoft.ContainerService"
Register-AzProviderFeature -FeatureName "AKS-AzurePolicyExternalData" -ProviderNamespace "Microsoft.ContainerService"

# Loop to check the registration status of the providers
while ($true) {
    $status = Get-AzResourceProvider -ProviderNamespace "Microsoft.Compute"
    Write-Output "$($status[0].ProviderNamespace) is still $($status[0].RegistrationState) in $($status[0].Locations)"
    if ($status[0].RegistrationState -eq "Registered") {
        break
    }
    Start-Sleep -Seconds 10
}

# Loop to check the registration status of the preview feature
while ($true) {
    $status = Get-AzProviderFeature -FeatureName "AutomaticSKUPreview" -ProviderNamespace "Microsoft.ContainerService"
    Write-Output "$($status.FeatureName) is still $($status.RegistrationState)"
    if ($status.RegistrationState -eq "Registered") {
        break
    }
    Start-Sleep -Seconds 10
}

while ($true) {
    $status = Get-AzProviderFeature -FeatureName "EnableImageIntegrityPreview" -ProviderNamespace "Microsoft.ContainerService"
    Write-Output "$($status.FeatureName) is still $($status.RegistrationState)"
    if ($status.RegistrationState -eq "Registered") {
        break
    }
    Start-Sleep -Seconds 10
}

while ($true) {
    $status = Get-AzProviderFeature -FeatureName "AKS-AzurePolicyExternalData" -ProviderNamespace "Microsoft.ContainerService"
    Write-Output "$($status.FeatureName) is still $($status.RegistrationState)"
    if ($status.RegistrationState -eq "Registered") {
        break
    }
    Start-Sleep -Seconds 10
}

# Update the registration for Microsoft.ContainerService
Register-AzResourceProvider -ProviderNamespace "Microsoft.ContainerService"
