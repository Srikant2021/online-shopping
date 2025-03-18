<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Shopping.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Employee</title>
</head>
<body>
	<h2>Edit Employee Details</h2>
	<%
	String[] selectedIds = request.getParameterValues("selectedIds");

	if (selectedIds != null && selectedIds.length > 0) {
		String id = selectedIds[0]; // Get the first selected ID (for single selection)

		try {
			Connection con = ConnectionProvider.getCon();
			String query = "SELECT * FROM employee WHERE id = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
	%>
	<!-- Edit Form -->
	<form action="updateEmployee.jsp" method="post">
		<input type="hidden" name="id" value="<%=rs.getString("id")%>">
		Name: <input type="text" name="name"
			value="<%=rs.getString("name")%>"><br> Role: <input
			type="text" name="role" value="<%=rs.getString("role")%>"><br>
		Gender: <input type="radio" name="gender" value="Male"
			<%=rs.getString("gender").equals("Male") ? "checked" : ""%>>
		Male <input type="radio" name="gender" value="Female"
			<%=rs.getString("gender").equals("Female") ? "checked" : ""%>>
		Female <input type="radio" name="gender" value="Other"
			<%=rs.getString("gender").equals("Other") ? "checked" : ""%>>
		Other<br> Date of Birth: <input type="date" name="dob"
			value="<%=rs.getString("dob")%>"><br> Salary: <input
			type="text" name="salary" value="<%=rs.getString("salary")%>"><br>
		Email: <input type="email" name="email"
			value="<%=rs.getString("email")%>"><br> <input
			type="submit" value="Update">
	</form>
	<%
	} else {
	out.print("No employee found with the selected ID.");
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	} else {
	out.print("No employee selected for editing.");
	}
	%>
</body>
</html>
