# Log in
Connect-AzAccount

# View subscription
Get-AzContext

# Get the user or group ID
Get-AzADUser -StartsWith '<userName>'
$adUser = (Get-AzADUser -DisplayName '<userName>').id
Get-AzADGroup -SearchString '<groupName>'
$adGroup = (Get-AzADGroup -DisplayName '<groupName>').id


# Select and set the role definition
Get-AzRoleDefinition | Where-Object {$_.name -like 'Desktop virtualization*'} | FT Name, Id
$roleDef = (Get-AzRoleDefinition | Where-Object {$_.name -like '<Role Name>'}).id



# Get the workspace ID
Get-AzWvdWorkspace -Name '<WS Name>' -ResourceGroupName '<WS ResourceGroup>' | FL
$resourceID = (Get-AzWvdWorkspace -Name '<WS Name>' -ResourceGroupName '<WS ResourceGroup>').id

#Assign the role at the scope
New-AzRoleAssignment -ObjectId $adGroup `
-RoleDefinitionId $roleDef `
-Scope $resourceID

# View the role assignments at the scope
Get-AzRoleAssignment -Scope $resourceID | FT DisplayName,RoleDefinitionName

# View the role assignments for the user
Get-AzRoleAssignment -ObjectId $adGroup | FT DisplayName,RoleDefinitionName

# Remove the role assignment
Remove-AzRoleAssignment -ObjectId $adGroup `
-RoleDefinitionId $roleDef `
-Scope $resourceID