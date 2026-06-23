
# Accept a list of IP's

$IPList = Read-Host -Prompt "Please enter the list of IP's you want to test: "

# Split IPList 

IP's = $IPList -split "," | ForEach-Object { $_.Trim() } | Where-Object {$_ -ne "" }

# Accept a list of Ports

$PortList = Read-Host -Prompt "Please enter the list of ports you want to test: "

# Split PortList

# $Ports = $PortList -split "," | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }


