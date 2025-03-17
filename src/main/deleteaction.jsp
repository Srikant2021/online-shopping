<%@ page import="java.sql.*"%>
<%@ page import="Shopping.ConnectionProvider"%>
<%
String[] idsToDelete = request.getParameterValues("id"); // Get the IDs of the selected checkboxes
String action = request.getParameter("action");
if (idsToDelete != null && idsToDelete.length > 0) {
	if ("Delete Selected Employee(s)".equals(action)) {
		if (idsToDelete != null) {
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
		} else {
	out.print("No products selected for deletion.");
		}
	} else {
		out.print("No employee selected for editing.");
	}
}
%>
