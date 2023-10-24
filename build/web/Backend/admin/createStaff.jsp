<%-- 
    Document   : createStaff
    Created on : Mar 26, 2022, 12:31:16 PM
    Author     : User
--%>

<%@page import="model.Staff, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="staffDetails" scope="session" class="model.Staff"/>
<jsp:include page="/GetAllStaffDetails"/>
<% List<Staff> staffList = (List<Staff>) session.getAttribute("staffList");%>
<%String user = (String) session.getAttribute("user");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Staff</title>
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
        <script>
            function verification() {
                var id = document.getElementById("staffId").value;
                var name = document.getElementById("staffName").value;
                var ic = document.getElementById("staffIc").value;
                var contact = document.getElementById("staffContact").value;
                var gender1 = document.getElementById("staffGenderM").checked;
                var gender2 = document.getElementById("staffGenderF").checked;

                if (name === '') {
                    document.getElementById("name").innerHTML = "*Staff name cannnot be empty!!!";
                } else {
                    document.getElementById("name").innerHTML = "";
                    name = true;
                }
                if (ic === '') {
                    document.getElementById("ic").innerHTML = "*Staff ic cannnot be empty!!!";
                } else {
                    document.getElementById("ic").innerHTML = "";
                    ic = true;
                }
                if (contact === '') {
                    document.getElementById("c").innerHTML = "*Staff contact cannnot be empty!!!";
                } else {
                    document.getElementById("c").innerHTML = "";
                    contact = true;
                }
                var gender = null;
                if (gender1 === false && gender2 === false) {
                    document.getElementById("g").innerHTML = "*Staff gender cannnot be empty!!!";
                } else {
                    document.getElementById("g").innerHTML = "";
                    if (gender1 === true) {
                        gender = 'F';
                    } else {
                        gender = 'M';
                    }
                }

                //if (id === true && name === true && ic === true && contact === true && gender === true) {
                if (name === true && ic === true && contact === true && gender != null) {
                    document.forms["createStaff"].submit();
                }
            }
        </script>
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
                            <td><p style="padding-left: 1135px;padding-top: 15px;"><%=user%></p></td>
                            <td><img src="../../picture/people-outline.svg" alt="userIcon.png" style="margin-left: 20px; width: 30px ; height: 30px" ></td>
                        </tr>
                    </table>
                </div>
            </nav>
        </div>

        <div class="main">
            <h1>New Staff</h1>
            <div style="margin:2%">
                <form name="createStaff" action="../../addStaff" method="post">
                    <%
                        int index;
                        //get the last staff id
                        if (staffList.size() != 0) {
                            String lastStaffID = staffList.get((staffList.size()) - 1).getStaffId();
                            //get the last payment id index
                            index = Integer.parseInt(lastStaffID.substring(2, 5));
                        } else {
                            index = 0;
                        }
                        //assign payment id
                        String id;
                        if (index < 10) {
                            id = "S000" + String.valueOf(index + 1);
                        } else if (index < 100) {
                            id = "S00" + String.valueOf(index + 1);
                        } else if (index < 1000) {
                            id = "S0" + String.valueOf(index + 1);
                        } else {
                            id = "S" + String.valueOf(index + 1);
                        }

                    %>
                    <table>
                        <tr>
                            <td>Staff ID</td>
                            <td>:</td>
                            <td><input type="text" name="staffId"id="staffId" value="<%=id%>" readonly></td>
                        </tr> 
                        <tr>
                            <td>Staff Name</td>
                            <td>:</td>
                            <td><input type="text" name="staffName" id="staffName"></td>
                            <td>&nbsp;</td>
                            <td><span id="name" style="color:red"></span></td>
                        </tr> 
                        <tr>
                            <td>Staff IC</td>
                            <td>:</td>
                            <td><input type="text" name="staffIc" id="staffIc"></td>
                            <td>&nbsp;</td>
                            <td><span id="ic" style="color:red"></span></td>
                        </tr> 
                        <tr>
                            <td>Staff Contact No.</td>
                            <td>:</td>
                            <td><input type="text" name="staffContact" id="staffContact"></td>
                            <td>&nbsp;</td>
                            <td><span id="c" style="color:red"></span></td>
                        </tr> 
                        <tr>
                            <td>Staff Gender</td>
                            <td>:</td>
                            <td><input type="radio" name="staffGender" id="staffGenderM" value="M">M
                                <input type="radio" name="staffGender" id="staffGenderF" value="F">F</td>
                            <td>&nbsp;</td>
                            <td><span id="g" style="color:red"></span></td>
                        </tr>   
                    </table>
                    <button onclick="verification()" > Create </button>
                </form>
            </div>
        </div>
    </body>
</html>
