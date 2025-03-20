<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.vts.util.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Employee</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/2.2.2/css/dataTables.dataTables.css" />
    
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/2.2.2/js/dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        /* Center table content */
        th {
            text-align: center;
            vertical-align: middle;
        }

        /* Custom styles for pagination buttons */
        .dataTables_wrapper .dataTables_paginate {
            display: flex;
            justify-content: center;
            gap: 5px;
            margin-top: 10px;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 5px 12px;
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin: 0 2px;
            font-size: 14px;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background-color: #0056b3;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button.current {
            background-color: #0056b3;
            font-weight: bold;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button.disabled {
            background-color: #ccc;
            color: #666;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
<div class="d-flex justify-content-center mt-3">
    <div class="alert alert-success alert-dismissible fade show text-center" role="alert" style="width: 50%;">
        <%= message %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<%
        session.removeAttribute("message");
    }
%>




<div class="container mt-4">
    <h3 class="text-center">Employee Information</h3>
    <form id="employeeForm" action="deleteact.jsp" method="post">
        <table id="myTable" class="table table-bordered">
            <thead>
                <tr>
                    <th>Select</th>
                    <th>Name</th>
                    <th>Designation</th>
                    <th>Gender</th>
                    <th>DOB</th>
                    <th>Email</th>
                    <th>Salary</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(
                        "SELECT e.id, e.name, d.role, e.gender, e.dob, e.email, e.salary FROM employee e, designation d WHERE e.designationid = d.id"
                    );
                    while (rs.next()) {
                        String dob = rs.getString("dob");
                        String formattedDob = "";
                        if (dob != null && !dob.isEmpty()) {
                            try {
                                SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd");
                                Date date = sdfInput.parse(dob);
                                SimpleDateFormat sdfOutput = new SimpleDateFormat("dd-MM-yyyy");
                                formattedDob = sdfOutput.format(date);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                %>
                <tr>
                    <td  style="text-align: center;">
                        <input type="radio" name="id"  value="<%= rs.getString("id") %>">
                    </td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("role") %></td>
                    <td><%= rs.getString("gender") %></td>
                   <td style="text-align: center;"><%= formattedDob %></td>

                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("salary") %></td>
                </tr>
                <%
                    }
                } catch (Exception e) {
                    System.out.print(e);
                }
                %>
            </tbody>
        </table>
        
        <div class="text-center mt-3">
            <a href="addEmployee.jsp" class="btn btn-primary mr-2">Add</a>
            <input class="btn btn-warning mr-2" type="submit" value="Edit" name="action">
            <input class="btn btn-danger" type="submit" value="Delete" name="action" onclick="return confirmDelete();">
        </div>
    </form>
</div>

<!-- DataTables Initialization -->
<script type="text/javascript">
    $(document).ready(function() {
        new DataTable('#myTable', {
            lengthMenu: [
                [5, 10, 25, 50, 75, 100],
                [5, 10, 25, 50, 75, 100]
            ],
            pageLength: 5, 
            order: [[0, 'asc']], 
            searching: true, 
            paging: true, 
            language: {
                paginate: {
                    first: 'Prev', 
                    last: 'Next'
                },
                lengthMenu: 'Show _MENU_ records per page',
                search: 'Search:'
            }
        });
    });

    function confirmDelete() {
        // Get selected radio button value
        let selectedId = $('input[name="id"]:checked').val();
        
        if (!selectedId) {
            alert('Please select a row to delete.');
            return false;
        }

        
        let confirmAction = confirm("Are you sure you want to delete this record?");
        if (!confirmAction) {
            return false;
        }

        return true; 
    }
</script>

</body>
</html>


