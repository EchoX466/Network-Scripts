# Edit Array as needed for end devices

$computers = @(
    "x.x.x.x"
    "x.x.x.x"
    "x.x.x.x"
)

# Define what the script will do
$job = Test-Connection -ComputerName $computers -Count 1 -AsJob

# Wait for job completion before continuing
$job | Wait-Job

# Retrieve Results and store in variable $results
$results = $job | Receive-Job


# Format results as: Address, Response Time and the Status Code
$results | Format-Table Address, ResponseTime, StatusCode




# Maybe end up doing a #ForEach and iterating through the array? Might require PS7

# results = $computeres | ForEach object in parallel
#    Test the connection {ComputerName} 3 times |
#    Select the object, {Address, Response Time, Status Code of Response
#To Be Continued


