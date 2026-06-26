$computers = @(
    "x.x.x.x"
    "x.x.x.x"
    "x.x.x.x"
)

# Status Code Table
$statuscodemap = @{
    0          = "Success"
    11010      = "Timed Out"
    11003      = "Host Unreachable"
    11002      = "Network Unreachable"
    11005      = "Port Unreachable"
}
# Define what the script will do
$job = Test-Connection -ComputerName $computers -Count 1 -AsJob

# Wait for job completion before continuing
$job | Wait-Job

# Retrieve Results and store in variable $results
$results = $job | Receive-Job


# Format results as: Address, Response and Status Code
$results | Select-Object Address, ResponseTime, StatusCode, @{
    Name = "Status"
    Expression = { [System.Net.NetworkInformation.IPStatus]$_.StatusCode }
} | Format-Table -AutoSize

# Export to CSV

$results | Select Address, ResponseTime, StatusCode | Export-Csv "ping-results.csv" -NoTypeInformation

# Need to set date & time variables and use them as the format of the csv name.... 
