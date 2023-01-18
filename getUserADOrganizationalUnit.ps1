$ou = 'OU=VISO,DC=domain,DC=lcl'

Get-ADOrganizationalUnit -LDAPFilter '(name=*)' -SearchBase $ou -SearchScope OneLevel | Format-Table Name

get-aduser -filter * -SearchBase $ou -SearchScope Subtree -Properties distinguishedname | select distinguishedname

$ou | ForEach {Get-ADUser -Filter * -SearchBase $_ -prop DistinguishedName |select name, @{name= "OU";expression={$_.DistinguishedName.split(',')[1].split('=')[1]}}}

$ou | ForEach {Get-ADUser -Filter * -SearchBase $_ -prop DistinguishedName |select name, @{name= "OU";expression={$_.DistinguishedName.split(',')[1].split('=')[1]}}} | Export-Csv -Path .\UsersOU.csv -NoTypeInformation
