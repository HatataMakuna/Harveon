<%-- 
    Document   : AllProduct
    Created on : Apr 2, 2022, 1:10:29 AM
    Author     : nocry
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="LoadAllProduct"/>
<%List<Product> productList = (List<Product>)session.getAttribute("productList");%>
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
            <h1>All Product</h1>
            <button onClick="window.location.href='AddProduct.jsp'">Add Product</button>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover  m-0">
                            <thead>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Description</th>
                                <th>Stock</th>
                                <th>Action</th>
                            </thead>
                            <tbody>
                                <%
                                    Product product;
                                    for(int i = 0;i<productList.size();i++){ 
                                        product = productList.get(i);
                                %>
                                
                                <tr>
                                    <td><%=product.getProdId()%></td>
                                    <td onclick="window.location.href='DisplayProductInfo_Backend?method=GET&prodId=<%=product.getProdId()%>'"><%=product.getProdName()%></td>
                                    <td><%=product.getPrice()%></td>
                                    <td><%=product.getDescription()%></td>
                                    <td><%=product.getStock()%></td>
                                    <td>    
                                        <button value="<%=i%>" data-toggle="modal" data-target="#modal-confimration" onclick="saveValue(this);">
                                            <i class="tf-ion-android-delete"></i>
                                        </button>
                                    </td>
                                </tr>
                                <% } %>
                            <tbody>
                        </table>
                    </div>
                </div>
            </div>
                            
            
            <div class="modal fade show" id="modal-confimration" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header"><h4 class="modal-title">Delete Confirmation</h4></div>
                        <div class="modal-body">
                            <p>Confirm to delete Product?</p>
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button type="button" id="deleteConfirm" class="btn btn-default" data-dismiss="modal" onclick="deleteProduct();">Confirm</button>
                        </div>
                    </div>
                </div>
            </div>                
        </div>
    </body>
    <script>
                                var targetDelete;
                                function saveValue(elem){
                                    targetDelete = elem.value;
                                    
                                }
                                
                                function deleteProduct(){
                                    var location= "DeleteProduct?prodId=" +targetDelete
                                    document.location.href=location;
                                }
                            </script>
</html>
