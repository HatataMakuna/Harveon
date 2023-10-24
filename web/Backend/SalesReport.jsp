<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../GetAllData"/>
<%String user = (String) session.getAttribute("user");%>
<%
    List<Product> productList = (List<Product>) session.getAttribute("productList");
    List<OrderDetails> orderDetailsList = (List<OrderDetails>) session.getAttribute("orderDetailsList");
    List<OrderProduct> orderProductList = (List<OrderProduct>) session.getAttribute("orderProductList");
    List<ProductSpecification> prodspecList = (List<ProductSpecification>) session.getAttribute("prodspecList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <title>JSP Page</title>
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
            <h1>Sales Report</h1>
            <%
                String[] jan = new String[orderProductList.size()];
                String[] feb = new String[orderProductList.size()];
                String[] mac = new String[orderProductList.size()];
                String[] april = new String[orderProductList.size()];
                String[] may = new String[orderProductList.size()];
                String[] june = new String[orderProductList.size()];
                String[] july = new String[orderProductList.size()];
                String[] aug = new String[orderProductList.size()];
                String[] sep = new String[orderProductList.size()];
                String[] oct = new String[orderProductList.size()];
                String[] nov = new String[orderProductList.size()];
                String[] dec = new String[orderProductList.size()];

                //count total sales for each month
                int jcount = 0;
                int fcount = 0;
                int mcount = 0;
                int acount = 0;
                int macount = 0;
                int jucount = 0;
                int julcount = 0;
                int aucount = 0;
                int scount = 0;
                int ocount = 0;
                int ncount = 0;
                int dcount = 0;
                //count total sales(year)
                int totalsales = 0;

                for (int i = 0; i < orderProductList.size(); i++) {
                    if (orderProductList.get(i).getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue() == 1) {
                        jan[jcount] = orderProductList.get(i).getOrderId();
                        jcount++;
                        totalsales++;
                    } else if (orderProductList.get(i).getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue() == 2) {
                        feb[fcount] = orderProductList.get(i).getOrderId();
                        fcount++;
                        totalsales++;
                    } else if (orderProductList.get(i).getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue() == 3) {
                        mac[mcount] = orderProductList.get(i).getOrderId();
                        mcount++;
                        totalsales++;
                    } else if (orderProductList.get(i).getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue() == 4) {
                        april[acount] = orderProductList.get(i).getOrderId();
                        acount++;
                        totalsales++;
                    } else if (orderProductList.get(i).getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue() == 5) {
                        may[macount] = orderProductList.get(i).getOrderId();
                        macount++;
                        totalsales++;
                    } else if (orderProductList.get(i).getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue() == 6) {
                        june[jucount] = orderProductList.get(i).getOrderId();
                        jucount++;
                        totalsales++;
                    } else if (orderProductList.get(i).getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue() == 7) {
                        july[julcount] = orderProductList.get(i).getOrderId();
                        julcount++;
                        totalsales++;
                    } else if (orderProductList.get(i).getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue() == 8) {
                        aug[aucount] = orderProductList.get(i).getOrderId();
                        aucount++;
                        totalsales++;
                    } else if (orderProductList.get(i).getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue() == 9) {
                        sep[scount] = orderProductList.get(i).getOrderId();
                        scount++;
                        totalsales++;
                    } else if (orderProductList.get(i).getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue() == 10) {
                        oct[ocount] = orderProductList.get(i).getOrderId();
                        ocount++;
                        totalsales++;
                    } else if (orderProductList.get(i).getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue() == 11) {
                        nov[ncount] = orderProductList.get(i).getOrderId();
                        ncount++;
                        totalsales++;
                    } else if (orderProductList.get(i).getOrderDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue() == 12) {
                        dec[dcount] = orderProductList.get(i).getOrderId();
                        dcount++;
                        totalsales++;
                    }
                }
                int jtcount = 0;
                int ftcount = 0;
                int mtcount = 0;
                int atcount = 0;
                int matcount = 0;
                int jutcount = 0;
                int jultcount = 0;
                int autcount = 0;
                int stcount = 0;
                int otcount = 0;
                int ntcount = 0;
                int dtcount = 0;

                int jtotalitem = 0;
                int ftotalitem = 0;
                int mtotalitem = 0;
                int atotalitem = 0;
                int matotalitem = 0;
                int jutotalitem = 0;
                int jultotalitem = 0;
                int autotalitem = 0;
                int stotalitem = 0;
                int ototalitem = 0;
                int ntotalitem = 0;
                int dtotalitem = 0;
                //count total items sold
                int totalitem = 0;

                for (int i = 0; i < orderDetailsList.size(); i++) {
                    if (orderDetailsList.get(i).getOrderDetailsPK().getOrderId().equals(jan[jtcount])) {
                        jtotalitem += orderDetailsList.get(i).getQuantity();
                        totalitem += orderDetailsList.get(i).getQuantity();
                        jtcount++;
                    } else if (orderDetailsList.get(i).getOrderDetailsPK().getOrderId().equals(feb[ftcount])) {
                        ftotalitem += orderDetailsList.get(i).getQuantity();
                        totalitem += orderDetailsList.get(i).getQuantity();
                        ftcount++;
                    } else if (orderDetailsList.get(i).getOrderDetailsPK().getOrderId().equals(mac[mtcount])) {
                        mtotalitem += orderDetailsList.get(i).getQuantity();
                        totalitem += orderDetailsList.get(i).getQuantity();
                        mtcount++;
                    } else if (orderDetailsList.get(i).getOrderDetailsPK().getOrderId().equals(april[atcount])) {
                        atotalitem += orderDetailsList.get(i).getQuantity();
                        totalitem += orderDetailsList.get(i).getQuantity();
                        atcount++;
                    } else if (orderDetailsList.get(i).getOrderDetailsPK().getOrderId().equals(may[matcount])) {
                        matotalitem += orderDetailsList.get(i).getQuantity();
                        totalitem += orderDetailsList.get(i).getQuantity();
                        matcount++;
                    } else if (orderDetailsList.get(i).getOrderDetailsPK().getOrderId().equals(june[jutcount])) {
                        jutotalitem += orderDetailsList.get(i).getQuantity();
                        totalitem += orderDetailsList.get(i).getQuantity();
                        jutcount++;
                    } else if (orderDetailsList.get(i).getOrderDetailsPK().getOrderId().equals(july[jultcount])) {
                        jultotalitem += orderDetailsList.get(i).getQuantity();
                        totalitem += orderDetailsList.get(i).getQuantity();
                        jultcount++;
                    } else if (orderDetailsList.get(i).getOrderDetailsPK().getOrderId().equals(aug[autcount])) {
                        autotalitem += orderDetailsList.get(i).getQuantity();
                        totalitem += orderDetailsList.get(i).getQuantity();
                        autcount++;
                    } else if (orderDetailsList.get(i).getOrderDetailsPK().getOrderId().equals(sep[stcount])) {
                        stotalitem += orderDetailsList.get(i).getQuantity();
                        totalitem += orderDetailsList.get(i).getQuantity();
                        stcount++;
                    } else if (orderDetailsList.get(i).getOrderDetailsPK().getOrderId().equals(oct[otcount])) {
                        ototalitem += orderDetailsList.get(i).getQuantity();
                        totalitem += orderDetailsList.get(i).getQuantity();
                        otcount++;
                    } else if (orderDetailsList.get(i).getOrderDetailsPK().getOrderId().equals(nov[ntcount])) {
                        ntotalitem += orderDetailsList.get(i).getQuantity();
                        totalitem += orderDetailsList.get(i).getQuantity();
                        ntcount++;
                    } else if (orderDetailsList.get(i).getOrderDetailsPK().getOrderId().equals(dec[dtcount])) {
                        dtotalitem += orderDetailsList.get(i).getQuantity();
                        totalitem += orderDetailsList.get(i).getQuantity();
                        dtcount++;
                    }
                }

                jtcount = 0;
                ftcount = 0;
                mtcount = 0;
                atcount = 0;
                matcount = 0;
                jutcount = 0;
                jultcount = 0;
                autcount = 0;
                stcount = 0;
                otcount = 0;
                ntcount = 0;
                dtcount = 0;
                //count total price
                double totalprice = 0;
                double jtotalprice = 0;
                double ftotalprice = 0;
                double mtotalprice = 0;
                double atotalprice = 0;
                double matotalprice = 0;
                double jutotalprice = 0;
                double jultotalprice = 0;
                double autotalprice = 0;
                double stotalprice = 0;
                double ototalprice = 0;
                double ntotalprice = 0;
                double dtotalprice = 0;

                for (int i = 0; i < orderProductList.size(); i++) {
                    if (orderProductList.get(i).getOrderId().equals(jan[jtcount])) {
                        jtotalprice += orderProductList.get(i).getTotalPrice();
                        totalprice += orderProductList.get(i).getTotalPrice();
                        jtcount++;
                    } else if (orderProductList.get(i).getOrderId().equals(feb[ftcount])) {
                        ftotalprice += orderProductList.get(i).getTotalPrice();
                        totalprice += orderProductList.get(i).getTotalPrice();
                        ftcount++;
                    } else if (orderProductList.get(i).getOrderId().equals(mac[mtcount])) {
                        mtotalprice += orderProductList.get(i).getTotalPrice();
                        totalprice += orderProductList.get(i).getTotalPrice();
                        mtcount++;
                    } else if (orderProductList.get(i).getOrderId().equals(april[atcount])) {
                        atotalprice += orderProductList.get(i).getTotalPrice();
                        totalprice += orderProductList.get(i).getTotalPrice();
                        atcount++;
                    } else if (orderProductList.get(i).getOrderId().equals(may[matcount])) {
                        matotalprice += orderProductList.get(i).getTotalPrice();
                        totalprice += orderProductList.get(i).getTotalPrice();
                        matcount++;
                    } else if (orderProductList.get(i).getOrderId().equals(june[jutcount])) {
                        jutotalprice += orderProductList.get(i).getTotalPrice();
                        totalprice += orderProductList.get(i).getTotalPrice();
                        jutcount++;
                    } else if (orderProductList.get(i).getOrderId().equals(july[jultcount])) {
                        jultotalprice += orderProductList.get(i).getTotalPrice();
                        totalprice += orderProductList.get(i).getTotalPrice();
                        jultcount++;
                    } else if (orderProductList.get(i).getOrderId().equals(aug[autcount])) {
                        autotalprice += orderProductList.get(i).getTotalPrice();
                        totalprice += orderProductList.get(i).getTotalPrice();
                        autcount++;
                    } else if (orderProductList.get(i).getOrderId().equals(sep[stcount])) {
                        stotalprice += orderProductList.get(i).getTotalPrice();
                        totalprice += orderProductList.get(i).getTotalPrice();
                        stcount++;
                    } else if (orderProductList.get(i).getOrderId().equals(oct[otcount])) {
                        ototalprice += orderProductList.get(i).getTotalPrice();
                        totalprice += orderProductList.get(i).getTotalPrice();
                        otcount++;
                    } else if (orderProductList.get(i).getOrderId().equals(nov[ntcount])) {
                        ntotalprice += orderProductList.get(i).getTotalPrice();
                        totalprice += orderProductList.get(i).getTotalPrice();
                        ntcount++;
                    } else if (orderProductList.get(i).getOrderId().equals(dec[dtcount])) {
                        dtotalprice += orderProductList.get(i).getTotalPrice();
                        totalprice += orderProductList.get(i).getTotalPrice();
                        dtcount++;
                    }
                }%>
            <script>
                google.charts.load('current', {'packages': ['line']});
                google.charts.setOnLoadCallback(salesChart);

                function salesChart() {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Month');
                    data.addColumn('number', 'Total Sales');
                    data.addColumn('number', 'Total Items Sold');
                    data.addColumn('number', 'Total Prices');
                    data.addRows([
                        ['Jan', <%=jcount%>, <%=jtotalitem%>, <%=jtotalprice%>],
                        ['Feb', <%=fcount%>, <%=ftotalitem%>, <%=ftotalprice%>],
                        ['March', <%=mcount%>, <%=mtotalitem%>, <%=mtotalprice%>],
                        ['April', <%=acount%>, <%=atotalitem%>, <%=atotalprice%>],
                        ['May', <%=macount%>, <%=matotalitem%>, <%=matotalprice%>],
                        ['Jun', <%=jucount%>, <%=jutotalitem%>, <%=jutotalprice%>],
                        ['July', <%=julcount%>, <%=jultotalitem%>, <%=jultotalprice%>],
                        ['August', <%=aucount%>, <%=autotalitem%>, <%=autotalprice%>],
                        ['September', <%=scount%>, <%=stotalitem%>, <%=stotalprice%>],
                        ['October', <%=ocount%>, <%=ototalitem%>, <%=ototalprice%>],
                        ['November', <%=ncount%>, <%=ntotalitem%>, <%=ntotalprice%>],
                        ['December', <%=dcount%>, <%=dtotalitem%>, <%=dtotalprice%>]
                    ]);

                    var options = {
                        title: 'LineChart of :     Monthly Sales Report'
                    };

                    var chart = new google.charts.Line(document.getElementById('salesChart'));
                    chart.draw(data, options);
                }
            </script>
            <div>Report generate by:  <%= (new java.util.Date()).toLocaleString()%></div>
            <br/>

            <div id="salesChart" style="width:80%; min-width:400px; height:250px;"></div>
            <br/>

            <table class="info">
                <tr>
                    <th>Product Type</th>
                    <th>Total Sales</th>
                    <th>Total Item Sold</th>
                    <th>Total Price</th>
                </tr>
                <tr>
                    <td>January</td>

                    <td><%= jcount%></td>
                    <td><%= jtotalitem%></td>
                    <td><%= jtotalprice%></td>
                </tr>
                <tr>
                    <td>February</td>
                    <td><%= fcount%></td>
                    <td><%= ftotalitem%></td>
                    <td> <%= ftotalprice%></td>
                </tr>

                <tr>
                    <td>March</td>

                    <td><%= mcount%></td>

                    <td><%= mtotalitem%></td>

                    <td><%= mtotalprice%></td>
                </tr>

                <tr>
                    <td>April</td>

                    <td><%= acount%></td>

                    <td><%= atotalitem%></td>

                    <td><%= atotalprice%></td>
                </tr>
                <tr>
                    <td>May</td>

                    <td><%= macount%></td>

                    <td><%= matotalitem%></td>

                    <td><%= matotalprice%></td>
                </tr>
                <tr>
                    <td>June</td>

                    <td><%= jucount%></td>

                    <td><%= jutotalitem%></td>

                    <td><%= jutotalprice%></td>
                </tr>
                <tr>
                    <td>July</td>

                    <td><%= julcount%></td>

                    <td><%= jultotalitem%></td>

                    <td><%= jultotalprice%></td>
                </tr>
                <tr>
                    <td>August</td>

                    <td><%= aucount%></td>

                    <td><%= autotalitem%></td>

                    <td><%= autotalprice%></td>
                </tr>
                <tr>
                    <td>September</td>

                    <td><%= scount%></td>

                    <td><%= stotalitem%></td>

                    <td><%= stotalprice%></td>
                </tr> 
                <tr>
                    <td>October</td>

                    <td><%= ocount%></td>

                    <td><%= ototalitem%></td>

                    <td><%= ototalprice%></td>
                </tr>
                <tr>
                    <td>November</td>

                    <td><%= ncount%></td>

                    <td><%= ntotalitem%></td>


                    <td><%= ntotalprice%></td>
                </tr>
                <tr>
                    <td>December</td>

                    <td><%= dcount%></td>

                    <td><%= dtotalitem%></td>

                    <td><%= dtotalprice%></td>
                </tr>
                
                <tr style="background-color: #A0A0A0;">
                    <td><b>Average</b></td>
                    <% double avg = (double) totalsales / 12;%>
                    <td><b><%= String.format("%.2f", avg)%></b></td>
                    <% double avgt = (double) totalitem / 12;%>
                    <td><b><%= String.format("%.2f", avgt)%></b></td>
                    <% double avgp = (double) totalprice / 12;%>
                    <td><b><%= String.format("%.2f", avgp)%></b></td>
           
                <tr style="background-color: #A0A0A0;">
                    <td><b>Total(Year)</b></td>
                    <td><b><%= totalsales%></b></td>
                    <td><b><%= totalitem%></b></td>
                    <td><b><%= totalprice%></b></td>
                </tr>


            </table>
        </div>
    </body>

</html>
