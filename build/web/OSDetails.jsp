<%@page import="model.OrderProduct"%>
<%
  OrderProduct orderStatus = (OrderProduct) session.getAttribute("statusList");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <title>Order Status Details</title>
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
        <script>
            // edit button
            function updateStatus() {
                document.getElementById("id").disabled = false;
                document.getElementById("id").readOnly = true;
                document.getElementById("odid").disabled = false;
                document.getElementById("odid").readOnly = true;
                document.getElementById("price").disabled = false;
                document.getElementById("price").readOnly = true;
                document.getElementById("paymentid").disabled = false;
                document.getElementById("paymentid").readOnly = true;
                document.getElementById("username").disabled = false;
                document.getElementById("username").readOnly = true;
                document.getElementById("packaging").disabled = false;
                document.getElementById("shipping").disabled = false;
                document.getElementById("delivered").disabled = false;
                document.getElementById("other").disabled = false;
                document.getElementById("viewButtons").style.display = "none";
                document.getElementById("editButtons").style.display = "block";
            }
            // cancel button while editing
            function cancelButton() {
                document.getElementById("id").disabled = true;
                document.getElementById("odid").disabled = true;
                document.getElementById("price").disabled = true;
                document.getElementById("paymentid").disabled = true;
                document.getElementById("username").disabled = true;
                document.getElementById("packaging").disabled = true;
                document.getElementById("shipping").disabled = true;
                document.getElementById("delivered").disabled = true;
                document.getElementById("other").disabled = true;
                document.getElementById("othertext").disabled = true;
                document.getElementById("viewButtons").style.display = "block";
                document.getElementById("editButtons").style.display = "none";
            }
            // enable and disable the "other" text box
            function EnableDisableTextBox() {
                var other = document.getElementById("other");
                var othertext = document.getElementById("othertext");
                othertext.disabled = other.checked ? false : true;
                if (!othertext.disabled) {
                    othertext.focus();
                }
            }
        </script>
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
            <h1>Update Order Status</h1>
            <form method="post" name="orderStatus" action="UpdateOrderStatus">
                <!--Buttons-->
                <div id="viewButtons">
                    <button type="button" role="button" onclick="updateStatus()">Edit</button>
                    <a href="ViewOrderStatus"><button type="button" role="button">Cancel</button></a><br/>
                </div>
                <div id="editButtons" style="display:none;">
                    <button type="submit">Save</button>
                    <button type="button" role="button" onclick="cancelButton()">Cancel</button>
                </div>
                <!--Form contents-->
                ID: <input type="text" id="id" name="id" value="<%= orderStatus.getOrderId()%>" disabled/><br/>
                Order Date: <input type="text" id="date" name="odid" value="<%= orderStatus.getOrderDate()%>" disabled/><br/>
                Total Price: <input type="text" id="price" name="price" value="<%= orderStatus.getTotalPrice()%>" disabled/><br/>
                Payment ID: <input type="text" id="paymentid" name="paymentid" value="<%= orderStatus.getPaymentId() %>" disabled/><br/>
                Username: <input type="text" id="username" name="username" value="<%= orderStatus.getUsername() %>" disabled/><br/><br/>
                Order Status:<br/>
                <input type="radio" onclick="EnableDisableTextBox()" id="packaging" name="status" value="Packaging" disabled
                       <% if (orderStatus.getStatus().equals("Packaging")) { %>
                       checked
                       <%}%>/> Packaging<br/>
                <input type="radio" onclick="EnableDisableTextBox()" id="shipping" name="status" value="Shipping" disabled
                       <% if (orderStatus.getStatus().equals("Shipping")) { %>
                       checked
                       <%}%>/> Shipping<br/>
                <input type="radio" onclick="EnableDisableTextBox()" id="delivered" name="status" value="Delivered" disabled
                       <% if (orderStatus.getStatus().equals("Delivered")) { %>
                       checked
                       <%}%>/> Delivered<br/>
                <input type="radio" onclick="EnableDisableTextBox()" id="other" name="other" value="Other" disabled
                       <% if (!orderStatus.getStatus().equals("Packaging") || !orderStatus.getStatus().equals("Shipping") || !orderStatus.getStatus().equals("Delivered")) { %>
                       checked
                       <%}%>/> Other <input type="text" maxlength="20" id="othertext" name="othertext" disabled
                       <% if (!orderStatus.getStatus().equals("Packaging") || !orderStatus.getStatus().equals("Shipping") || !orderStatus.getStatus().equals("Delivered")) {%>
                       value="<% orderStatus.getStatus(); %>"
                       <%}%>/>
            </form>
        </div>
    </body>
</html>