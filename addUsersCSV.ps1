#Import active directory module for running AD cmdlets
Import-Module ActiveDirectory

# Define UPN
$UPN = "domain.lcl"

#Store the data
$ADUsers = Import-Csv C:\Users\grzegorz.chrzastek.a\Desktop\laOkscript\usersLAtoImport.csv -Delimiter ";"
Write-Host "$ADUsers"
foreach ($User in $ADUsers){
    $TextInfo = (Get-Culture).TextInfo
    #read user
    $username = $User.Name
    $givenName = $User.GivenName
    $givenName = $TextInfo.ToTitleCase($givenName)
    $surname = $User.Surname
    $surname = $TextInfo.ToTitleCase($surname)
	$sAMAccountName = $User.sAMAccountName
    $path = $User.Path
    $password = $User.AccountPassword
    #Write-Host "$username"
    #Write-Host $sAMAccountName.Length
    #$sAMAccountNameTrim = $sAMAccountName.Substring(0,(18 - $surname.Length))
    #Write-Host $sAMAccountNameTrim
    #Write-Host "$sAMAccountNameTrim"

    if ($sAMAccountName.Length -ge 21) {
        #Write-Host "$sAMAccountName"
        #Write-Host $sAMAccountName.Length
        $makeCalc = $sAMAccountName.Length - 20
        #Write-Host "$makeCalc"
        $sAMAccountNameTrim = $sAMAccountName.Substring(0,($sAMAccountName.Length - $makeCalc))
        #Write-Host $sAMAccountNameTrim
        #Write-Host $sAMAccountNameTrim.Length
        New-ADUser ` -Name $username `
		-sAMAccountName $sAMAccountNameTrim `
		-displayName $username `
        -GivenName $givenName `
        -Surname $surname `
        -UserPrincipalName "$sAMAccountName@$UPN" `
        -Path $path `
        -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) `
        -ChangePasswordAtLogon $true -Enabled $true
    }
    else {
    New-ADUser ` -Name $username `
		-sAMAccountName $sAMAccountName `
		-displayName $username `
        -GivenName $givenName `
        -Surname $surname `
        -UserPrincipalName "$sAMAccountName@$UPN" `
        -Path $path `
        -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) `
        -ChangePasswordAtLogon $true -Enabled $true
    }

    #New-ADUser ` -Name $username `
	#	-sAMAccountName $sAMAccountName `
	#	-displayName $username `
    #    -GivenName $givenName `
    #    -Surname $surname `
    #    -UserPrincipalName "$sAMAccountName@$UPN" `
    #    -Path $path `
    #    -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) `
    #    -ChangePasswordAtLogon $true -Enabled $true
}

