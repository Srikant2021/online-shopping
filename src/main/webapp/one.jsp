<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Shopping.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%/* <form action="deleteaction.jsp" method="post">*/%>
	<form action="deleteact.jsp" method="post">
		<table>
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col"><i class="fa fa-inr"></i> Price</th>
					<th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
				</tr>
			</thead>
			<tbody>
				<%
				try {
					Connection con = ConnectionProvider.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery(
					"select p.id,p.name, u.answer,u.email from product p inner join users2 u on p.id =u.id where active='Yes'");
					while (rs.next()) {
				%>
				<tr>
					<td><input type="checkbox" name="id"
						value="<%=rs.getString("id")%>"></td>
					<td><%=rs.getString("id")%></td>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("answer")%></td>
					<td><i class="fa fa-inr"></i> </i><%=rs.getString("email")%></td>
					<td><a href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add
							to cart <i class='fas fa-cart-plus'></i>
					</a></td>
				</tr>
				<%
				}
				} catch (Exception e) {
				System.out.print(e);
				}
				%>


			</tbody>

		</table>
		<input type="submit" value="Delete"> <input type="submit"
			name="action" value="Delete Selected Employee(s)"> <input
			type="submit" name="action" value="Edit Selected Employee(s)">
	</form>
	<%/*
	<form action="editEmployee.jsp" method="get">
		<input type="submit" value="Edit Employee">
	</form>*/%>
	<a href="addemp.jsp?">Addemp</a>
	<br>
	<a href="deleteaction.jsp">delete</a>
	<br>
	<a href="edit.jsp?">edit</a>
	<br>
</body>
</html>