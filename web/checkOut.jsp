<%-- 
    Document   : checkOut
    Created on : Mar 28, 2022, 8:38:55 PM
    Author     : tzeha
--%>

<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Customer cus =(Customer)session.getAttribute("currentCus");%>
<%List <Cart> cartList = (List<Cart>)session.getAttribute("cartList");%>
<%double[] price=new double[cartList.size()];%>
<%! double totalPrice=0;%>

<!DOCTYPE html>

<html lang="en">

<head>



  <!-- Basic Page Needs

  ================================================== -->

  <meta charset="utf-8">

  <title>template</title>



  <!-- Mobile Specific Metas

  ================================================== -->

  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <meta name="description" content="Construction Html5 Template">

  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">

  <meta name="author" content="">

  

  <!-- Favicon -->

  <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />

  

  <!-- Themefisher Icon font -->

  <link rel="stylesheet" href="themefisherFont/style.css">

  <!-- bootstrap.min css -->

  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">





  <!--Jquery Confirm-->

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.0/jquery-confirm.min.css">




  <!--Cust-->
  <link rel="stylesheet" href="css/custCss.css">
  

  <script
      src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
      type="text/javascript"
    ></script>

  <script src="jquery/dist/jquery.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

  
   



</head>



<style>
  
  td{
    padding:0 1%;
  }
  .cart-image{/*1. image*/
      width:8%;
  }
  .cart-name{/*3. product-name*/
      width:30%;
  }
  .cart-variation{/* 3. varaitions (mobile-hide)*/
      width:20%;
  }
  .cart-unit{/*5. unit-price*/
      width:15%;
  }
  .cart-qty{/*6. counter*/
      width:10%;
  }
  .cart-total{/*7. total-price*/
      width:10%;
      text-align:right;
  }

  .row{
    border-bottom:1px dashed #E8E8E8;
    padding:2% 0;
    margin-left:0;
    margin-right:0;
  }
  .row div{
    vertical-align: middle;
  }

  tr{
     border-bottom:1px solid #E8E8E8;
 }

 .cart-item{
     height:120px;
     vertical-align: middle;
 }

 body{
   background:#F7F7F7;
 }

 /*effect bootstrap*/
 .container{
   background:white;
   margin-top:1%;
 }

 thead tr td{
    padding:1%!important;
}
.payment-menu {
        background:white;
        top:10%;
        left:30%;
        height:80%;
        width:40%;
        position:fixed;
        z-index:2;
        border-radius: 8px;
    }

@media only screen and (max-width: 991px){

  .payment-menu {
                top:10%;
                left:0%;
                width:100%;
                padding:1%;
   

            }

  .cart-image{
      width:1%;
  }

  .cart-total{
      text-align:left;
  }

  input[type="text"]{
    height:30px;
  }

}

.imagebox {

border:3px solid #999;

border-radius: 6px

}


.content-box {

background:#fff;

border-radius:8px;

padding: 12px 18px;

margin-bottom:16px

}



.content-box .card-method h5 {

float:left;

font-weight:600;

font-size:16px;

}

.content-box .card-method span {

float:right;

font-size:13px;

white-space: nowrap

}



.content-box .wallet {

margin-top:40px

}



.content-box .wallet h5{

font-weight:600;

font-size:16px;

}





.content-box .connect-wallet .wallet-icon span {

float:right;

padding-top:10px;

white-space: nowrap

}



.content-box .bank {

margin-top:40px

}



.content-box .bank h5{

font-weight:600;

font-size:16px;

}





.content-box .connect-bank .bank-icon span {

float:right;

padding-top:10px;

white-space: nowrap

}

.table>tbody>tr>td{
  border:0;
}

input[type="text"]{
    border:#F7F7F7;
  }

.address-section{
  padding: 2%;
}






</style>



