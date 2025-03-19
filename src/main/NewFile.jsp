<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Input Validation</title>
    <script type="text/javascript">
        // Function to validate the input
        function validateInput(event) {
            var inputField = document.getElementById("nameInput");
            var value = inputField.value;

            // Check if the first character is a space
            if (value.length > 0 && value.charAt(0) === ' ') {
                inputField.value = value.trim(); // Remove the leading space
            }

            // Replace any numeric characters with an empty string
            inputField.value = inputField.value.replace(/[0-9]/g, '');

            // Update placeholder based on current value
            if (inputField.value === "") {
                inputField.placeholder = "Enter a name (no numbers allowed)";
            } else {
                inputField.placeholder = "";
            }
        }
    </script>
</head>
<body>
    <h1>Input Validation Example</h1>
    <form>
        <label for="nameInput">Name: </label>
        <input type="text" id="nameInput" placeholder="Enter a name (no numbers allowed)" 
               oninput="validateInput(event)" />
    </form>
</body>
</html>
