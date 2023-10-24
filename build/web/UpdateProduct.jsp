<%-- 
    Document   : AllProduct
    Created on : Apr 2, 2022, 1:10:29 AM
    Author     : nocry
--%>

<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Product product = (Product)session.getAttribute("selectedProduct");%>
<!DOCTYPE html>
<html>
    <head><meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="themefisherFont/style.css">
        <script src="jquery/dist/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
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
            }
            tr:nth-child(odd){
                background-color: #CCCCCC;
            }
            th,td{
                padding-top: 1%;
                padding-bottom: 1%;
                padding-left: 1%;
                text-align: center;
            }
            .tf-ion-android-delete{
                font-size:25px;
            }
            
            .grid-container{
                display:grid;
                grid-template-columns:1fr 1fr;
                grid-row-gap:15px;
            }
            
            .grid-item input,.grid-item textarea{
                width:100%;
            }
            
            .product-image{
                aspect-ratio:1/1;
                background-size: contain;
                background-position: center;
                background-repeat:no-repeat;
            }
        </style>
        <title>Products</title>

    </head> 
    <body>
        <div class="sidebar w3-sidebar" >
            <img src="images/harvenLogo.jfif" alt="HARVEN" width="40" height="32">

            <ul class="logo"> </ul>
            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a href="Staff.html" class="nav-link">
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
        <div class="main h-100">
            <h1><%=product.getProdName()%></h1>
            <div class="col-lg-5 d-flex">
                    <div class="product-image" style="margin:auto;background-color:white;height:300px;aspect-ratio:1/1;background-image:url('<%=product.getMainImage()%>')"></div>
            </div>
            <br>
            <form action="UpdateProduct">
            <div class="col-lg-5 grid-container p-0">
                <div class="grid-item">Id</div>
                <div class="grid-item"><input style="background:#e0e0e0;"type="text" name="prodId" value="<%=product.getProdId()%>" readonly/></div>
                <div class="grid-item">Name</div>
                <div class="grid-item"><input type="text" name="prodName" value="<%=product.getProdName()%>"/></div>
                <div class="grid-item">Price</div>
                <div class="grid-item"><input type="text" name="price" value="<%=product.getPrice()%>"/></div>
                <div class="grid-item">Description</div>
                <div class="grid-item"><textarea style="width:100%;" name="description"><%=product.getDescription()%></textarea></div>
                <div class="grid-item">Stock</div>
                <div class="grid-item"><input type="text" name="stock" value="<%=product.getStock()%>"/></div>
                <div class="grid-item">Image</div>
                <div class="grid-item"><input style="background:#e0e0e0;" type="text" name="mainImage" value="<%=product.getMainImage()%>" readonly/></div>
            </div>  
            <button type="submit">Update</button><button>Reset</button>
            </form>
        </div>
    </body>

</html>
