<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Table with Date Picker</title>
    
    <!-- Include jQuery and jQuery UI from a CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

    <style>
        /* Basic Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }
        .pagination button {
            margin: 0 5px;
            padding: 8px 12px;
            cursor: pointer;
        }
    </style>

    <script type="text/javascript">
        // Initialize the date picker on the date input field
        $(document).ready(function() {
            // Apply datepicker to the "DOB" field
            $("#dob").datepicker({
                dateFormat: 'dd-mm-yy',  // Format the date (optional)
                changeMonth: true,       // Allow month change
                changeYear: true,        // Allow year change
                yearRange: '1900:2100'   // Set the valid year range
            });
        });

        // Additional JavaScript for table operations (filter, sort, pagination, etc.)
        // For brevity, I am assuming you are adding the rest of the code as per the previous response.
    </script>
</head>
<body>
    <h1>Employee List</h1>
    
    <form>
        <label for="dob">Date of Birth: </label>
        <input type="text" id="dob" name="dob" placeholder="Select Date of Birth">
    </form>

    <table>
        <thead>
            <tr>
                <th>Select</th>
                <th>Name</th>
                <th>Designation</th>
                <th>Salary</th>
                <th>Date of Birth</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody id="tableBody">
            <!-- Table rows will be populated here -->
        </tbody>
    </table>

    <div class="pagination" id="pagination">
        <!-- Pagination buttons will be populated here -->
    </div>
</body>
</html>
