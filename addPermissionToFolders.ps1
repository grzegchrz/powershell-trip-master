<#   
    .NOTES
        Version:        0.0.1
        Author:         Grzegorz Chrząstek
        Creation Date:  2022.02.02
  #>


#$specialDomainGroup  -grupa w Domenie
$specialDomainGroup = "domain\__folder"
#$foldersPath - pwd lokalizacji literowanych folderów
$foldersPath = "C:\Users\helpdesk.gc\Desktop\"
#$foldersArray - wylistowanie folderów na które nakłaane będą uprawnienia
$foldersArray = @("1","2","3")
# Add a new permission
foreach ($folder in $foldersArray){
    #Write-Host $folder
    #Write-Host $foldersPath
    $thisFolder = $foldersPath+$folder
    #Write-Host $thisFolder
	$acl = Get-Acl -Path $thisFolder
	$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($specialDomainGroup,"Modify", "ContainerInherit,ObjectInherit", "None", "Allow")
    $acl.SetAccessRule($accessRule)
	$acl | Set-Acl -Path $thisFolder
}
