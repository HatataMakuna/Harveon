<%-- 
    Document   : payment_confirmpayment
    Created on : Apr 1, 2022, 3:00:43 PM
    Author     : USER
--%>

<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Customer customer = (Customer)session.getAttribute("currentCus");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment: Confirm Payment</title>
        <!-- bootstrap 4.0 css -->
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="../themefisherFont/style.css">

    </head>
    <style>
        .form-inline{
            width:100%;
            height:100%;
        }
        .input-group{
            width:100%!important;
        }

        #submit,#confirmation button {
            background-color: #E0E0E0;
            color: black;
            border: none;
            cursor: pointer;
            border-radius: 10px;
            width: 100px;
            margin-top:0px;
            padding: 5px;
            margin: 20px;
            margin-bottom:0;
        }

        #submit:hover,#button:hover{
            background-color: #d3d3d3;
        }

        p{
            margin-left: 100px;
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
    <body>
        <form id="confirmation" action="../payment_add" method="post">
            <br>
            <p>Confirm to make the payment?
                <br><br>
                <input id="submit" type="submit" value="Confirm" name="submit"/>
                <a href="cartDisplay.jsp"><button type="button" onclick="cancel();">Cancel</button></a><!--- maybe return to main page? help to change it. thank you-->
               <!-- <a href="payment_ewallet.jsp"><button type="button" onclick="cancel();">Cancel</button></a> -->
        </form>
    </body>
    <script>
        function cancel() {
            alert('payment has been canceled');
        }
    </script>
</html>
