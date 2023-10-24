<%-- 
    Document   : index
    Created on : Apr 1, 2022, 7:07:32 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Staff, java.util.*"%>
<jsp:include page="/GetAllStaffDetails"/>
<% List<Staff> staffList = (List<Staff>) session.getAttribute("staffList");%>
<!DOCTYPE html>
<html>
    <head><meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
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
        <title>Staff Maintanance</title>

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
            <h1>Staff Maintanance</h1>
            <div style="padding-top:1%;">
                <h1>index</h1>
            </div>
        </div>
    </body>
</html>

