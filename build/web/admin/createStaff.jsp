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
                    <a href="AllStaff.jsp" class="nav-link">
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
            <h1>New Staff</h1>
            <div style="margin:2%">
                <form name="createStaff" action="../addStaff" method="post">
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
