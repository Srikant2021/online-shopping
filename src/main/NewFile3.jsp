<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Table with Sorting, Search, and Pagination</title>

    <style>
        /* Basic table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            cursor: pointer;
            background-color: #f2f2f2;
        }

        /* Controls Container: Displaying records per page on the left and search on the right */
        .controls-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        /* Align the records per page dropdown to the left */
        .records-container {
            display: flex;
            align-items: center;
        }

        select {
            padding: 8px;
        }

        /* Align the search input to the right */
        .search-container {
            display: flex;
            align-items: center;
        }

        input[type="text"] {
            padding: 8px;
            width: 200px;
            margin-left: 10px;
        }

        /* Sorting Arrow Icons */
        .sort-icon {
            margin-left: 5px;
            font-size: 14px; /* Adjust size of the arrow */
            color: #333;
        }

        /* Show down arrow for ascending */
        .sort-asc .sort-icon::after {
            content: " ▼"; /* Down Arrow for Ascending */
        }

        /* Show up arrow for descending */
        .sort-desc .sort-icon::after {
            content: " ▲"; /* Up Arrow for Descending */
        }

        /* Pagination Container */
        .pagination-container {
            text-align: right;
            margin-top: 10px;
        }

        .pagination-container button {
            padding: 8px;
            margin: 0 5px;
            cursor: pointer;
        }

        .pagination-container span {
            padding: 8px;
            margin: 0 5px;
            font-size: 16px;
        }

    </style>
</head>
<body>

<h2>Table with Sorting, Search, and Pagination</h2>

<!-- Controls Container: Records per page on the left and Search Input on the right -->
<div class="controls-container">
    <div class="records-container">
        <select id="recordsPerPage" onchange="changeRecordsPerPage()">
            <option value="5">5 Records</option>
            <option value="10">10 Records</option>
            <option value="20">20 Records</option>
            <option value="50">50 Records</option>
        </select>
    </div>

    <div class="search-container">
        <input type="text" id="searchInput" placeholder="Search..." onkeyup="searchTable()">
    </div>
</div>