<body id="body">
  <!--Address-->
  <div class="container address-section">

    <div class="col-lg-12">
      <i class="tf-ion-ios-location"></i>Delivery Address
    </div>

    <div class="address-detail col-lg-12">
      <!--detail start-->
      <div class="col-lg-2 no-padding" style="font-weight: 600;">
          <span class="name"><%= cus.getName()%></span><!--here-->
        <span class="contact"><%= cus.getPhone() %></span> <!--here-->
      </div>
      <div class="col-lg-8 no-padding">
          <span class="address two-row-hidden"><%= cus.getAddress() %></span><!--here-->
      </div>
      <div class="col-lg-2 no-padding">
        <button class="clr-btn" onclick="switchBox('address-list','address-detail');">CHANGE</button>
      </div>
      <!--detail end-->
    </div>
  </div><!--end Address-->

  <!--Check out-->
  <div class="container cart-section">
    <div class="table-container">
      <!--cart list-->
      <table class="check-out-list table">
        <thead class="mobile-hide">
          <tr>
            <td class="cart-image">Product</td>
            <td class="cart-name"></td>
            <td class="cart-unit">Unit Price</td>
            <td class="cart-qty">Quantity</td>
            <td class="cart-total">Total Price</td>
          </tr>
        </thead>

        <% for(int index=0; index<cartList.size();index++){%>
        <tbody>
          <!--cart item-->
          <tr class="cart-item"> <!--here, user tr to generate per record-->
            <td class="cart-image">
            <a href="singleProd.html">
                <div class="image">
                    <img src="<%= cartList.get(index).getProduct().getMainImage() %>" /> <!--here-->
                </div>
            </a>
            </td>

            <td class="mobile-row cart-name">
                <div class="product-name one-row-hidden">
                  <%= cartList.get(index).getProduct().getProdName() %>
                </div> <!--here-->
            </td>

            <td class="mobile-row cart-unit">
              <span class="price-text-smaller unit-price"><%= cartList.get(index).getProduct().getPrice() %></span> <!--here-->
            </td>

            <td class="mobile-row cart-qty">
              <span id="quantity-ordered">x <%= cartList.get(index).getQuantity() %></span> <!--here-->
            </td>
            
            <td class="mobile-hide cart-total">
                <% price[index]=cartList.get(index).getQuantity()*cartList.get(index).getProduct().getPrice().doubleValue();%>
                <span class="total-price">
                    <%= price[index]%>    
                </span> <!--here-->
            </td>

          </tr>
        </tbody>
         <%}%>
      </table>

    </div>
    <!--Check out option-->


    

    <div class="row order-total-box">
      <div class="col-lg-12 text-right">
        <span>Order Total  : </span>
        <%
            for(int x=0;x<price.length;x++){
                totalPrice+=price[x];
                
            }
            BigDecimal bd = new BigDecimal(totalPrice).setScale(2, RoundingMode.HALF_UP);
            totalPrice=bd.doubleValue();
            session.setAttribute("totalPrice",totalPrice);
        %>
        <span class="price-text">RM <span class="order-total-price"><%= totalPrice %></span></span><!--here-->
      </div>
    </div>



  

  </div>


  <!--Payment Section-->
    <div class="container">
            <div class="row payment-method mobile-hide">
                <div class="col-lg-2"><span>Payment Method</span></div>
                <div class="col-lg-10 no-padding">
                    <!-- <div class="flex-row wrap variation-button">
                         <button id="payment1" class="payment-var" submit-button >credit card</button>
                         <button  id="payment2" class="payment-var" submit-button>ewallet</button>
                     </div>
                    -->
                    <ul class="payment-method">
                        <li>
                            <input type="radio" id="creditcard" name="methods" />
                            <label for="creditcard">credit card</label>
                        </li>
                        <li>
                            <input type="radio" id="ewallet" name="methods" />
                            <label for="ewallet">ewallet</label>
                        </li>
                    </ul>
                </div>
            </div>
            <br>
      
      <div class="row no-border">
        <div class="col-lg-8"></div>
        <div class="col-lg-4 col-xs-12 flex-row no-padding">
          <div class="col-lg-6 col-xs-6 no-padding">Total Payment</div>
          <div class="col-lg-6 col-xs-6 text-right price-text no-padding">
             <span class="overall-total">RM <%= totalPrice %></span> <!--here-->
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-9"></div>
             <button id="place-order-btn" class="col-lg-3 col-xs-12 btn-primary" onclick="myFunction()">
                Place Order
            </button>
            <script>
                function myFunction() {
                    if (document.getElementById("creditcard").checked) {
                    location.href = "payment_creditcard.jsp";
                    }else if(document.getElementById("ewallet").checked){
                        location.href = "payment_ewallet.jsp";
                    }
                }
            </script>
      </div>
</div>

<footer class="footer section text-center">

</footer>



     <!-- 

    Essential Scripts

    =====================================-->

    

    <!-- Main jQuery -->

    <script src="jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap 3.1 -->

    <script src="bootstrap/js/bootstrap.min.js"></script>






	<!--Jquery Confirm-->

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.0/jquery-confirm.min.js"></script>


    <script src="js/generalFunction.js"></script>

    
  </body>

  </html>