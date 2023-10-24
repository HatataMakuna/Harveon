<%-- 
    Document   : SingleProduct
    Created on : Mar 10, 2022, 8:51:53 AM
    Author     : nocry
--%>

<%@page import="model.Customer"%>
<%@page import="java.util.List"%>
<%@page import="model.ProductSpecification"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Product product = (Product)session.getAttribute("selectedProduct");%>
<%Customer cus =(Customer)session.getAttribute("currentCus");%>
<% session.setAttribute("currentCus",cus);%>

<%Customer customer = (Customer)session.getAttribute("currentCus");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=product.getProdName()%></title>
        <!-- bootstrap 4.0 css -->
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="../themefisherFont/style.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

    </head>
    <body>
        <style>
            
            .product-detail{
                min-height:500px;
            }
            
            .image-container{
                width:100%;
                background-size:contain;
                background-position:center;
                background-repeat: no-repeat;
                height:100%;
            }
            .container{
                background:#EBEBEB;
                margin-bottom:20px;
            }
            button{
                cursor:pointer;
            }
            .counter button{
                width:20%;
                margin:0
            }
            .counter input{
                width:60%;
                margin:0
            }
            
            .price-text{
                color: var(--primary);
                font-size:25px;
                font-weight:600;
            }
            
            .product-name{
                font-size:30px;
            }
            .product-rating i{
                font-size: 15px;
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
        <br>
        <form action='../addCart'>
        <section class='container p-0'>
            <div class="product-detail col-lg-12 p-0" style="display:flex;flex-direction:row">
                <div class="col-lg-7"  style="background: white;">
                    <div class="image-container" style="background-image:url('<%=product.getMainImage()%>');"></div>
                </div>

                
                <div class="col-lg-5">
                    <div class="col-lg-12 product-name"><%=product.getProdName()%></div>
                    <div class="col-lg-12 price-text">RM<%=product.getPrice()%></div>
                    <div class="col-lg-12 d-flex flex-row">
                        <div class="product-rating">5.0</div>
                        <div class="col-lg-5 product-rating">
                            <i class="tf-ion-ios-star"></i>
                            <i class="tf-ion-ios-star"></i>
                            <i class="tf-ion-ios-star"></i>
                            <i class="tf-ion-ios-star"></i>
                            <i class="tf-ion-ios-star-outline"></i>
                        </div>
                    </div>
                   
                    

                        <div class="counter col-lg-12 d-flex flex-row">
                            <button type="button" class="decrement-quantity" aria-label="Subtract one" data-direction="-1" disabled="disabled">
                              <span>&#8722;</span>
                            </button>

                            <input data-min="1" data-max="0" type="text" name="quantity" value="1" style="text-align: center"/>
                            <button type="button" class="increment-quantity" aria-label="Add one" data-direction="1">
                              <span>&#43;</span>
                            </button>
                        </div>
                    
                    <script>
                            /*Counter*/
$("button").on("click", function(ev) {
  var currentQty = $('input[name="quantity"]').val();
  var qtyDirection = $(this).data("direction");
  var newQty = 0;
  
  
  if (qtyDirection == "1") {
    newQty = parseInt(currentQty) + 1;
  }
  else if (qtyDirection == "-1") {
    newQty = parseInt(currentQty) - 1;
  }

  // make decrement disabled at 1
  if (newQty == 1) {
    $(".decrement-quantity").attr("disabled", "disabled");
  }
  
  // remove disabled attribute on subtract
  if (newQty > 1) {
    $(".decrement-quantity").removeAttr("disabled");
  }

  
  if (newQty > 0) {
    newQty = newQty.toString();
    $('input[name="quantity"]').val(newQty);
  }
  else {
    $('input[name="quantity"]').val("1");
  }
 
}); 
</script>
                        
               
                    <div class="col-lg-12">
                            <span class="text-muted"><%=product.getStock()%> piece available</span>
                        </div>
                    <div class="col-lg-12"><button class="btn-primary col-lg-12" onclick="window.location.href='addCart';">Add to Cart</button></div>
                    <div class="col-lg-12"><button class="btn-secondary col-lg-12 border-0" disabled>Enquire Detail</button></div>
                </div>
            </div>
        </section>
                </form>
                    
                    
                    <section class="container p-0">
                        <div class="card card-primary card-outline card-tabs" style="min-height:500px;">
                            <div class="card-header"><h4>Description</h4></div>
                            <div class="card-body">
                                <p>
                                    <%=product.getDescription()%>
                                </p>
                            </div>
                            <div class="card-header"><h4>Specification</h4></div>
                            <div class="card-body">
                                <%List<ProductSpecification> specifications = product.getProductSpecificationList();
                                    for(int i = 0;i < specifications.size();i++){
                                        ProductSpecification prodSpec = specifications.get(i);
                                %>
                                <div class="col-lg-12 d-flex flex-row">
                                    <div class="col-lg-6"><%=prodSpec.getSpecification().getSpecName()%></div>
                                    <div class="col-lg-6"><%=prodSpec.getSpecValue()%></div>
                                </div>
                                <br>
                                <% } %>
                             
                            </div>
                        </div>
                    </section>
                                
                                <section class="container p-0">
                                    <div class="card card-primary card-outline card-tabs" style="min-height:500px;">
                            <div class="card-header"><h4>Rating And Comment</h4></div>
                            <div class="card-body">
                                    
                            </div>
                        </div>
                                </section>
        <!-- Main jQuery -->
    <script src="jquery/dist/jquery.min.js"></script>
    </body>
</html>
