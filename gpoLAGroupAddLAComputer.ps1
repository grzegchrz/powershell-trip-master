$ComputerName = $env:computername
$GroupNameLA = "LA.$ComputerName"
$DomainName = "domain.lcl"
$AdminGroup = [ADSI]("WinNT://$ComputerName/Administratorzy,Group")
$AdminGroup.Add("WinNT://$DomainName/$GroupNameLA,Group")
