$val0 = Get-ADGroupMember -Identity "CN=_Dzial,OU=Groups,DC=domain,DC=lcl" | Where objectClass -eq "user"

foreach ($item in $val0)
    {
        $user = (Get-ADUser -identity $item | select SamAccountName)
        $Email = (Get-Aduser $user.SamAccountName -Properties 'mail').mail
        $emailOld = (Get-ADUser -identity $item | select UserPrincipalName).UserPrincipalName
            if(-not($Email))
            {
            $Email = Write-Host $user.SamAccountName ' Email not found. Please Enter Manually'
            $emailNew = $emailOld -replace ".lcl", ".eu"
            Write-Host $emailNew
            #Set-ADUser -EmailAddress $emailNew
            }
        else 
            {
            Write-Host $user.SamAccountName ' email is ' $Email
            }
    
    }
