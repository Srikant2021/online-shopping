<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*, java.util.*, javax.servlet.*, javax.servlet.http.*"%>
<%@ page import="com.vts.util.ConnectionProvider"%>
<%
String action = request.getParameter("action");
String[] selectedIds = request.getParameterValues("id");

if (selectedIds == null || selectedIds.length == 0) {
	out.println("<script>alert('Please select at least one employee.'); window.history.back();</script>");
	return;
}

if ("Delete".equals(action)) {
	//out.println("<script>confirm('Are you sure ?');</script>");
	try {
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("delete from employee where id = ?");

		for (String id : selectedIds) {
	ps.setString(1, id);
	ps.executeUpdate();
		}
		//
		 session.setAttribute("message", "Employee deleted successfully.");
            response.sendRedirect("NewFile.jsp");
		
		//
		//out.println(
		//"<script>alert('Selected employees deleted successfully.'); window.location.href = 'valid.jsp';</script>");
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>alert('Error while deleting employee.'); window.history.back();</script>");
	}
} else if ("Edit".equals(action)) {
	out.println("<h3>You selected to edit the following employee:</h3>");
	out.println("<ul>");
	for (String id : selectedIds) {
		out.println("<li>Employee ID: " + id + "</li>");
	}
	//out.println("</ul>");
	out.println("<p>Redirecting to edit page...</p>");
	//HttpSession session = request.getSession();
	session.setAttribute("ids", selectedIds);
	response.sendRedirect("NewFile2.jsp");
}
%>