<!-- Table -->
<table id="dataTable">
    <thead>
        <tr>
            <th onclick="sortTable(0)" class="sort-asc">ID <span class="sort-icon"></span></th>
            <th onclick="sortTable(1)">Name <span class="sort-icon"></span></th>
            <th onclick="sortTable(2)">Category <span class="sort-icon"></span></th>
            <th onclick="sortTable(3)">Price <span class="sort-icon"></span></th>
        </tr>
    </thead>
    <tbody>
        <%-- Example of dynamic data coming from the backend --%>
        <tr>
            <td>1</td>
            <td>Item A</td>
            <td>Category 1</td>
            <td>$10</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Item B</td>
            <td>Category 2</td>
            <td>$20</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Item C</td>
            <td>Category 3</td>
            <td>$30</td>
        </tr>
        <tr>
            <td>4</td>
            <td>Item D</td>
            <td>Category 1</td>
            <td>$25</td>
        </tr>
        <tr>
            <td>5</td>
            <td>Item E</td>
            <td>Category 2</td>
            <td>$15</td>
        </tr>
        <tr>
            <td>6</td>
            <td>Item F</td>
            <td>Category 3</td>
            <td>$5</td>
        </tr>
        <tr>
            <td>7</td>
            <td>Item G</td>
            <td>Category 1</td>
            <td>$50</td>
        </tr>
        <tr>
            <td>8</td>
            <td>Item H</td>
            <td>Category 2</td>
            <td>$35</td>
        </tr>
        <tr>
            <td>9</td>
            <td>Item I</td>
            <td>Category 3</td>
            <td>$40</td>
        </tr>
        <tr>
            <td>10</td>
            <td>Item J</td>
            <td>Category 1</td>
            <td>$60</td>
        </tr>
         <tr>
            <td>1</td>
            <td>Item A</td>
            <td>Category 1</td>
            <td>$10</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Item B</td>
            <td>Category 2</td>
            <td>$20</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Item C</td>
            <td>Category 3</td>
            <td>$30</td>
        </tr>
        <tr>
            <td>4</td>
            <td>Item D</td>
            <td>Category 1</td>
            <td>$25</td>
        </tr>
        <tr>
            <td>5</td>
            <td>Item E</td>
            <td>Category 2</td>
            <td>$15</td>
        </tr>
        <tr>
            <td>6</td>
            <td>Item F</td>
            <td>Category 3</td>
            <td>$5</td>
        </tr>
        <tr>
            <td>7</td>
            <td>Item G</td>
            <td>Category 1</td>
            <td>$50</td>
        </tr>
        <tr>
            <td>8</td>
            <td>Item H</td>
            <td>Category 2</td>
            <td>$35</td>
        </tr>
        <tr>
            <td>9</td>
            <td>Item I</td>
            <td>Category 3</td>
            <td>$40</td>
        </tr>
        <tr>
            <td>10</td>
            <td>Item J</td>
            <td>Category 1</td>
            <td>$60</td>
        </tr>
         <tr>
            <td>1</td>
            <td>Item A</td>
            <td>Category 1</td>
            <td>$10</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Item B</td>
            <td>Category 2</td>
            <td>$20</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Item C</td>
            <td>Category 3</td>
            <td>$30</td>
        </tr>
        <tr>
            <td>4</td>
            <td>Item D</td>
            <td>Category 1</td>
            <td>$25</td>
        </tr>
        <tr>
            <td>5</td>
            <td>Item E</td>
            <td>Category 2</td>
            <td>$15</td>
        </tr>
        <tr>
            <td>6</td>
            <td>Item F</td>
            <td>Category 3</td>
            <td>$5</td>
        </tr>
        <tr>
            <td>7</td>
            <td>Item G</td>
            <td>Category 1</td>
            <td>$50</td>
        </tr>
        <tr>
            <td>8</td>
            <td>Item H</td>
            <td>Category 2</td>
            <td>$35</td>
        </tr>
        <tr>
            <td>9</td>
            <td>Item I</td>
            <td>Category 3</td>
            <td>$40</td>
        </tr>
        <tr>
            <td>10</td>
            <td>Item J</td>
            <td>Category 1</td>
            <td>$60</td>
        </tr>
         <tr>
            <td>1</td>
            <td>Item A</td>
            <td>Category 1</td>
            <td>$10</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Item B</td>
            <td>Category 2</td>
            <td>$20</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Item C</td>
            <td>Category 3</td>
            <td>$30</td>
        </tr>
        <tr>
            <td>4</td>
            <td>Item D</td>
            <td>Category 1</td>
            <td>$25</td>
        </tr>
        <tr>
            <td>5</td>
            <td>Item E</td>
            <td>Category 2</td>
            <td>$15</td>
        </tr>
        <tr>
            <td>6</td>
            <td>Item F</td>
            <td>Category 3</td>
            <td>$5</td>
        </tr>
        <tr>
            <td>7</td>
            <td>Item G</td>
            <td>Category 1</td>
            <td>$50</td>
        </tr>
        <tr>
            <td>8</td>
            <td>Item H</td>
            <td>Category 2</td>
            <td>$35</td>
        </tr>
        <tr>
            <td>9</td>
            <td>Item I</td>
            <td>Category 3</td>
            <td>$40</td>
        </tr>
        <tr>
            <td>10</td>
            <td>Item J</td>
            <td>Category 1</td>
            <td>$60</td>
        </tr>
         <tr>
            <td>1</td>
            <td>Item A</td>
            <td>Category 1</td>
            <td>$10</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Item B</td>
            <td>Category 2</td>
            <td>$20</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Item C</td>
            <td>Category 3</td>
            <td>$30</td>
        </tr>
        <tr>
            <td>4</td>
            <td>Item D</td>
            <td>Category 1</td>
            <td>$25</td>
        </tr>
        <tr>
            <td>5</td>
            <td>Item E</td>
            <td>Category 2</td>
            <td>$15</td>
        </tr>
        <tr>
            <td>6</td>
            <td>Item F</td>
            <td>Category 3</td>
            <td>$5</td>
        </tr>
        <tr>
            <td>7</td>
            <td>Item G</td>
            <td>Category 1</td>
            <td>$50</td>
        </tr>
        <tr>
            <td>8</td>
            <td>Item H</td>
            <td>Category 2</td>
            <td>$35</td>
        </tr>
        <tr>
            <td>9</td>
            <td>Item I</td>
            <td>Category 3</td>
            <td>$40</td>
        </tr>
        <tr>
            <td>10</td>
            <td>Item J</td>
            <td>Category 1</td>
            <td>$60</td>
        </tr>
        <!-- More rows can be added here as needed -->
    </tbody>
</table>

