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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/2.2.2/css/dataTables.dataTables.css" />
<script src="https://cdn.datatables.net/2.2.2/js/dataTables.js"></script>
</head>
<body>


	<div class="container mt-4">
		<h3 class="text-center">Employee Information</h3>
		<form action="deleteact.jsp" method="post">
			<table id="myTable" class="table table-bordered">
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
						<td style="text-align: center;"><input type="radio" name="id"
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
						<td style="text-align: center;"><%=formattedDob%></td>
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
				<a href="addEmployee.jsp" class="btn btn-primary mr-2">Add</a> <input
					class="btn btn-warning mr-2" type="submit" value="Edit"
					name="action"> <input class="btn btn-danger" type="submit"
					value="Delete" name="action">
			</div>
		</form>
		<div class="text-center"></div>
	</div>

	<script type="text/javascript">
		/* $(document).ready(function() {
			$('#myTable').DataTable();
		}); */
		/* $(el).dataTable({
			language : {
				'paginate' : {
					'previous' : '<span class="prev-icon"></span>',
					'next' : '<span class="next-icon"></span>'
				}
			}
		}); */

		$(document).ready(function() {
			new DataTable('#myTable', {
				lengthMenu : [ [ 5, 10, 25, 50, 75, 100 ], 
				[ 5, 10, 25, 50, 75, 100 ] 
				],

				pageLength : 5,
				order : [ [ 0, 'asc' ] ], 
				searching : true, 
				paging : true, 
				language : {
					paginate : {
						first : 'Prev',
						last : 'Next' 
					}
				}
			});
		});
	</script>
</body>
</html>