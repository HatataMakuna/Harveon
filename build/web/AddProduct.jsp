<%-- 
    Document   : AddProduct
    Created on : Apr 2, 2022, 3:31:22 AM
    Author     : nocry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="productDetails" scope="session" class="model.Product"/>


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
            .grid-container{
                display:grid;
                grid-template-columns:1fr 1fr;
                grid-row-gap:15px;
            }
            
            .grid-item input,.grid-item textarea{
                width:100%;
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
            <h1>Add Product</h1>
            <br/>
            <div>
                <form action="AddProduct" method="POST" enctype="multipart/form-data">
                    <div class="col-lg-5 grid-container p-0">
                        <div class="grid-item">ID</div>
                        <div class="grid-item"><input type="text" name="prodId"/></div>
                        <div class="grid-item">Name</div>
                        <div class="grid-item"><input type="text" name="prodName"/></div>
                        <div class="grid-item">Price</div>
                        <div class="grid-item"><input type="text" name="price"/></div>
                        <div class="grid-item">Description</div>
                        <div class="grid-item"><textarea style="width:100%;" name="description"/></textarea></div>
                        <div class="grid-item">Stock</div>
                        <div class="grid-item"><input type="text" name="stock"/></div>
                        <div class="grid-item">Image</div>
                        <div class="grid-item"><input type="file" name="main_image"/></div>
                    </div>
                    <button type="submit">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