<!-- Pagination Controls -->
<div class="pagination-container" id="paginationControls">
    <!-- Page numbers will be dynamically added here -->
</div>

<script>
    let sortDirection = [true, true, true, true];  // Tracks sorting order for each column
    let currentPage = 1;
    let recordsPerPage = 5;
    let totalPages = 0;

    // Sort function for the table
    function sortTable(colIndex) {
        const table = document.getElementById("dataTable");
        const rows = Array.from(table.rows).slice(1); // Skip the header row
        const isAscending = sortDirection[colIndex];
        sortDirection[colIndex] = !isAscending;  // Toggle sorting direction

        // Sort rows based on the selected column index
        rows.sort((rowA, rowB) => {
            const cellA = rowA.cells[colIndex].innerText.trim();
            const cellB = rowB.cells[colIndex].innerText.trim();

            let comparison = 0;
            if (cellA < cellB) comparison = -1;
            if (cellA > cellB) comparison = 1;

            return isAscending ? comparison : -comparison;
        });

        // Rebuild the table with sorted rows
        rows.forEach(row => table.appendChild(row));

        // Update the sorting direction in headers
        const ths = table.querySelectorAll('th');
        ths.forEach((th, index) => {
            const icon = th.querySelector(".sort-icon");
            if (index === colIndex) {
                icon.classList.toggle("sort-asc", isAscending);
                icon.classList.toggle("sort-desc", !isAscending);
            } else {
                icon.classList.remove("sort-asc", "sort-desc");
            }
        });

        paginateTable();  // Recalculate pagination after sorting
    }

    // Search function
    function searchTable() {
        const filter = document.getElementById("searchInput").value.toLowerCase();
        const rows = document.getElementById("dataTable").getElementsByTagName("tr");

        Array.from(rows).forEach(row => {
            const cells = row.getElementsByTagName("td");
            let match = false;
            for (let i = 0; i < cells.length; i++) {
                if (cells[i].innerText.toLowerCase().includes(filter)) {
                    match = true;
                    break;
                }
            }
            row.style.display = match ? "" : "none";
        });

        paginateTable();  // Recalculate pagination after filtering
    }

    // Change number of records per page
    function changeRecordsPerPage() {
        recordsPerPage = parseInt(document.getElementById("recordsPerPage").value);
        currentPage = 1;  // Reset to page 1 when records per page change
        paginateTable();
    }

    // Paginate table rows
    function paginateTable() {
        const table = document.getElementById("dataTable");
        const rows = Array.from(table.rows).slice(1); // Skip the header row
        const filteredRows = Array.from(rows).filter(row => row.style.display !== "none");

        // Calculate the number of pages based on records per page
        totalPages = Math.ceil(filteredRows.length / recordsPerPage);

        // Calculate the rows to display based on the current page and records per page
        const startIndex = (currentPage - 1) * recordsPerPage;
        const endIndex = startIndex + recordsPerPage;

        // Hide all rows
        rows.forEach(row => row.style.display = "none");

        // Show the rows that belong to the current page
        for (let i = startIndex; i < endIndex && i < filteredRows.length; i++) {
            filteredRows[i].style.display = "";
        }

        updatePaginationControls();
    }

    // Update pagination controls (previous, page numbers, next)
    function updatePaginationControls() {
        const paginationControls = document.getElementById("paginationControls");
        paginationControls.innerHTML = "";  // Clear existing controls

        // Previous Button
        const prevButton = document.createElement("button");
        prevButton.innerText = "Previous";
        prevButton.disabled = currentPage === 1;
        prevButton.onclick = () => {
            if (currentPage > 1) {
                currentPage--;
                paginateTable();
            }
        };
        paginationControls.appendChild(prevButton);

        // Page Numbers
        for (let i = 1; i <= totalPages; i++) {
            const pageButton = document.createElement("button");
            pageButton.innerText = i;
            pageButton.disabled = i === currentPage;
            pageButton.onclick = () => {
                currentPage = i;
                paginateTable();
            };
            paginationControls.appendChild(pageButton);
        }

        // Next Button
        const nextButton = document.createElement("button");
        nextButton.innerText = "Next";
        nextButton.disabled = currentPage === totalPages;
        nextButton.onclick = () => {
            if (currentPage < totalPages) {
                currentPage++;
                paginateTable();
            }
        };
        paginationControls.appendChild(nextButton);
    }

    // Call paginateTable on page load
    window.onload = function() {
        paginateTable();
    };
</script>

</body>
</html>
