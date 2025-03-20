<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.vts.util.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Employee Management</title>

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
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }

        h3 {
            color: #343a40;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .table-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        #myTable {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 8px;
        }

        #myTable th {
            text-align: center;
            padding: 12px;
            vertical-align: middle;
            border: 1px solid #dee2e6;
        }

        #myTable td {
            padding: 12px;
            vertical-align: middle;
            border: 1px solid #dee2e6;
        }

        #myTable th {
            background-color: #3439C2;
            color: #ffffff;
            font-weight: bold;
        }

        #myTable tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        #myTable tbody tr:hover {
            background-color: #f1f1f1;
        }

        input[type="radio"] {
            width: 16px;
            height: 16px;
            accent-color: #007bff;
            cursor: pointer;
        }

        .alert {
            text-align: center;
            width: 50%;
            margin: 0 auto;
        }

        .action-buttons {
            margin-top: 15px;
        }

        .btn-custom {
            width: 120px;
            padding: 8px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.2s ease;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-warning:hover {
            background-color: #e0a800;
            border-color: #e0a800;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #c82333;
        }

        .dataTables_wrapper .dataTables_paginate {
            display: flex;
            justify-content: center;
            gap: 2px;
            margin-top: 10px;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 5px 10px;
            margin: 0 1px;
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 14px;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background-color: #0056b3;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button.current {
            background-color: #0056b3;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <%
        String message = (String) session.getAttribute("message");
        if (message != null) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= message %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        session.removeAttribute("message");
        }
    %>

    <div class="container mt-4">
        <h3 class="text-center">Employee Information</h3>
        <div class="table-container">
            <form id="employeeForm" action="deleteact.jsp" method="post" onsubmit="return confirmDelete();">
                <input type="hidden" name="actionClicked" id="actionClicked"> <!-- Hidden field to track the action -->
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
                                        formattedDob = new SimpleDateFormat("dd-MM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dob));
                                    }
                        %>
                        <tr>
                            <td style="text-align: center"><input type="radio" name="id" value="<%= rs.getString("id") %>"></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("role") %></td>
                            <td><%= rs.getString("gender") %></td>
                            <td style="text-align: center"><%= formattedDob %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("salary") %></td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>

                <!-- Buttons -->
                <div class="text-center action-buttons">
                    <a href="NewFile1.jsp" class="btn btn-primary btn-custom">Add</a> 
                    <input type="button" class="btn btn-warning btn-custom" value="Edit" onclick="setAction('Edit')"> 
                    <input type="button" class="btn btn-danger btn-custom" value="Delete" onclick="setAction('Delete')">
                </div>
            </form>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            new DataTable('#myTable', {
                lengthMenu: [[5, 10, 25, 50, 75, 100], [5, 10, 25, 50, 75, 100]],
                pageLength: 5,
                order: [[0, 'asc']],
                searching: true,
                paging: true,
                language: {
                    paginate: {
                        previous: 'Prev',
                        next: 'Next'
                    },
                    lengthMenu: 'Show _MENU_ records per page',
                    search: 'Search:'
                }
            });

            $(".first.paginate_button, .last.paginate_button").hide(); // Hide arrows
        });

       

        function confirmDelete() {
            let selectedId = document.querySelector('input[name="id"]:checked');

            if (!selectedId) {
                alert('Please select a record');
                return false;
            }

            const actionClicked = document.getElementById('actionClicked').value;

            // Show confirmation only for delete action
            if (actionClicked === 'Delete') {
                return confirm("Are you sure you want to delete this record?");
            }

            // If action is Edit, no confirmation required
            if (actionClicked === 'Edit')
