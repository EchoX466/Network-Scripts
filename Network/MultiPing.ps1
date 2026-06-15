# Edit Array as needed for end devices

$computers = @(
    "x.x.x.x"
    "x.x.x.x"
    "x.x.x.x"
)

# Define what the script will do
$job = Test-Connection -ComputerName $computers -Count 2 -AsJob


# Maybe end up doing a #ForEach and iterating through the array? Might require PS7

# results = $computeres | ForEach object in parallel
#    Test the connection {ComputerName} 3 times |
#    Select the object, {Address, Response Time, Status Code of Response
#To Be Continued


