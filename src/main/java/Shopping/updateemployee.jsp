<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.vts.util.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Submit Employee Update</title>

</head>
<body>
    <%
    String employeeId = request.getParameter("id");
    String name = request.getParameter("name");
    String designation = request.getParameter("designation");
    String gender = request.getParameter("gender");
    String dob = request.getParameter("dob");
    String email = request.getParameter("email");
    String salaryStr = request.getParameter("salary");

    if (employeeId != null && !employeeId.isEmpty() ) {

        try {
            float salary = Float.parseFloat(salaryStr);

            Connection con = ConnectionProvider.getCon();

            String query = "update employee set name = ?, designationid = (select id from designation where role = ?), gender = ?, dob = ?, email = ?, salary = ? where id = ?";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, name);
            pst.setString(2, designation);
            pst.setString(3, gender);
            pst.setString(4, dob);
            pst.setString(5, email);
            pst.setFloat(6, salary);
            pst.setString(7, employeeId);

            int rowsAffected = pst.executeUpdate();

            if (rowsAffected > 0) {
            	
            	session.setAttribute("message", "Employee updated successfully.");
                response.sendRedirect("NewFile.jsp");
            	//out.println(
            		//	"<script>alert('Selected employees updated successfully.'); window.location.href = 'valid.jsp';</script>");
            	//response.sendRedirect("index.jsp");
            } else {
                out.print("<h3>Failed to update employee details. Please try again.</h3>");
            }

            pst.close();
            con.close();
        } catch (SQLException e) {
            out.print("<h3>Error updating employee details: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } catch (NumberFormatException e) {
            out.print("<h3>Invalid salary format. Please enter a valid number.</h3>");
        } catch (Exception e) {
            out.print("<h3>Unexpected error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    } else {
        out.print("<h3>All fields are required. Please complete the form and try again.</h3>");
    }
    %>

    <br>
    <a href="editEmployee.jsp">Go Back to Edit Employee</a>
</body>
</html>
