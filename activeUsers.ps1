Get-ADUser -Filter * -Properties samaccountname | Where { $_.Enabled -eq $True} | Select Name,samaccountname | Export-csv -Encoding UTF8 -path C:\Users\grzegorz.chrzastek\Desktop\activeUsers.csv
