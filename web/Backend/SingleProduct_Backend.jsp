<%-- 
    Document   : AllProduct
    Created on : Apr 2, 2022, 1:10:29 AM
    Author     : nocry
--%>

<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Product product = (Product)session.getAttribute("selectedProduct");%>
<%String user = (String) session.getAttribute("user");%>
<!DOCTYPE html>
<html>
    <head><meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../themefisherFont/style.css">
        <script src="../jquery/dist/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
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
            
            .product-image{
                background:center no-repeat;
                background-size:cover;
            }
            
        </style>
        <title>Products</title>

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
        <div class="main h-100">
            <h1><%=product.getProdName()%></h1>
            <div class="col-lg-5 d-flex">
                    <div class="product-image" style="margin:auto;background-color:white;height:300px;aspect-ratio:1/1;background-image:url('<%=product.getMainImage()%>')"></div>
            </div>
            <br>
            <div class="col-lg-5 grid-container p-0">
                <div class="grid-item">ID</div>
                <div class="grid-item"><input type="text" name="prodId" value="<%=product.getProdId()%>" readonly/></div>
                <div class="grid-item">Price</div>
                <div class="grid-item"><input type="text" name="price" value="<%=product.getPrice()%>" readonly/></div>
                <div class="grid-item">Description</div>
                <div class="grid-item"><textarea style="width:100%;" name="description" readonly><%=product.getDescription()%></textarea></div>
                <div class="grid-item">Stock</div>
                <div class="grid-item"><input type="text" name="stock" value="<%=product.getStock()%>" readonly/></div>
            </div>  
            <button onclick="window.location.href='UpdateProduct.jsp';">Update Detail</button>
        </div>
    </body>

</html>
