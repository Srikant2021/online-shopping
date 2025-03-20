<%@ page import="java.sql.*" %>
<%@ page import="com.vts.util.ConnectionProvider" %>
<%
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
        con = ConnectionProvider.getCon();
        
        Statement stmt = con.createStatement();
        String query = "select id from designation where role = '" + roleid + "'";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			id   = rs.getInt("id"); 
		}
        String insertQuery = "insert into employee (name, designationid, gender, dob, salary, email) values (?, ?, ?, ?, ?, ?)";
        
        pst = con.prepareStatement(insertQuery);
        
        pst.setString(1, name);          
        pst.setInt(2, id);    
        pst.setString(3, gender);         
        pst.setString(4, dob);            
        pst.setDouble(5, salary);        
        pst.setString(6, email);          
        
        int result = pst.executeUpdate();
        
        if (result > 0) {
            session.setAttribute("message", "Employee added successfully.");
            response.sendRedirect("NewFile.jsp");
        } else {
            session.setAttribute("message", "Failed to save employee data.");
            response.sendRedirect("valid.jsp");
        }
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    } finally {
        try {
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.print("Error closing resources: " + e.getMessage());
        }
    }
%>