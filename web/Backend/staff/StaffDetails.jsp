<%-- 
    Document   : StaffDetails
    Created on : Mar 17, 2022, 11:29:54 AM
    Author     : User
--%>

<%@page import="model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Staff staff = (Staff) session.getAttribute("staff");%>
<%String user = (String) session.getAttribute("user");%>
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
                position: sticky;
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
                padding-top: 20px;
            }
            button{
                padding:10px;
            }
            button:hover{
                background-color: #555555;
                color: white;
            }
            table{
                width: 80%;
                padding-top: 2%;
                padding-left: 2%;
            }
            .info tbody{
                border: 1px solid rgba(0,0,0,.125);
            }
            .info tr:nth-child(odd){
                background-color: #CCCCCC;
            }
            th,td{
                padding-top: 1%;
                padding-bottom: 1%;
                padding-left: 1%;
            }
            
            button{
                padding:10px;
            }
            button:hover{
                background-color: #555555;
                color: white;
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
            <img src="../../picture/harvenLogo.jfif" alt="HARVEN" width="100%" height="200px">
            
            <ul class="nav nav-pills flex-column" >
                <li class="nav-item">
                    <a href="../ViewOrderStatus.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#home"/></svg>
                        Order
                    </a>
                </li>
                <li class="nav-item">
                    <a href="../ViewSalesRecords.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                        Sale
                    </a>
                </li>
                <li class="nav-item">
                    <a href="../AllProduct_Backend.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#table"/></svg>
                        Product
                    </a>
                </li>
                <li class="nav-item">
                    <a href="../../AdminShowRatingComment" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#grid"/></svg>
                        Rating & Comment
                    </a>
                </li>
                <li class="nav-item">
                    <a href="../ViewCustomerRecords.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                        Customer
                    </a>
                </li>
                <li class="nav-item">
                    <a href="../../GetStaffDetails" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                        Staff
                    </a>
                </li>
                <li class="nav-item dropdown" style="padding-left: 20px;">
                    <a class="nav-link  dropdown-toggle" data-toggle="dropdown">  Report  
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" style="padding-left: 20px;">
                        <li><a class="dropdown-item" href="../SalesReport.jsp"> Sales Report </a></li>
                        <li><a class="dropdown-item" href="../ProductReport.jsp"> Product Report </a></li>
                        <li><a class="dropdown-item" href="../customerReport.jsp"> Customer Report </a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <div>
            <nav class="TopNavigation" style="margin-left:200px">
                <div class="searchfield">
                    <table>
                        <tr>
                            <td><p style="padding-left: 1135px;padding-top: 15px;"><%=user%></p></td>
                            <td><img src="../../picture/people-outline.svg" alt="userIcon.png" style="margin-left: 20px; width: 30px ; height: 30px" ></td>
                        </tr>
                    </table>
                </div>
            </nav>
        </div>
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
                </form>
            </div>
        </div>
    </body> 
</html>
