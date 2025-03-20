<%@page import="com.vdantsrpring.vdantsrpring.entity.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

    <h2>Product List</h2>

    <!-- Form for selecting products to delete or edit -->
    <form action="/deleteSelected" method="post">
        <table>
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col"><i class="fa fa-inr"></i> Price</th>
                    <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterate over products list passed from controller -->
                <%
                    List<Product> products = (List<Product>) request.getAttribute("products");
                    for (Product product : products) {
                %>
                    <tr>
                        <td><input type="checkbox" name="selectedProductIds" value="<%= product.getId() %>"></td>
                        <td><%= product.getId() %></td>
                        <td><%= product.getName() %></td>
                        <td><%= product.getAnswer() %></td>
                        <td><i class="fa fa-inr"></i> <%= product.getEmail() %></td>
                        <td>
                            <a href="/addToCart?id=<%= product.getId() %>">Add to cart <i class='fas fa-cart-plus'></i></a>
                        </td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <!-- Buttons for submitting actions -->
        <input type="submit" value="Delete Selected" name="action">
        <input type="submit" value="Edit Selected" name="action">
    </form>

    <!-- Links for other actions -->
    <a href="/addEmp">Add Employee</a><br>
    <a href="/editEmp">Edit Employee</a><br>

</body>
</html>
