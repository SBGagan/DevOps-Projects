<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Docker Container Information</title>
</head>
<body>

<h1>Docker Container Information</h1>

<div id="containerInfo"></div>

<script>
    // Function to fetch Docker container information
    function fetchContainerInfo() {
        fetch('/containers/json')  // This endpoint retrieves a list of containers
            .then(response => response.json())
            .then(data => {
                // Process the container information
                let containerInfoHTML = '<h2>Container List</h2>';
                containerInfoHTML += '<ul>';
                data.forEach(container => {
                    containerInfoHTML += `<li>${container.Names[0]} - ${container.State}</li>`;
                });
                containerInfoHTML += '</ul>';
                // Display the container information in the specified div
                document.getElementById('containerInfo').innerHTML = containerInfoHTML;
            })
            .catch(error => console.error('Error fetching container information:', error));
    }

    // Fetch container information when the page loads
    window.onload = fetchContainerInfo;
</script>

</body>
</html>

