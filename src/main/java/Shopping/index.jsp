<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.vts.util.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>
</head>
<body>


	<div class="container mt-4">
		<h3 class="text-center">Employee Information</h3>
		<form action="deleteact.jsp" method="post">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Select</th>
						<th>Name</th>
						<th>Designation</th>
						<th>Gender</th>
						<th>DOB</th>
						<th>Email</th>
						<th>Salary</th>
					</tr>
				</thead>
				<tbody>
					<%
					try {//select * from employee inner join designation on employee.designationid=designation.id
						Connection con = ConnectionProvider.getCon();
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery(
						"select e.id,e.name,d.role,e.gender,e.dob,e.email,e.salary from employee e , designation d where e.designationid=d.id");
						while (rs.next()) {
					%>
					<tr>
						<!--<td><input type="checkbox" name="id"
							value="<%=rs.getString("id")%>"></td>-->
						<td><input type="radio" name="id"
							value="<%=rs.getString("id")%>"></td>

						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("role")%></td>
						<td><%=rs.getString("gender")%></td>

						<%
						String dob = rs.getString("dob");
						String formattedDob = "";
						if (dob != null && !dob.isEmpty()) {
							try {
								SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd");
								Date date = sdfInput.parse(dob);

								SimpleDateFormat sdfOutput = new SimpleDateFormat("dd-MM-yyyy");
								formattedDob = sdfOutput.format(date);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
						%>
						<td><%=formattedDob%></td>
						<td><%=rs.getString("email")%></td>
						<td><%=rs.getString("salary")%></td>
					</tr>
					<%
					}
					} catch (Exception e) {
					System.out.print(e);
					}
					%>

				</tbody>

			</table>
			<div class="text-center">
				<a href="addEmployee.jsp" class="btn btn-primary mr-2">Add</a> 
				<input class="btn btn-warning mr-2" type="submit" value="Edit" name="action">
				<input class="btn btn-danger" type="submit" value="Delete" name="action">
			</div>
		</form>
		<div class="text-center">
		</div>
	</div>

</body>
</html>