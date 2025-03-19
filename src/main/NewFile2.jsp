<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Success Message Example</title>

<!-- Inline CSS -->
<style>
.success-message {
	background-color: #4CAF50; /* Green */
	color: white;
	padding: 15px;
	position: fixed;
	top: 0;
	left: 50%; /* Move the element to the center horizontally */
	width: 50%; /* Set the width of the message */
	display: flex;
	align-items: center;
	justify-content: space-between;
	/* Align text and close button on opposite sides */
	font-family: Arial, sans-serif;
	z-index: 1000; /* Ensure it appears above other content */
	box-sizing: border-box; /* Ensure padding doesn't cause overflow */
	transform: translateX(-50%);
	/* Offset by half of its width to truly center it */
}

.close-btn {
	background: none;
	border: none;
	color: white;
	font-size: 20px;
	cursor: pointer;
}

.close-btn:disabled {
	cursor: not-allowed;
	color: #ccc;
}
</style>

<!-- Inline JavaScript -->
<script>
	function closeMessage() {
		// Hide the message
		document.getElementById('success-message').style.display = 'none';

		// Disable the close button
		document.getElementById('close-btn').disabled = true;
	}

	// Simulate an operation on the backend (for testing purposes)
	window.onload = function() {
<%-- Check if the operation was successful --%>
	
<%String operationStatus = "success";%>
	
<%-- Show the success message only if the operation was successful --%>
	<c:if test="${not empty operationStatus and operationStatus == 'success'}">
		setTimeout(function() {
			document.getElementById('success-message').style.display = 'flex';
		}, 1000);
		</c:if>
	};
</script>

</head>
<body>
	<%-- Check if the operation was successful --%>
	<%
	String operationStatus1 = (String) request.getAttribute("operationStatus");
	%>

	<%-- Display success message if the operation is successful --%>
	<c:if
		test="${not empty operationStatus and operationStatus == 'success'}">
		<div id="success-message" class="success-message">
			<span id="message-text">Operation was successful!</span>
			<button id="close-btn" class="close-btn" onclick="closeMessage()">×</button>
		</div>
	</c:if>

	<!-- Your page content here -->
	<div>
		<h1>Welcome to the Operation Page!</h1>
		<p>Perform some operations here.</p>
	</div>
</body>
</html>
