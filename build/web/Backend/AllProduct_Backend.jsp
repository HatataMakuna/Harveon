<%-- 
    Document   : AllProduct
    Created on : Apr 2, 2022, 1:10:29 AM
    Author     : nocry
--%>
<jsp:include page="../GetAllData"/>
<%String user = (String) session.getAttribute("user");%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../LoadAllProduct"/>
<%List<Product> productList = (List<Product>)session.getAttribute("productList");%>
<!DOCTYPE html>
<html>
    <head><meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
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
                color: white !important;
            }

            li a:hover{
                color: black !important;
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
            .delete{
                width:50%;
                padding:0;
            }

            .info tbody{
                border: 1px solid rgba(0,0,0,.125);
            }
            
            .info thead,.info tbody{
                width:100%;
            }
            .info tr:nth-child(odd){
                background-color: #CCCCCC;
            }
            .info th, .info td{
                padding-top: 1%;
                padding-bottom: 1%;
                padding-left: 1%;
            }
            
            .info tr td:last-child,.info tr th:last-child{
                text-align: center;
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
        <title>Products</title>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".dropdown, .btn-group").hover(function () {
                    var dropdownMenu =
                            $(this).children(".dropdown-menu");
                    if (dropdownMenu.is(":visible")) {
                        dropdownMenu.parent().toggleClass("open");
                    }
                });
            });
        </script>
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
                            <td>
                                <form action="../SearchBy_productlist" method="POST">
                                    <select id="fieldselected" name="fieldselected">
                                        <option value="product_id">Product ID</option>
                                        <option value="product_name">Product Name</option>
                                        <option value="product_price">Price</option>
                                        <option value="stock">Stock</option>
                                    </select>
                                    <input type="text" id="details" name="details">
                                    <input id="submitS" name="submit" type="submit" value="Search">
                                </form>
                            </td>
                            <td><input id="submitS" name="submit" type="submit" value="Reload" onclick= "remain()"></td>
                            <td><p style="padding-left: 600px;padding-top: 15px;"><%=user%></p></td>
                            <td><img src="../picture/people-outline.svg" alt="userIcon.png" style="margin-left: 20px; width: 30px ; height: 30px" ></td>
                        </tr>
                    </table>
                </div>
            </nav>
        </div>
        <div class="main h-100">
            <h1>All Product</h1>
            <button onClick="window.location.href='AddProduct.jsp'">Add Product</button>          
                            
                        <div style="margin:2%;">
                <%if (productList.size() == 0) {%>
                <div style="text-align:center;">**No Product in Database !!</div>
                <% } else {%>
                <table class="info table-responsive" cellspacing="1" cellpudding="1">
                    <tbody>
                    <tr>
                                <th style= "width : 5%" >ID</th>
                                <th style= "width : 15%" >Name</th>
                                <th style= "width : 10%" >Price</th>
                                <th style= "width : 20%" >Description</th>
                                <th style= "width : 10%" >Stock</th>
                                <th style= "width : 10%" >Action</th>
                            </tr>

                    <%  Product product; 
                        for (int i = 0;i<productList.size();i++) {
                            product = productList.get(i);
                    %>

                    <tr>
                                    <td><%=product.getProdId()%></td>
                                    <td><a href='../DisplayProductInfo_Backend?method=GET&prodId=<%=product.getProdId()%>'><%=product.getProdName()%></a></td>
                                    <td><%=product.getPrice()%></td>
                                    <td><%=product.getDescription()%></td>
                                    <td><%=product.getStock()%></td>
                                    <td>    
                                        <button class="delete" value="<%=i%>" data-toggle="modal" data-target="#modal-confimration" onclick="saveValue(this);">
                                            <i class="tf-ion-android-delete"></i>
                                        </button>
                                    </td>
                                </tr>

                    <% }%>
                </tbody>
                </table>
                    <% }%>
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
                                    var location= "../DeleteProduct?prodId=" +targetDelete
                                    document.location.href=location;
                                }
                                
                                function remain(){
                                    location.href="AllProduct_Backend.jsp";
                                }
                            </script>
</html>
