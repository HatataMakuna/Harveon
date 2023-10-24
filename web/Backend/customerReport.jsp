<%-- 
    Document   : zz_customerReport
    Created on : Apr 5, 2022, 9:22:01 PM
    Author     : User
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String user = (String) session.getAttribute("user");%>
<jsp:include page="../GetAllData"/>
<%List<Customer> customerList = (List<Customer>) session.getAttribute("customerList");%>
<%List<OrderProduct> orderProductList = (List<OrderProduct>) session.getAttribute("orderProductList");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
            <h1>Customer Report</h1>
           <%
                DecimalFormat df = new DecimalFormat("0.00");
                double[] custPurchased = new double[customerList.size()];
                double[] custSort = new double[customerList.size()];
                int[] topCust = new int[customerList.size()];

                for (int i = 0; i < customerList.size(); i++) {
                    double count = 0;
                    for (int index = 0; index < orderProductList.size(); index++) {
                        if (orderProductList.get(index).getUsername().getUsername() == customerList.get(i).getUsername()) {
                            count = count + orderProductList.get(index).getTotalPrice();
                        }
                    }
                    custPurchased[i] = Double.parseDouble(df.format(count));
                    custSort[i] = Double.parseDouble(df.format(count));
                }
                for (int i = 0; i < customerList.size(); i++) {
                    double tmp = 0;
                    //Next greater than previous
                    for (int index = i + 1; index < customerList.size(); index++) {
                        if (custSort[index] > custSort[i]) {
                            tmp = custSort[i];
                            custSort[i] = custSort[index];
                            custSort[index] = tmp;
                        }
                    }
                }
                int num = 0;
                for (int i = 0; i < customerList.size(); i++) {
                    if (custSort[i] == 0) {
                        num = i;
                        break;
                    }
                }
                for (int i = 0; i < num; i++) {
                    for (int index = 0; index < customerList.size(); index++) {
                        if (custPurchased[index] == custSort[i]) {
                            if (i > 0 && custSort[i - 1] == custPurchased[index]) {
                                topCust[i] = index;
                                break;
                            } else {
                                topCust[i] = index;
                            }
                        }
                    }
                }
                boolean tf = true;
                int in = num;
                for (int index = 0; index < customerList.size(); index++) {
                    for (int loop = in; loop > customerList.size(); loop--) {
                        if (index == topCust[loop - 1]) {
                            tf = false;
                            break;
                        }
                    }
                    if (tf = true) {
                        if (custPurchased[index] == 0) {
                            topCust[in] = index;
                            in++;
                        }
                    }
                }

            %>

            <script>
                google.charts.load('current', {'packages': ['corechart']});
                google.charts.setOnLoadCallback(salesChart);

                function salesChart() {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Customer');
                    data.addColumn('number', 'RM');
                    data.addRows([
                        ['<%=customerList.get(topCust[0]).getUsername()%>', <%=custPurchased[topCust[0]]%>],
                        ['<%=customerList.get(topCust[1]).getUsername()%>', <%=custPurchased[topCust[1]]%>],
                        ['<%=customerList.get(topCust[2]).getUsername()%>', <%=custPurchased[topCust[2]]%>],
                        ['<%=customerList.get(topCust[3]).getUsername()%>', <%=custPurchased[topCust[3]]%>],
                        ['<%=customerList.get(topCust[4]).getUsername()%>', <%=custPurchased[topCust[4]]%>]
                    ]);

                    var options = {
                        title: 'BarChart :     Top 5 Customer Purchased'
                    };

                    var chart = new google.visualization.BarChart(document.getElementById('chart'));
                    chart.draw(data, options);
                }
            </script>
            <div>Report generate by:  <%= (new java.util.Date()).toLocaleString()%></div>
            <br/>
            <div id="chart" style="width:80%; min-width:400px; height:250px;"></div>
            <br/>
            <table class="info">
                <tr>
                    <th>Top </th>
                    <th>Username</th>
                    <th>Name </th>
                    <th>Contact Number </th>
                    <th>Gmail </th>
                    <th>Total Purchased </th>
                </tr>

                <%for (int i = 0; i < customerList.size(); i++) {%>
                <tr>
                    <td><%=i + 1%></td>
                    <td><%=customerList.get(topCust[i]).getUsername()%></td>
                    <td><%=customerList.get(topCust[i]).getName()%></td>
                    <td><%=customerList.get(topCust[i]).getPhone()%></td>
                    <td><%=customerList.get(topCust[i]).getGmail()%></td>
                    <td><%=custPurchased[topCust[i]]%></td>
                </tr>
                <% }%>
            </table>
        </div>
    </body>
</html>
