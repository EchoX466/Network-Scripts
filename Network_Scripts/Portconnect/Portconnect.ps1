
# Accept a list of IP's

$IPList = Read-Host -Prompt "Please enter the list of IP's you want to test: "

# Split IPList 

$IPs = $IPList -split "," | ForEach-Object { $_.Trim() } | Where-Object {$_ -ne "" }

# Accept a list of Ports

$PortList = Read-Host -Prompt "Please enter the list of ports you want to test: "

# Split PortList

$Ports = $PortList -split "," | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }

# Test each IP and port
foreach ($IP in $IPs) {
    foreach ($Port in $Ports) {
        $result = Test-NetConnection -ComputerName $IP -Port $Port
            
        # Output result
        if ($result.TcpTestSucceeded) {
            Write-Host "$IP : Port $Port is OPEN" -ForegroundColor Green
        } else {
            Write-Host "$IP : Port $Port is CLOSED" -ForegroundColor Red
        }
    }
}

# Script execution is slooowww... need to test each IP and port in Parallel form
# Wrap in try block.. if test succeeds, port is open. else port is closed. catch block for ip and port test failure
