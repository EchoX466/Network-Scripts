# Edit Array as needed for end devices

$computers = @(
    "x.x.x.x"
    "x.x.x.x"
    "x.x.x.x"
)

# Status Code Table
$statuscodemap = @(
    0          = "Success"
    11010      = "Timed Out"
    11003      = "Host Unreachable"
    11002      = "Network Unreachable"
    11005      = "Port Unreachable"

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



# Maybe end up doing a #ForEach and iterating through the array? Might require PS7

# results = $computeres | ForEach object in parallel
#    Test the connection {ComputerName} 3 times |
#    Select the object, {Address, Response Time, Status Code of Response




