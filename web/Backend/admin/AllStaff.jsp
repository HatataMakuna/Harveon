<%-- 
    Document   : staff
    Created on : Mar 14, 2022, 8:45:57 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Staff, java.util.*"%>
<jsp:include page="/GetAllStaffDetails"/>
<%String user = (String) session.getAttribute("user");%>
<% List<Staff> staffList = (List<Staff>) session.getAttribute("staffList");%>
<!DOCTYPE html>
<html>
    <head><meta charset="utf-8">
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
        <title>Staff Maintanance</title>

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
            <nav class="TopNavigation" style="margin-left:200px">
                <div class="searchfield">
                    <table>
                        <tr>
                            <td>
                                <form action="../../SearchBy_stafflist" method="POST">
                                    <select id="fieldselected" name="fieldselected">
                                        <option value="staff_id">Staff ID</option>
                                        <option value="staff_name">Staff Name</option>
                                        <option value="staff_ic">Staff IC</option>
                                        <option value="staff_contact_no">Staff Contact Number</option>
                                        <option value="staff_gender">Staff Gender</option>
                                    </select>
                                    <input type="text" id="details" name="details">
                                    <input id="submitS" name="submit" type="submit" value="Search">
                                </form>
                            </td>
                            <td><input id="submitS" name="submit" type="submit" value="Reload" onclick= "remain()"></td>
                            <td><p style="padding-left: 600px;padding-top: 15px;"><%=user%></p></td>
                            <td><img src="../../picture/people-outline.svg" alt="userIcon.png" style="margin-left: 20px; width: 30px ; height: 30px" ></td>
                        </tr>
                    </table>
                </div>
            </nav>
        </div>
        <div class="main">
            <h1>Staff Maintanance</h1>
            <br/>
            <button onclick="document.location = 'createStaff.jsp'"> Create New Staff </button><br/>
            <div style="margin:2%">
                <%if (staffList.size() == 0) {%>
                <div style="text-align:center;">**No staff details in Database !!</div>
                <% } else {%>
                <table class="info table-responsive" cellspacing="1" cellpudding="1">

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
                        <td><a href="../../GetStaffDetails?staffId=<%=staff.getStaffId()%> " ><%=staff.getStaffId()%></a></td>
                        <td><%=staff.getStaffName()%></td>
                        <td><%=staff.getStaffIc()%></td>
                        <td><%=staff.getStaffContactNo()%></td>
                        <td><%=staff.getStaffGender()%></td>
                        <td>
                            <form action="../../deleteStaff" >
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
<script>
    function remain() {
        location.href = "AllStaff.jsp";
    }
</script>
</html>
