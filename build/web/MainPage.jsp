<%-- 
    Document   : MainPage
    Created on : Mar 12, 2022, 8:45:33 PM
    Author     : nocry
--%>

<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Customer customer = (Customer)session.getAttribute("currentCus");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Harven</title>
        <!-- bootstrap 4.0 css -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="themefisherFont/style.css">
    </head>
    <body>
        <style>
            .text-white{
                color:white;
            }
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
                width:26%;
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
                <a href="">My Profile</a>
            </div>
            <% }
            else{ %>
            <div class="col-lg-12" style="color:white"><a href="CustomerLogin.html">Login</a></div>
            <% } %>
            <div class ="d-flex flex-row" style="background-color:#0A0A0A;justify-content: center;">
            <div class="col-lg-3 d-flex flex-row" style="justify-content:center;"><img src="images/harvenLogo.jfif"></div>
            <div class="col-lg-6">
                <form class="form-inline" action="ProcessSearch">
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
                <button class="cart-button" style="background-color:var(--primary);color:white;padding:2% 1%;width:60%;" onclick="window.location.href='findCart';">Cart</button>
            </div>
            </div>
        </header>
            <div class="d-flex" style="background-image:url('images/banner1.jpg');width:100%;height: 600px;background-repeat:no-repeat;background-size: cover;">
                <div class="text-white" style="width:40%;height:fit-content;margin:auto 0;padding:2%;">
                    <h1>Lorem ipsum dolor sit amet, cum sapientem</h1>
                    <p>Lorem Ipsum dolor sit amet, cum sapientem Lorem Ipsum dolor sit amet, cum sapientem Lorem Ipsum dolor sit amet, cum sapientem Lorem Ipsum dolor sit amet, cum sapientem</p>
                    <button onclick="window.location.href='AllProduct.jsp'" style="width:25%;padding:2% 0;background:white">Shop</button>
                </div>
            </div>

            <br>
            <section class="featured-product">
                <h1 class="d-flex" style="position:relative">
                    <span class="text-white" style="background:black;">Featured&nbsp</span>
                    <span>Products</span></h1>
                
                <div class="col-lg-12 d-flex flex-row product-section"style="flex-wrap: wrap;justify-content: space-around">

                <a href="DisplayProductInfo?method=GET&prodId=P100">
                <div class="product-box card">
                    <div class="product-image" style="background-image:url('images/test3.jfif')"></div>
                    <div class="product-description card-body">
                        <div class="product-name">Huawei Tablet ui-2380213</div>
                        <div class="product-price">M 1999.99</div>
                    </div>
                </div>
                </a>
                    
                <a href="DisplayProductInfo?method=GET&prodId=P100">
                <div class="product-box card">
                    <div class="product-image" style="background-image:url('images/test3.jfif')"></div>
                    <div class="product-description card-body">
                        <div class="product-name">Huawei Tablet ui-2380213</div>
                        <div class="product-price">M 1999.99</div>
                    </div>
                </div>
                </a>
                
                <a href="DisplayProductInfo?method=GET&prodId=P100">
                <div class="product-box card">
                    <div class="product-image" style="background-image:url('images/test3.jfif')"></div>
                    <div class="product-description card-body">
                        <div class="product-name">Huawei Tablet ui-2380213</div>
                        <div class="product-price">M 1999.99</div>
                    </div>
                </div>
                </a>
                    
                 <a href="DisplayProductInfo?method=GET&prodId=P100">
                <div class="product-box card">
                    <div class="product-image" style="background-image:url('images/test3.jfif')"></div>
                    <div class="product-description card-body">
                        <div class="product-name">Huawei Tablet ui-2380213</div>
                        <div class="product-price">M 1999.99</div>
                    </div>
                </div>
                </a>
                    
                <a href="DisplayProductInfo?method=GET&prodId=P100">
                <div class="product-box card">
                    <div class="product-image" style="background-image:url('images/test3.jfif')"></div>
                    <div class="product-description card-body">
                        <div class="product-name">Huawei Tablet ui-2380213</div>
                        <div class="product-price">M 1999.99</div>
                    </div>
                </div>
                </a>

                <a href="DisplayProductInfo?method=GET&prodId=P100">
                <div class="product-box card">
                    <div class="product-image" style="background-image:url('images/test3.jfif')"></div>
                    <div class="product-description card-body">
                        <div class="product-name">Huawei Tablet ui-2380213</div>
                        <div class="product-price">M 1999.99</div>
                    </div>
                </div>
                </a>




            </div>
            </section>
            <br>
            <section class="d-flex" style="justify-content:flex-end">
                <div class="d-flex flex-row" style="height:250px;width:70%;background-color: #08020B;padding:1%;">
                    <div class="m-20 col-lg-6 text-white d-flex flex-column" style="justify-content :center">
                        <h1>EXPLORE MORE OF OUR HOTTEST DEALS</h1>
                        <button onclick="window.location.href='AllProduct.jsp'" style="width:25%;padding:2% 0;background:white">Shop</button>
                    </div>
                    <div class="col-lg-6 m-50" style="height:100%;background-image:url('images/banner3.jpg');background-repeat: no-repeat;background-size:contain;background-position-x:right"></div>
                </div>
            </section>
            <br>
            <section>
                <h1 class="d-flex" style="position:relative">
                    <span class="text-white" style="background:black;">Shop By&nbsp</span>
                    <span>Categories</span></h1>
                <br>
                <div class="text-center" style="background-color:#E5E5E5">
                    <br>
                    <h1>OUR <b>TRUSTED</b> BRANDS</h1>
                    <p>Shop with ease with Harvey, providing quality products from these leading brands</p>
                    
                    <style>
                        .logo{
                            width:25%;
                            aspect-ratio:1/1;
                            background-repeat:no-repeat;
                            background-position:center;
                            background: contain;
                        }
                    </style>
                    <div class="d-flex flex-row">
                        <div class="logo" style="background-image: url('images/Dyson-Logo.png')"></div>
                        <div class="logo" style="background-image: url('images/HP-Logo.png')"></div>
                        <div class="logo" style="background-image: url('images/Samsung-Logo.png')"></div>
                        <div class="logo" style="background-image: url('images/Microsoft-Logo.png')"></div>
                        <div class="logo" style="background-image: url('images/HP-Logo.png')"></div>
                    </div>
                </div>
            </section>
            <br>
            <section class="d-flex" style="justify-content:flex-start">
                <div class="d-flex flex-row" style="height:250px;width:70%;background-color: #08020B;padding:1%;">
                    <div class="col-lg-6 m-50" style="height:100%;background-image:url('images/banner4.jpg');background-repeat: no-repeat;background-size:contain;background-position-x:left"></div>
                    <div class="m-20 col-lg-6 text-white d-flex flex-column text-right" style="justify-content :center;align-items: flex-end">
                        <h1>YOUR SATISFACTORY</h1>
                        <h1>OUR PRIORITY</h1>
                        <button onclick="window.location.href='AllProduct.jsp'" style="width:25%;padding:2% 0;background:white">Shop</button>
                    </div>
                    
                </div>
            </section>
            <br>
            
            <footer>
                
            </footer>
    </body>
</html>
