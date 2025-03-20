<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.vts.util.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Employee</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-width: 500px;
            margin: 40px auto;
        }

        .form-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .form-group label {
            font-weight: 500;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            transition: border-color 0.3s;
            font-size: 16px;
            box-shadow: none;
            outline: none;
        }

        .form-group input:focus, .form-group select:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
        }

        .gender-options {
            display: flex;
            gap: 15px;
            margin-top: 5px;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }

        .btn-primary {
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #45a049;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<%
    String[] ids = (String[]) session.getAttribute("ids");

    if (ids != null && ids.length > 0) {
        String id = ids[0];

        try {
            Connection con = ConnectionProvider.getCon();
            String query = "SELECT e.id, e.name, d.role, e.gender, e.dob, e.email, e.salary " +
                           "FROM employee e INNER JOIN designation d ON e.designationid = d.id WHERE e.id = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
%>

<div class="form-container">
    <h2>Edit Employee Details</h2>
    <form action="updateemployee.jsp" method="post" onsubmit="return confirmSubmit();">

        <!-- Hidden ID -->
        <input type="hidden" name="id" value="<%= rs.getString("id") %>">

        <!-- Name -->
        <div class="form-group mb-3">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" pattern="^[A-Za-z][A-Za-z\\s]*$"
                value="<%= rs.getString("name") %>" required
                placeholder="Enter your name"
                onkeypress="return /^[A-Za-z\\s]*$/.test(event.key) && (event.target.value !== '' || event.key !== ' ')">
        </div>

        <!-- Designation -->
        <div class="form-group mb-3">
            <label for="designation">Designation</label>
            <select id="designation" name="designation" required>
                <option value="<%= rs.getString("role") %>"><%= rs.getString("role") %></option>
                <%
                    Statement stmt = con.createStatement();
                    String roleQuery = "SELECT role FROM designation";
                    ResultSet rs1 = stmt.executeQuery(roleQuery);
                    while (rs1.next()) {
                %>
                <option value="<%= rs1.getString("role") %>"><%= rs1.getString("role") %></option>
                <% } %>
            </select>
        </div>

        <!-- Gender -->
        <div class="form-group mb-3">
            <label>Gender</label>
            <div class="gender-options">
                <input type="radio" id="male" name="gender" value="Male" <%= rs.getString("gender").equalsIgnoreCase("male") ? "checked" : "" %>> <label for="male">Male</label>
                <input type="radio" id="female" name="gender" value="Female" <%= rs.getString("gender").equalsIgnoreCase("female") ? "checked" : "" %>> <label for="female">Female</label>
                <input type="radio" id="other" name="gender" value="Other" <%= rs.getString("gender").equalsIgnoreCase("other") ? "checked" : "" %>> <label for="other">Other</label>
            </div>
        </div>

        <!-- Date of Birth -->
        <div class="form-group mb-3">
            <label for="dob">Date of Birth</label>
            <input type="date" id="dob" name="dob" value="<%= rs.getString("dob") %>" required>
        </div>

        <!-- Salary -->
        <div class="form-group mb-3">
            <label for="salary">Salary</label>
            <input type="number" id="salary" name="salary" value="<%= String.format("%.2f", rs.getFloat("salary")) %>" required>
        </div>

        <!-- Email -->
        <div class="form-group mb-3">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<%= rs.getString("email") %>" required>
        </div>

        <!-- Buttons -->
        <div class="btn-container">
            <input type="submit" value="Update" class="btn-primary">
            <input type="button" value="Back" class="btn-secondary" onclick="history.back();">
        </div>

    </form>
</div>

<%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        out.print("No employee selected for editing.");
    }
%>

<script>
    function confirmSubmit() {
        return confirm('Are you sure you want to update the record?');
    }
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
