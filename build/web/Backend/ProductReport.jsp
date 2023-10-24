<%-- 
    Document   : zz_productReport
    Created on : Apr 4, 2022, 11:44:14 AM
    Author     : User
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.*"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.PersistenceContext"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../GetAllData"/>
<%String user = (String) session.getAttribute("user");%>
<%List<Product> productList = (List<Product>) session.getAttribute("productList");%>
<%List<OrderDetails> orderDetailsList = (List<OrderDetails>) session.getAttribute("orderDetailsList");%>
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
            <h1>Product Report</h1>
            <%
                DecimalFormat df = new DecimalFormat("0.00");
                int[] productSales = new int[productList.size()];
                double[] productRevenue = new double[productList.size()];
                int[] salesSort = new int[productList.size()];
                double[] revenueSort = new double[productList.size()];
                int[] topSales = new int[productList.size()];
                int[] topQuantity = new int[productList.size()];

                for (int i = 0; i < productList.size(); i++) {
                    int count = 0;
                    for (int index = 0; index < orderDetailsList.size(); index++) {
                        if (orderDetailsList.get(index).getOrderDetailsPK().getProductId().equals(productList.get(i).getProdId())) {
                            count = count + orderDetailsList.get(index).getQuantity();
                        }
                    }
                    productSales[i] = count;
                    salesSort[i] = count;
                    double total = Double.valueOf(count) * productList.get(i).getPrice().doubleValue();
                    productRevenue[i] = Double.parseDouble(df.format(total));
                    revenueSort[i] = Double.parseDouble(df.format(total));
                }
                for (int i = 0; i < productList.size(); i++) {
                    double tmp = 0;
                    //Next greater than previous
                    for (int index = i + 0; index < productList.size(); index++) {
                        if (revenueSort[index] > revenueSort[i]) {
                            tmp = revenueSort[i];
                            revenueSort[i] = revenueSort[index];
                            revenueSort[index] = tmp;
                        }
                    }
                }
                int num = 0;
                for (int i = 0; i < productList.size(); i++) {
                    if (revenueSort[i] == 0) {
                        num = i;
                        break;
                    }
                }
                for (int i = 0; i < num; i++) {
                    for (int index = 0; index < productList.size(); index++) {
                        if (productRevenue[index] == revenueSort[i]) {
                            if (i > 0 && revenueSort[i - 1] == productRevenue[index]) {
                                topSales[i] = index;
                                break;
                            } else {
                                topSales[i] = index;
                            }
                        }
                    }
                }
                boolean tf = true;
                int in = num;
                for (int index = 0; index < productList.size(); index++) {
                    for (int loop = in; loop > productList.size(); loop--) {
                        if (index == topSales[loop - 1]) {
                            tf = false;
                            break;
                        }
                    }
                    if (tf = true) {
                        if (productRevenue[index] == 0) {
                            topSales[in] = index;
                            in++;
                        }
                    }
                }
                for (int i = 0; i < productList.size(); i++) {
                    int tmp = 0;
                    //Next greater than previous
                    for (int index = i + 1; index < productList.size(); index++) {
                        if (salesSort[index] > salesSort[i]) {
                            tmp = salesSort[i];
                            salesSort[i] = salesSort[index];
                            salesSort[index] = tmp;
                        }
                    }
                }
                num = 0;
                for (int i = 0; i < productList.size(); i++) {
                    if (salesSort[i] == 0) {
                        num = i;
                        break;
                    }
                }
                for (int i = 0; i < num; i++) {
                    for (int index = 0; index < productList.size(); index++) {
                        if (productSales[index] == salesSort[i]) {
                            if (i > 0 && salesSort[i - 1] == productSales[index]) {
                                topQuantity[i] = index;
                                break;
                            } else {
                                topQuantity[i] = index;
                            }
                        }
                    }
                }
                tf = true;
                in = num;
                for (int index = 0; index < productList.size(); index++) {
                    for (int loop = in; loop > productList.size(); loop--) {
                        if (index == topQuantity[loop - 1]) {
                            tf = false;
                            break;
                        }
                    }
                    if (tf = true) {
                        if (productSales[index] == 0) {
                            topQuantity[in] = index;
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
                    data.addColumn('string', 'Product ID');
                    data.addColumn('number', 'RM');
                    data.addRows([
                        ['<%=productList.get(topSales[0]).getProdId()%>', <%=productRevenue[topSales[0]]%>],
                        ['<%=productList.get(topSales[1]).getProdId()%>', <%=productRevenue[topSales[1]]%>],
                        ['<%=productList.get(topSales[2]).getProdId()%>', <%=productRevenue[topSales[2]]%>],
                        ['<%=productList.get(topSales[3]).getProdId()%>', <%=productRevenue[topSales[3]]%>],
                        ['<%=productList.get(topSales[4]).getProdId()%>', <%=productRevenue[topSales[4]]%>]
                    ]);

                    var options = {
                        title: 'BarChart of :     Top 5 Sales of Product'
                    };

                    var chart = new google.visualization.BarChart(document.getElementById('salesChart'));
                    chart.draw(data, options);
                }
            </script>
            <div>Report generate by:  <%= (new java.util.Date()).toLocaleString()%></div>
            <br/>
            <p><b>Report Type 1:</b>  Product Sales</p>
            <div id="salesChart" style="width:80%; min-width:400px; height:250px;"></div>
            <br/>
            <table class="info">
                <tr>
                    <th>Top </th>
                    <th>Product Name </th>
                    <th>Product ID </th>
                    <th>Unit Price </th>
                    <th>Quantity </th>
                    <th>Revenue </th>
                </tr>

                <%for (int i = 0; i < productList.size(); i++) {%>
                <tr>
                    <td><%=i + 1%></td>
                    <td><%=productList.get(topSales[i]).getProdName()%></td>
                    <td><%=productList.get(topSales[i]).getProdId()%></td>
                    <td><%=productList.get(topSales[i]).getPrice()%></td>
                    <td><%=productSales[topSales[i]]%></td>
                    <td><%=productRevenue[topSales[i]]%></td>
                </tr>
                <% }%>
            </table>
            <br/>
            <br/>
            <script>
                google.charts.load('current', {'packages': ['corechart']});
                google.charts.setOnLoadCallback(salesChart);

                function salesChart() {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Customer');
                    data.addColumn('number', 'Unit Sold');
                    data.addRows([
                        ['<%=productList.get(topQuantity[0]).getProdId()%>', <%=productSales[topQuantity[0]]%>],
                        ['<%=productList.get(topQuantity[1]).getProdId()%>', <%=productSales[topQuantity[1]]%>],
                        ['<%=productList.get(topQuantity[2]).getProdId()%>', <%=productSales[topQuantity[2]]%>],
                        ['<%=productList.get(topQuantity[3]).getProdId()%>', <%=productSales[topQuantity[3]]%>],
                        ['<%=productList.get(topQuantity[4]).getProdId()%>', <%=productSales[topQuantity[4]]%>]
                    ]);

                    var options = {
                        title: 'ColumnChart of :     Top 5 Quantity of Product'
                    };

                    var chart = new google.visualization.ColumnChart(document.getElementById('quantityChart'));
                    chart.draw(data, options);
                }
            </script>
            <br/>
            <p><b>Report Type 2:</b>  Quantity of Product Sold</p>
            <div id="quantityChart" style="width:80%; min-width:400px; height:250px;"></div>
            <br/>
            <table class="info">
                <tr>
                    <th>Top </th>
                    <th>Product Name </th>
                    <th>Product ID </th>
                    <th>Unit Price </th>
                    <th>Quantity </th>
                    <th>Revenue </th>
                </tr>

                <%for (int i = 0; i < productList.size(); i++) {%>
                <tr>
                    <td><%=i + 1%></td>
                    <td><%=productList.get(topQuantity[i]).getProdName()%></td>
                    <td><%=productList.get(topQuantity[i]).getProdId()%></td>
                    <td><%=productList.get(topQuantity[i]).getPrice()%></td>
                    <td><%=productSales[topQuantity[i]]%></td>
                    <td><%=productRevenue[topQuantity[i]]%></td>
                </tr>
                <% }%>
            </table>
            <br/>
            <br/>
        </div>
    </body> 
</html>