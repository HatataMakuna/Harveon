<%-- 
    Document   : index
    Created on : Apr 1, 2022, 7:07:32 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Staff, java.util.*"%>
<jsp:include page="/GetAllStaffDetails"/>
<% List<Staff> staffList = (List<Staff>) session.getAttribute("staffList");%>
<%String userId = request.getUserPrincipal().getName();
            session.setAttribute("user", userId);%>
<!DOCTYPE html>
<html>
    <head><meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        </style>
        <title>Products</title>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".dropdown, .btn-group").hover(function () {
                    var dropdownMenu =
                            $(this).children(".dropdown-menu");
                    if (dropdownMenu.is(":visible")) {
                        dropdownMenu.parent().toggleClass("open");
                    }
                });
            });
        </script>
    </head> 
    <body style="background-color: #EDEDEE">
        <div class="sidebar w3-sidebar" >
            <img src="picture/harvenLogo.jfif" alt="HARVEN" width="100%" height="200px">
            
            <ul class="nav nav-pills flex-column" >
                <li class="nav-item">
                    <a href="Backend/ViewOrderStatus.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#home"/></svg>
                        Order
                    </a>
                </li>
                <li class="nav-item">
                    <a href="Backend/ViewSalesRecords.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                        Sale
                    </a>
                </li>
                <li class="nav-item">
                    <a href="Backend/AllProduct_Backend.jsp" class="nav-link">
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
                    <a href="Backend/ViewCustomerRecords.jsp" class="nav-link">
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
    </body>
</html>
