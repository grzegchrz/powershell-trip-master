$LaOnComputersGroup = "CN=LA.OnComputers,OU=LA,OU=Groups,DC=domain,DC=lcl"
$LaUsers = Get-ADGroupMember -identity $LaOnComputersGroup | select SamAccountName 
foreach ($user in $LaUsers)
{
    Write-host "------------------------------------------------"
    Write-Host $user.SamAccountName
    Get-ADPrincipalGroupMembership $user.SamAccountName | select name 
    
}
