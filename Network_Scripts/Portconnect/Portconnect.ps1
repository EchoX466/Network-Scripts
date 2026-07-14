
# Accept a list of IP's

$IPList = Read-Host -Prompt "Please enter the list of IP's you want to test: "

# Split IPList 

$IPs = $IPList -split "," | ForEach-Object { $_.Trim() } | Where-Object {$_ -ne "" }

# Accept a list of Ports

$PortList = Read-Host -Prompt "Please enter the list of ports you want to test: "

# Split PortList

$Ports = $PortList -split "," | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }

# Test each IP and port
$Targets = foreach ($IP in $IP) {
	for each (#Port in $Ports) {
        [PSCustomObject]@{
            IP   = $IP
            Port = $Port
        }
    }
}



# $Targets | ForEach-Object -Parallel {
#
#    $IP = $_.IP
#    $Port = $_.Port
#
#    try {
#        $TcpClient = [System.Net.Sockets.TcpClient]::new()
#        
#        $ConnectTask = $TcpClient.ConnectAsync($IP, $Port)
                                   # .ConnectAsync = .NET asynchronous method for initiating network connections
#
        # 3 second timeout
#        if ($ConnectTask.Wait(3000)) {

#            if ($TcpClient.Connected) {
#                [PSCustomObject]@{
#                    IP     = $IP
#                    Port   = $Port
#                    Status = "OPEN"


# Script execution is slooowww... need to test each IP and port in Parallel form
# Wrap in try block.. if test succeeds, port is open. else port is closed. catch block for ip and port test failure
