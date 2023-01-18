Get-ADUser -Filter * -Properties samaccountname | Where { $_.Enabled -eq $False} | Select Name,samaccountname | Export-csv -Encoding UTF8 -path C:\Users\grzegorz.chrzastek\Desktop\oldUsers.csv
