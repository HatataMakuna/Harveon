<%-- 
    Document   : AllProduct
    Created on : Mar 9, 2022, 10:56:42 PM
    Author     : nocry
--%>

<%@page import="model.Specification"%>
<%@page import="model.Customer"%>
<%@page import="model.ProductSpecification"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../LoadAllProduct"/>
<jsp:include page="../LoadAllSpec"/>

<%Customer customer = (Customer)session.getAttribute("currentCus");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- bootstrap 4.0 css -->
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="../themefisherFont/style.css">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.0/jquery-confirm.min.css"
            />
        <script src="../jquery/dist/jquery.min.js"></script>
    </head>
    <body>
        <%List<Product> productList = (List<Product>)session.getAttribute("productList");%>
        <%List<Specification> specList= (List<Specification>)session.getAttribute("specList");%>
        <style>
            .product-box{
                display:flex;
                flex-direction: column;
            }
         
            
            .product-image{
                aspect-ratio:1/1;
                background-size: contain;
                background-position: center;
                background-repeat:no-repeat;
            }
            
            .container-custom{
                padding:10px;
            }
            button{
                cursor:pointer;
            }
            .product-section a{
                width:24%;
                margin:0.5%; 
            }
            
            .product-section a:hover{
                text-decoration: none; 
            }
            .product-description{
                aspect-ratio:2/1;
                position:relative;
                
            }
            .product-name{
                font-weight:600;
                color:#0062BD;
                min-height: 8 0px;
            }
            .product-price{
                color:black!important;
                font-size:18px;
            }
            .row{
                padding:2%;
            }
            
            .form-inline{
                width:100%;
                height:100%;
            }
            .input-group{
                width:100%!important;
            }

        </style>
        <header style="background-color:#0A0A0A;">
            <%if(customer!=null){%>
            <div class="col-lg-12" style="color:white">
                Welcome <%=customer.getName()%>
                <a href="viewProfile.jsp">My Profile</a>
                <a href="../ShowOrderHistory">My Order</a>
            </div>
            <% }
            else{ %>
            <div class="col-lg-12" style="color:white"><a href="CustomerLogin.html">Login</a></div>
            <% } %>
            <div class ="d-flex flex-row" style="background-color:#0A0A0A;justify-content: center;">
            <div onclick="window.location.href='MainPage.jsp'" class="col-lg-3 d-flex flex-row" style="justify-content:center;cursor:pointer;"><img src="../picture/harvenLogo.jfif"></div>
            <div class="col-lg-6">
                <form class="form-inline" action="../ProcessSearch">
                    <div class="input-group">
                        <input name="search" class="form-control form-control-navbar" type="search" placeholder="Enter product name or id">
                        <div class="input-group-append">
                            <button class="btn btn-navbar" type="submit">
                                <i class="tf-ion-android-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-2" style="margin:auto 0;">
                <button class="cart-button" style="background-color:var(--primary);color:white;padding:2% 1%;width:60%;" onclick="window.location.href='../findCart';">Cart</button>
            </div>
            </div>
        </header>
        <h1>All Products</h1>
        <section class="container-custom d-flex flex-row">
            <div class="col-lg-9 d-flex flex-row product-section"style="flex-wrap: wrap">
                <%
                    Product product;
                    for(int i = 0;i<productList.size();i++){ 
                        product = productList.get(i);
                %>
                <a href="../DisplayProductInfo?method=GET&prodId=<%=product.getProdId()%>">
                <div class="product-box card">
                    <div class="product-image" style="background-image:url('<%=product.getMainImage()%>')"></div>
                    <div class="product-description card-body">
                        <div class="product-name"><%=product.getProdName()%></div>
                        <div class="product-price">RM <%=product.getPrice()%></div>
                    </div>
                </div>
                </a>
                <% } %>
            </div>
            
            <div class="col-lg-3 d-flex flex-column p-0">
               <%
                    Specification spec;
                    for(int i = 0;i<specList.size();i++){ 
                        spec = specList.get(i);
                %>
                <div class="w-100">
                    <div class="w-100 row" style="background-color: var(--primary);color:white;"><%=spec.getSpecName()%></div>
                    <div class="w-100 row d-flex flex-column p-0" style="background:#F5F5F5;">
                       <%
                           List<ProductSpecification> prodSpecList = spec.getProductSpecificationList();
                        ProductSpecification prodSpec;
                        for(int j = 0;j<prodSpecList.size();j++){ 
                            prodSpec = prodSpecList.get(j);
                        %>
                        <div><input type="checkbox" name="filterValue" value="<%=prodSpec.getSpecValue()%>"/>&nbsp;&nbsp;<%=prodSpec.getSpecValue()%></div>
                        <% } %>
                    </div>
                    <br>
                </div>
                 <% } %>
                 <script>
                     function filterGenerate(){
                         var condition ="";
                         var starting ="SELECT p FROM Product p WHERE p.prodId IN (SELECT prodId FROM ProductSpecification WHERE "
                         var ending=");"
                         var checkboxes = document.getElementsByName('filterValue');
                         var n = checkboxes.length;
                         var totalCondition= 0 ;
                         for(var i = 0;i<n;i++){
                             
                             if($(checkboxes[i]).is(":checked")){
                                 
                                 if(totalCondition !=0){
                                 condition += " AND "
                             }
                                 condition += "specValue='" + checkboxes[i].value + "'";
                                 totalCondition++;
                             }
                         }
                         var query = starting + condition + ending;
                         
//                         $.ajax({
//                            url: "AllProduct.jsp",
//                            data: {
//                              sortQuery: query
//                            },
//                            success: function(data) {
//                              alert("lol")
//                            }
//                        });
alert(query)
window.location.href="AllProduct.jsp?sortQuery="+ query;
                         
                     }
                 </script>
                 <div class="row"><button onclick="filterGenerate();" class="btn-primary">Submit</button></div>
            </div>
                
        </section>
                 
    </body>
</html>
