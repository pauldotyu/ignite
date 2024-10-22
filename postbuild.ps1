New-AzRoleAssignment -SignInName '@lab.CloudPortalCredential(User1).Username' -RoleDefinitionName 'Azure Kubernetes Service RBAC Cluster Admin' -Scope '@lab.CloudResourceTemplate(AKSAutomatic).Outputs[aksId]'
New-AzRoleAssignment -SignInName '@lab.CloudPortalCredential(User1).Username' -RoleDefinitionName 'Grafana Admin' -Scope '@lab.CloudResourceTemplate(AKSAutomatic).Outputs[grafanaId]'
