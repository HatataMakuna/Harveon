<%-- 
    Document   : StaffDetails
    Created on : Mar 17, 2022, 11:29:54 AM
    Author     : User
--%>

<%@page import="model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Staff staff = (Staff) session.getAttribute("staff");%>
<!DOCTYPE html>
<html lang="en">
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Details</title>
        <meta charset="utf-8">
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
                height: 100vh;
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
                padding-bottom: 2%;
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
                    <a href="#" class="nav-link">
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
            <h1>Staff Details</h1>
            <div style="margin:2%">
                <form name="staffDetails" id='staffDetails' action="../updateStaff" method="post">
                    <table>
                        <tr>
                            <td>Staff ID</td>
                            <td>:</td>
                            <td><input type="text" name="staffId" value="<%=staff.getStaffId()%> " readonly ></td>
                        </tr> 
                        <tr>
                            <td>Staff Name</td>
                            <td>:</td>
                            <td><input type="text" name="staffName" id="staffName" value="<%=staff.getStaffName()%>" required></td>
                        </tr> 
                        <tr>
                            <td>Staff IC</td>
                            <td>:</td>
                            <td><input type="text" name="staffIc" id="staffIc" value="<%=staff.getStaffIc()%>" required></td>
                        </tr> 
                        <tr>
                            <td>Staff Contact No.</td>
                            <td>:</td>
                            <td><input type="text" name="staffContact" id="staffContact" value="<%=staff.getStaffContactNo()%>" required></td>
                        </tr> 
                        <tr>
                            <td>Staff Gender</td>
                            <td>:</td>
                            <td><input type="text" name="staffGender" id="staffGender" value="<%=staff.getStaffGender()%>" required></td>
                        </tr> 
                    </table> 
                    <input type="submit" value=" Save ">
                    <input type="submit" formaction="../deleteStaff" value="  Delete  "/>
                </form>
            </div>
        </div>
    </body> 
</html>
