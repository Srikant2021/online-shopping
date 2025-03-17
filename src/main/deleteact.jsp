<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="Shopping.ConnectionProvider"%>
<%
String[] idsToDelete = request.getParameterValues("id"); // Get the IDs of the selected checkboxes
String action = request.getParameter("action");

if (idsToDelete != null && idsToDelete.length > 0) {

	if ("Delete Selected Employee(s)".equals(action)) {
		try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement pst = null;
	for (String id : idsToDelete) {
		String deleteQuery = "DELETE FROM product WHERE id = ?";
		pst = con.prepareStatement(deleteQuery);
		pst.setString(1, id);
		pst.executeUpdate();
	}
	response.sendRedirect("one.jsp"); // Redirect to the page where the table is displayed
		} catch (Exception e) {
	out.print("Error: " + e.getMessage());
		}
	} else if ("Edit Selected Employee(s)".equals(action)) {
		response.sendRedirect("editEmployee.jsp?ids=" + String.join(",", idsToDelete));

	} else {
		out.print("No employee found with the selected ID.");
	}
}
%>
