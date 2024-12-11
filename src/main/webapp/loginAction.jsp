<%@page import="Shopping.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
} else {
	int z = 0;
	try {
		//Class.forName("com.mysql.cj.jdbc.Driver");
		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","1962");
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st
		.executeQuery("select *from users2 where email='" + email + "' and password='" + password + "'");
		while (rs.next()) {
	z = 1;
	session.setAttribute("email", email);
	response.sendRedirect("home.jsp");
		}
		if (z == 0) {
	response.sendRedirect("login.jsp?msg=notexist");
		}
	} catch (Exception e) {
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
	}

}
%>