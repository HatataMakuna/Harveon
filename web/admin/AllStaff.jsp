<%-- 
    Document   : staff
    Created on : Mar 14, 2022, 8:45:57 PM
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
                height: 100vh;
                padding-bottom: 1%;
                padding-left: 2%;
                padding-right: 1%;
                padding-top: 2%;
                background-color: #EDEDEE;
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
                    <a href="staff.jsp" class="nav-link">
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
            <br/>
            <button onclick="document.location = 'createStaff.jsp'"> Create New Staff </button><br/>
            <div style="margin:2%">
                <%if (staffList.size() == 0) {%>
                <div style="text-align:center;">**No staff details in Database !!</div>
                <% } else {%>
                <table cellspacing="1" cellpudding="1">

                    <tr  style = "background-color: #BCBCBC;">
                        <th width = "10%" > ID </th> 
                        <th style = "width: 30%" > Name </th> 
                        <th style = "width: 20%" > IC </th>
                        <th style = "width: 15%" > Contact No</th> 
                        <th style = "width: 8%" > Gender </th>
                        <th style = "width: 10%" >    </th>
                    </tr>

                    <%
                        for (int i = 0; i < staffList.size(); ++i) {
                            Staff staff = staffList.get(i);%>
                    <tr>
                        <td><a href="../GetStaffDetails?staffId=<%=staff.getStaffId()%> " ><%=staff.getStaffId()%></a></td>
                        <td><%=staff.getStaffName()%></td>
                        <td><%=staff.getStaffIc()%></td>
                        <td><%=staff.getStaffContactNo()%></td>
                        <td><%=staff.getStaffGender()%></td>
                        <td>
                            <form action="../deleteStaff" >
                                <input type="hidden" name="staffId" value="<%=staff.getStaffId()%>">
                                <input type="submit"  value="Delete">
                            </form>
                        </td>
                    </tr>

                    <%}
                        }%>

                </table>
            </div>
        </div>
    </div>
</body>
</html>
