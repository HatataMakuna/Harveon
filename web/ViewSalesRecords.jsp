<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="model.OrderDetails"%>
<%
  List <OrderDetails> salesList = (List<OrderDetails>) session.getAttribute("salesList");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Sales Records</title>
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
        <h1>Sales Records</h1>
        <table border="1" style="padding-bottom: 100px;">
            <caption style="text-align: left;">Product Code:P100</caption>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Order ID</th>
                    <th>Quantity </th>
                    <th>Date</th>
                    <th>Price</th>
                </tr>
            </thead>
            <% for (OrderDetails orderDetails : salesList){ 
                if(orderDetails.getProduct().getProdId().equals("P100")){
               LocalDate date = orderDetails.getOrderProduct().getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            %>
            <tbody>
                <tr>
                    <td><%= orderDetails.getProduct().getProdName()  %></td>
                    <td><%=orderDetails.getOrderProduct().getOrderId() %></td>
                    <td><%= orderDetails.getQuantity() %></td>
                    <td><%= date %></td>
                    <td><%= orderDetails.getProduct().getPrice()  %></td>
                </tr>
            </tbody>
            <% }} %>
            
        </table>
        
            
          
         <table border="1" style="padding-bottom: 100px;">
            <caption style="text-align: left;">Product Code:P101</caption>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Order ID</th>
                    <th>Quantity </th>
                    <th>Date</th>
                    <th>Price</th>
                </tr>
            </thead>
            <% for (OrderDetails orderDetails : salesList){ 
                if(orderDetails.getProduct().getProdId().equals("P101")){
               LocalDate date = orderDetails.getOrderProduct().getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            %>
            <tbody>
                <tr>
                    <td><%= orderDetails.getProduct().getProdName()  %></td>
                    <td><%=orderDetails.getOrderProduct().getOrderId() %></td>
                    <td><%= orderDetails.getQuantity() %></td>
                    <td><%= date %></td>
                    <td><%= orderDetails.getProduct().getPrice()  %></td>
                </tr>
            </tbody>
            <% }} %><br><br>
        </table>
     
         <table border="1" style="padding-bottom: 100px;">
            <caption style="text-align: left;">Product Code:P102</caption>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Order ID</th>
                    <th>Quantity </th>
                    <th>Date</th>
                    <th>Price</th>
                </tr>
            </thead>
            <% for (OrderDetails orderDetails : salesList){ 
                if(orderDetails.getProduct().getProdId().equals("P102")){
               LocalDate date = orderDetails.getOrderProduct().getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            %>
            <tbody>
                <tr>
                    <td><%= orderDetails.getProduct().getProdName()  %></td>
                    <td><%=orderDetails.getOrderProduct().getOrderId() %></td>
                    <td><%= orderDetails.getQuantity() %></td>
                    <td><%= date %></td>
                    <td><%= orderDetails.getProduct().getPrice()  %></td>
                </tr>
            </tbody>
            <% }} %><br><br>
        </table>
        
         <table border="1" style="padding-bottom: 100px;">
            <caption style="text-align: left;">Product Code:P103</caption>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Order ID</th>
                    <th>Quantity </th>
                    <th>Date</th>
                    <th>Price</th>
                </tr>
            </thead>
            <% for (OrderDetails orderDetails : salesList){ 
                if(orderDetails.getProduct().getProdId().equals("P103")){
               LocalDate date = orderDetails.getOrderProduct().getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            %>
            <tbody>
                <tr>
                    <td><%= orderDetails.getProduct().getProdName()  %></td>
                    <td><%=orderDetails.getOrderProduct().getOrderId() %></td>
                    <td><%= orderDetails.getQuantity() %></td>
                    <td><%= date %></td>
                    <td><%= orderDetails.getProduct().getPrice()  %></td>
                </tr>
            </tbody>
            <% }} %><br><br>
        </table>
        
         <table border="1" style="padding-bottom: 100px;">
            <caption style="text-align: left;">Product Code:P104</caption>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Order ID</th>
                    <th>Quantity </th>
                    <th>Date</th>
                    <th>Price</th>
                </tr>
            </thead>
            <% for (OrderDetails orderDetails : salesList){ 
                if(orderDetails.getProduct().getProdId().equals("P104")){
               LocalDate date = orderDetails.getOrderProduct().getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            %>
            <tbody>
                <tr>
                    <td><%= orderDetails.getProduct().getProdName()  %></td>
                    <td><%=orderDetails.getOrderProduct().getOrderId() %></td>
                    <td><%= orderDetails.getQuantity() %></td>
                    <td><%= date %></td>
                    <td><%= orderDetails.getProduct().getPrice()  %></td>
                </tr>
            </tbody>
            <% }} %><br><br>
        </table>
        </div>
    </body>
</html>
