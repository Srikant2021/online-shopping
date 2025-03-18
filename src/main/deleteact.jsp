<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page
	import="java.sql.*, java.util.*, javax.servlet.*, javax.servlet.http.*"%>
<%@ page import="Shopping.ConnectionProvider"%>
<%
String action = request.getParameter("action");
String[] selectedIds = request.getParameterValues("id");

// Check if any checkboxes are selected
if (selectedIds == null || selectedIds.length == 0) {
	out.println("<script>alert('Please select at least one product.'); window.history.back();</script>");
	return;
}

// Process based on the action
if ("Delete Selected".equals(action)) {
	// Handle deleting selected products
	try {
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("DELETE FROM product WHERE id = ?");

		for (String id : selectedIds) {
	ps.setString(1, id);
	ps.executeUpdate();
		}
		out.println(
		"<script>alert('Selected products deleted successfully.'); window.location.href = 'deleteact.jsp';</script>");
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>alert('Error while deleting products.'); window.history.back();</script>");
	}
} else if ("Edit Selected".equals(action)) {
	// Handle editing selected products
	// For now, we'll just show the selected IDs (in a real scenario, you'd redirect to an edit page)
	out.println("<h3>You selected to edit the following products:</h3>");
	out.println("<ul>");
	for (String id : selectedIds) {
		out.println("<li>Product ID: " + id + "</li>");
	}
	out.println("</ul>");
	out.println("<p>Redirecting to edit page...</p>");
	 //HttpSession session = request.getSession();
     session.setAttribute("selectedProductIds", selectedIds);
	// Normally, you'd redirect to an actual edit form
	response.sendRedirect("editProduct.jsp"); // Replace with the actual edit page URL
}
%>
