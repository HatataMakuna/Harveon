<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="model.OrderDetails"%>
<jsp:include page="../ViewSalesRecords"/>
<%
    List<OrderDetails> salesList = (List<OrderDetails>) session.getAttribute("salesList");
%>
<%String user = (String) session.getAttribute("user");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="../themefisherFont/style.css">
        <title>View Sales Records</title>

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
                color: white !important;
            }

            li a:hover{
                color: black !important;
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
                padding-top: 110px;

            }
            button{
                padding:10px;
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
            .info tr:nth-child(odd){
                background-color: #CCCCCC;
            }
            .info tbody{
                border: 1px solid rgba(0,0,0,.125);
            }
            .info th,.info td{
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
        </style>
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
                            <td>
                                <form action="../SearchBy_saleslist" method="POST">
                                    <select id="fieldselected" name="fieldselected">
                                        <option value="productname">Product Name</option>
                                        <option value="orderid">Order ID</option>
                                        <option value="quantity">Quantity</option>
                                    </select>
                                    <input type="text" id="details" name="details">   
                                    <input id="submitS" name="submit" type="submit" value="Search">
                                </form>
                            </td>
                            <td><input id="submitS" name="submit" type="submit" value="Reload" onclick= "remain()"></td>
                            <td><p style="padding-left: 600px;padding-top: 15px;"><%=user%></p></td>
                            <td><img src="../picture/people-outline.svg" alt="userIcon.png" style="margin-left: 20px; width: 30px ; height: 30px" ></td>
                        </tr>
                    </table>
                </div>
            </nav>
        </div>
        <div class="main">
            <h1>Sales Records</h1>
            <br/>
            <div style="margin:2%;">
                <%if (salesList.size() == 0) {%>
                <div style="text-align:center;">**No sales details in Database !!</div>
                <% } else {%>
                <table class="info table-responsive" cellspacing="1" cellpudding="1">
                    <tr style = "background-color: #BCBCBC;">
                        <th style= "width : 15%" >Product Name</th>
                        <th  style = "width: 15%">Order ID</th>
                        <th  style = "width: 15%">Quantity </th>
                        <th  style = "width: 15%">Date</th>
                        <th  style = "width: 15%">Price</th>
                    </tr>

                    <% for (OrderDetails orderDetails : salesList) {
                            LocalDate date = orderDetails.getOrderProduct().getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                    %>

                    <tr>
                        <td><%= orderDetails.getProduct().getProdName()%></td>
                        <td><%=orderDetails.getOrderProduct().getOrderId()%></td>
                        <td><%= orderDetails.getQuantity()%></td>
                        <td><%= date%></td>
                        <td><%= orderDetails.getProduct().getPrice()%></td>
                    </tr>

                    <% }%>

                </table>
            </div>
        </div>
        <% }%>
        <p><a href="index.html">Back to home page</a></p>
    </body>
    <script>
        function remain() {
            location.href = "ViewSalesRecords.jsp";
        }
    </script>
</html>
