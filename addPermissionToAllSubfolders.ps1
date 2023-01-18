<#
    .NOTES
        Version:        0.0.1
        Author:         Grzegorz Chrząstek
        Creation Date:  2021.04.02

        Skrypt uruchamiany w lokalizacji w której znajdują się foldery do nadania uprawnień

  #>

#$specialDomainGroup - grupa w domenie
$specialDomainGroup = "domain\__folderName"
#$foldersArray - foldery do nadani uprawnień
$foldersArray = @("1","2","3")
foreach ($folder in $foldersArray){
    #$allFoldersFromFolderArray - wyszukuje wszystkie foldery w lokalizacji 
	$allFoldersFromFolderArray = Get-ChildItem -Recurse -Directory  | where {$_.Name -match $folder} | Select-Object FullName
	$pathFolder = $allFoldersFromFolderArray.FullName
	#Write-Host $pathFolder
	$acl = Get-Acl -Path $pathFolder
	$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($specialDomainGroup,"Modify", "ContainerInherit,ObjectInherit", "None", "Allow")
    $acl.SetAccessRule($accessRule)
	$acl | Set-Acl -Path $pathFolder
}
