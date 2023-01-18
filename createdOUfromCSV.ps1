# Import active directory module for running AD cmdlets
Import-Module activedirectory

#Store the data from the CSV in the $ADOU variable. 
Get-Content C:\Users\grzegorz.chrzastek\Desktop\ou.csv | Out-File C:\Users\grzegorz.chrzastek\Desktop\ou_utf8.csv -Encoding utf8
$ADOU = Import-csv C:\Users\grzegorz.chrzastek\Desktop\ou_utf8.csv -Delimiter ";"
#Write-Host $ADOU
#Loop through each row containing user details in the CSV file
foreach ($ou in $ADou)
{
#Read data from each field in each row and assign the data to a variable as below

$name = $ou.name
#Write-Host $name
$path = $ou.path
#Write-Host $path

#Account will be created in the OU provided by the $OU variable read from the CSV file
New-ADOrganizationalUnit `
-Name $name `
-path $path `

}


plik csv:

name;path
Prezes Zarządu;OU=Stanowiska,OU=VISO,DC=domaina,DC=lcl
Stanowisko1;OU=Stanowiska,OU=VISO,DC=telemetria,DC=lcl
Stanowisko2;OU=Stanowiska,OU=VISO,DC=telemetria,DC=lcl
