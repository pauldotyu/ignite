# Register the required providers
Register-AzProvider -Name "Microsoft.Compute"
Register-AzProvider -Name "Microsoft.Network"
Register-AzProvider -Name "Microsoft.Quota"
Register-AzProvider -Name "Microsoft.ContainerService"

# Register the feature on pre-build
Register-AzProviderFeature -FeatureName "AutomaticSKUPreview" -ProviderNamespace "Microsoft.ContainerService"

# Loop to check the registration status
while ($true) {
    $status = Get-AzProviderFeature -FeatureName "AutomaticSKUPreview" -ProviderNamespace "Microsoft.ContainerService"
    if ($status.RegistrationState -eq "Registered") {
        Write-Output "Feature is registered."
        break
    }
    Start-Sleep -Seconds 10
}

$user = Get-AzADUser -UserPrincipalName '@lab.CloudPortalCredential(User2).Username'
$grafanaRole = Get-AzRoleDefinition -Name 'Grafana Admin'



$aksRole = Get-AzRoleDefinition -Name 'Azure Kubernetes Service Cluster Admin Role'
