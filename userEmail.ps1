$user = (Get-ADUser -identity "CN=Grzegorz Chrząstek,CN=Users,DC=domain,DC=lcl" | select SamAccountName)
(Get-ADUser $user.SamAccountName -Properties 'mail').mail
