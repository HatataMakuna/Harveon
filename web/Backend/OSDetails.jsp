<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="model.OrderProduct"%>
<%String user = (String) session.getAttribute("user");%>
<%
  OrderProduct orderStatus = (OrderProduct) session.getAttribute("statusList");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../themefisherFont/style.css">
        <script src="../jquery/dist/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <style>
            .sidebar {
                height: 100%;
                width: 200px;
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
            .searchfield{
                position: fixed;
                background-color: #E0E0E0;
                box-sizing: border-box;
                width: 100%;
                padding: 10px 15px;
            }

            input[type=text], select {
                padding: 5px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                
            }

            #submitS {
                background-color: #003366;
                color: white;
                padding: 5px 10px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            #submitS:hover {
                background-color: #0066cc;
            }
            .main{
                margin-left: 200px;
                height: 100vh;
                padding-bottom: 10px;
                padding-left: 20px;
                padding-right: 10px;
                padding-top: 75px;

            }
            button{
                padding:8px;
            }
            button:hover{
                background-color: #555555;
                color: white;
            }
            table.main{
                width: 80%;
                padding-top: 2%;
                padding-left: 2%;
            }
            tr.main:nth-child(odd){
                background-color: #CCCCCC;
            }
            th.main,td.main{
                padding-top: 1%;
                padding-bottom: 1%;
                padding-left: 1%;
            }

            .dropdown:hover .dropdown-menu{
                display: block;
            }

            .dropdown-menu {
                margin: auto;
                color: white;
                background-color: #143649;
            }
            .dropdown-toggle {
                margin: auto;
            }
            .navbar .dropdown-toggle,
            .nav-tabs .dropdown-toggle {
                margin: auto;
            }
            
            .grid-container{
                display:grid;
                grid-template-columns: 1fr 2fr;
                grid-row-gap:10px;
                padding:3% 2%;
            }
            .card{
                width:40%;
             }
        </style>
        <script>
            // edit button
            function updateStatus() {
                document.getElementById("id").disabled = false;
                document.getElementById("id").readOnly = true;
                document.getElementById("odid").disabled = false;
                document.getElementById("odid").readOnly = true;
                document.getElementById("packaging").disabled = false;
                document.getElementById("shipping").disabled = false;
                document.getElementById("delivered").disabled = false;
                document.getElementById("viewButtons").style.display = "none";
                document.getElementById("editButtons").style.display = "flex";
            }
            // cancel button while editing
            function cancelButton() {
                document.getElementById("packaging").disabled = true;
                document.getElementById("shipping").disabled = true;
                document.getElementById("delivered").disabled = true;
                document.getElementById("viewButtons").style.display = "flex";
                document.getElementById("editButtons").style.display = "none";
            }
        </script>
    </head>
    <body style="background-color: #EDEDEE">
        <div class="sidebar w3-sidebar" >
            <img src="../picture/harvenLogo.jfif" alt="HARVEN" width="100%" height="200px">
            
            <ul class="nav nav-pills flex-column" >
                <li class="nav-item">
                    <a href="ViewOrderStatus.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#home"/></svg>
                        Order
                    </a>
                </li>
                <li class="nav-item">
                    <a href="ViewSalesRecords.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                        Sale
                    </a>
                </li>
                <li class="nav-item">
                    <a href="AllProduct_Backend.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#table"/></svg>
                        Product
                    </a>
                </li>
                <li class="nav-item">
                    <a href="../AdminShowRatingComment" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#grid"/></svg>
                        Rating & Comment
                    </a>
                </li>
                <li class="nav-item">
                    <a href="ViewCustomerRecords.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                        Customer
                    </a>
                </li>
                <li class="nav-item">
                    <a href="../GetStaffDetails" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                        Staff
                    </a>
                </li>
                <li class="nav-item dropdown" style="padding-left: 20px;">
                    <a class="nav-link  dropdown-toggle" data-toggle="dropdown">  Report  
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" style="padding-left: 20px;">
                        <li><a class="dropdown-item" href="SalesReport.jsp"> Sales Report </a></li>
                        <li><a class="dropdown-item" href="ProductReport.jsp"> Product Report </a></li>
                        <li><a class="dropdown-item" href="customerReport.jsp"> Customer Report </a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <nav class="TopNavigation" style="margin-left:200px">
                <div class="searchfield">
                    <table>
                        <tr>
                            <td><p style="padding-left: 1135px;padding-top: 15px;"><%=user%></p></td>
                            <td><img src="../picture/people-outline.svg" alt="userIcon.png" style="margin-left: 20px; width: 30px ; height: 30px" ></td>
                        </tr>
                    </table>
                </div>
            </nav>
        </div>

        <div class="main">
            <h1>Update Order Status</h1>
            <form method="post" name="orderStatus" action="../UpdateOrderStatus">
                
                <%
                LocalDate current = orderStatus.getOrderDate().toInstant()
                           .atZone(ZoneId.systemDefault()) // Specify the correct timezone
                           .toLocalDate();%>

                <div class="card">
                    <div class="grid-container card-body">
                        <div class="grid-item">ID:</div><div class="grid-item"><input type="text" id="id" name="id" value="<%= orderStatus.getOrderId()%>" disabled/></div>
                        <div class="grid-item">Order Date:</div><div class="grid-item"><input type="text" id="odid" name="odid" value="<%= current%>" disabled/></div>
                        <div class="grid-item">Total Price:</div><div class="grid-item"><input type="text" id="price" name="price" value="<%= orderStatus.getTotalPrice()%>" disabled/><br/></div>
                        <div class="grid-item">Payment ID:</div><div class="grid-item"><input type="text" id="paymentid" name="paymentid" value="<%= orderStatus.getPaymentId().getPaymentId() %>" disabled/></div>
                        <div class="grid-item">Username:</div><div class="grid-item"><input type="text" id="username" name="username" value="<%= orderStatus.getUsername().getUsername() %>" disabled/></div>
                        <div class="grid-item">Order Status:</div>
                        <div class="grid-item">
                            <input type="radio" id="packaging" name="status" value="Packaging" disabled
                           <% if (orderStatus.getStatus().equals("Packaging")) { %>
                           checked
                           <%}%>/> Packaging<br/>
                            <input type="radio" id="shipping" name="status" value="Shipping" disabled
                                   <% if (orderStatus.getStatus().equals("Shipping")) { %>
                                   checked
                                   <%}%>/> Shipping<br/>
                            <input type="radio" id="delivered" name="status" value="Delivered" disabled
                           <% if (orderStatus.getStatus().equals("Delivered")) { %>
                           checked
                           <%}%>/> Delivered
                        </div>
                    </div>
                        <div class="card-footer" >
                            <div id="viewButtons" style="display:flex;">
                                <button style="width:20%;margin-right: 60%;" type="button" role="button" onclick="updateStatus()">Edit</button>
                                <a style="width:20%" href="ViewOrderStatus.jsp"><button style="width:100%;" type="button" role="button">Cancel</button></a><br/>
                            </div>
                            <div id="editButtons" style="display:none;">
                                <button style="width:20%;margin-right: 60%;" type="submit">Save</button>
                                <button style="width:20%" type="button" role="button" onclick="cancelButton()">Cancel</button>
                            </div>
                        </div>
                </div>
             
                
                
            </form>
             
        </div>
    </body>
</html>