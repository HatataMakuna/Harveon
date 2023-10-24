<%@page import="java.util.List"%>
<%@page import="model.OrderProduct"%>
<%
  List<OrderProduct> statusList = (List)session.getAttribute("statusList");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Order Status</title>
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
        <div class="main">
            <h1>Order Status</h1>
            <table border="1" style="text-align:center;">
                <tr>
                    <th>Order ID</th>
                    <th>Order Date</th>
                    <th>Status</th>
                    <th>Total Price</th>
                    <th>Payment ID</th>
                    <th>Username</th>
                </tr>
                <% for (OrderProduct orderStatus: statusList){ %>
                <tr>
                    <td><<a href="OSDetails?ID=<%= orderStatus.getOrderId() %>">test<%= orderStatus.getOrderId() %></a></td>
                    <td><%= orderStatus.getOrderDate() %></td>
                    <td><%= orderStatus.getStatus() %></td>
                    <td><%= orderStatus.getTotalPrice() %></td>
                    <td><%= orderStatus.getPaymentId() %></td>
                    <td><%= orderStatus.getUsername() %></td>
                </tr>
                <% } %>
                </table>
            <br><br>
            <p><a href="index.html">Back to home page</a></p>
        </div>
    </body>
</html>