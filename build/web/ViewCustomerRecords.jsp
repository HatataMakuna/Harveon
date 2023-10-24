<%@page import="java.util.List"%>
<%@page import="model.Customer"%>
<%
  List<Customer> customerList = (List)session.getAttribute("customerList");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- bootstrap 4.0 css -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="themefisherFont/style.css">
        <title>View Customer Records</title>
        <style>
            .sidebar {
                height: 100%;
                width: 20%;
                position: fixed;
                top: 0;
                left: 0;
                background-color: #143649; 
            }
            .sidebar a{
                color: white;
            }
            li a:hover{
                color: black;
                background-color: white;
            }
            .main{
                margin-left: 20%;
                padding-bottom: 1%;
                padding-left: 2%;
                padding-right: 1%;
                padding-top: 2%;
                background-color: #EDEDEE;
            }
            table{
                width: 80%;
                padding-top: 2%;
                padding-left: 2%;
            }
            tr:nth-child(odd){
                background-color: #CCCCCC;
            }
            th,td{
                padding-top: 1%;
                padding-bottom: 1%;
                padding-left: 1%;
            }
        </style>
    </head>
    <body>
        <div class="sidebar w3-sidebar" >
            <img src="../Assignment'/logo.png" alt="HARVEN" width="40" height="32">
            <ul class="logo"> </ul>
            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a href="Staff.html" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#home"/></svg>
                        Home
                    </a>
                </li>
                <li class="nav-item">
                    <a href="GetStaffDetails" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                        Staff
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#table"/></svg>
                        Orders
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#grid"/></svg>
                        Products
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                        Customers
                    </a>
                </li>
            </ul>
        </div>
        <div>
            <nav class="TopNavigation" style="margin-left:20%">Content for  class "TopNavigation" Goes Here</nav>
        </div>
        <div class="main" style="padding-top:1%;">
        <h1>Customer Records</h1>
        <p><a href="index.html">Back to home page</a></p>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Full Name</th>
                    <th>Gender</th>
                    <th>IC</th>
                    <th>E-mail</th>
                    <th>Address</th>
                    <th>Phone</th>
                </tr>
            </thead>
            <% for (Customer cus: customerList){ %>
            <tbody>
                <tr>
                    <td><%= cus.getCustomerId() %></td>
                    <td><%= cus.getUsername() %></td>
                    <td><%= cus.getFullName() %></td>
                    <td><%= cus.getGender() %></td>
                    <td><%= cus.getIc() %></td>
                    <td><%= cus.getEmail() %></td>
                    <td><%= cus.getAddress() %></td>
                    <td><%= cus.getPhone() %></td>
                </tr>
            </tbody>
            <% } %>
        </table>
        <!--
        <br><br>        Sorting function
        <form method="post" action="SortCustomer">
            <label for="sort">Sort records by:</label>
            <select id="sort" name="sort">
                <option value="default">Default</option>
                <option value="username">Username</option>
                <option value="password">Password</option>
                <option value="name">Name</option>
                <option value="gender">Gender</option>
                <option value="ic">IC</option>
                <option value="phone">Phone</option>
                <option value="gmail">Gmail</option>
                <option value="address">Address</option>
            </select>
            <input type="submit" value="Go"/>
        </form>
        -->
        
        </div>
    </body>
</html>