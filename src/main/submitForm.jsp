<%@ page import="java.sql.*" %>
<%@ page import="Shopping.ConnectionProvider" %>
<%
    // Retrieve form data from the request
    String name = request.getParameter("name");
    String roleid = request.getParameter("designation");
    String gender = request.getParameter("gender");
    String dob = request.getParameter("dob");
    double salary = Double.parseDouble(request.getParameter("salary"));
    String email = request.getParameter("email");
    int id = 0;

    Connection con = null;
    PreparedStatement pst = null;
    try {
        // Establish database connection
        con = ConnectionProvider.getCon();
        
        Statement stmt = con.createStatement();
        String query = "SELECT id FROM designations WHERE role = '" + roleid + "'";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			id   = rs.getInt("id"); // Get the id column value
		    // Process each id as needed
		}
        // Prepare the SQL query to insert data into employees table
        String insertQuery = "INSERT INTO employee (name, roleid, gender, dob, salary, email) VALUES (?, ?, ?, ?, ?, ?)";
        
        // Create a prepared statement to execute the query
        pst = con.prepareStatement(insertQuery);
        
        // Set the parameters for the query
        pst.setString(1, name);           // Name
        pst.setInt(2, id);    // Designation
        pst.setString(3, gender);         // Gender
        pst.setString(4, dob);            // Date of Birth
        pst.setDouble(5, salary);         // Salary
        pst.setString(6, email);          // Email
        
        // Execute the update
        int result = pst.executeUpdate();
        
        // Check if the record was inserted successfully
         if (result > 0) {
                // Redirect to employees.jsp after successful insertion
                response.sendRedirect("one.jsp");
            } else {
                out.print("Failed to save the employee data.");
            }
    } catch (Exception e) {
        // Handle any exceptions (e.g., SQL errors)
        out.print("Error: " + e.getMessage());
    } finally {
        // Close the database resources
        try {
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.print("Error closing resources: " + e.getMessage());
        }
    }
%>
