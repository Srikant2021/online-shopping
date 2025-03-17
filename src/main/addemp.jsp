<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Shopping.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Information Form</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	padding: 20px;
}

.form-container {
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	margin: 0 auto;
}

.form-container h2 {
	text-align: center;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	font-weight: bold;
	display: block;
}

.form-group input, .form-group select {
	width: 100%;
	padding: 8px;
	margin-top: 5px;
	border-radius: 4px;
	border: 1px solid #ccc;
}

.form-group input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
	font-size: 16px;
}

.form-group input[type="submit"]:hover {
	background-color: #45a049;
}

/* Styling for radio buttons to make them appear inline */
.gender-options {
	display: flex;
	gap: 20px; /* Space between radio buttons */
}

.gender-options input {
	margin-right: 5px; /* Optional: space between radio button and label */
}
</style>
</head>
<body>

	<div class="form-container">
		<h2>Employee Information</h2>
		<form action="submitForm.jsp" method="post">
			<!-- Name Field -->
			<div class="form-group">
				<label for="name">Name</label> <input type="text" id="name"
					name="name" required placeholder="Enter your name">
			</div>

			<!-- Designation Field (Dropdown populated from backend) -->
			<div class="form-group">
				<label for="designation">Designation</label> <select
					id="designation" name="designation" required>
					<option value="">Select Designation</option>
					<%
					try {
						// Connect to database
						Connection con = ConnectionProvider.getCon();
						Statement stmt = con.createStatement();
						String query = "SELECT role FROM designations"; // Assuming the table is called 'designations'
						ResultSet rs = stmt.executeQuery(query);

						// Loop through result and create options dynamically
						while (rs.next()) {
					%>
					<option value="<%=rs.getString("role")%>">
						<%=rs.getString("role")%>
					</option>
					<%
					}
					} catch (Exception e) {
					out.print("Error: " + e.getMessage());
					}
					%>
				</select>
			</div>

			<!-- Gender Field (Radio Buttons) -->
			<div class="form-group">
				<label for="gender">Gender</label>
				<div class="gender-options">
					<input type="radio" id="male" name="gender" value="Male" required>
					<label for="male">Male</label> <input type="radio" id="female"
						name="gender" value="Female" required> <label for="female">Female</label>

					<input type="radio" id="other" name="gender" value="Other" required>
					<label for="other">Other</label>
				</div>
			</div>

			<!-- Date of Birth Field -->
			<div class="form-group">
				<label for="dob">Date of Birth</label> <input type="date" id="dob"
					name="dob" required>
			</div>

			<!-- Salary Field -->
			<div class="form-group">
				<label for="salary">Salary</label> <input type="number" id="salary"
					name="salary" required placeholder="Enter your salary">
			</div>

			<!-- Email Field -->
			<div class="form-group">
				<label for="email">Email</label> <input type="email" id="email"
					name="email" required placeholder="Enter your email">
			</div>

			<!-- Submit Button -->
			<div class="form-group">
				<input type="submit" value="Submit">
			</div>
		</form>
	</div>

</body>
</html>
