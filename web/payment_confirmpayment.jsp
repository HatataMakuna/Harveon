<%-- 
    Document   : payment_confirmpayment
    Created on : Apr 1, 2022, 3:00:43 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment: Confirm Payment</title>
        <!-- bootstrap 4.0 css -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="themefisherFont/style.css">

    </head>
    <style>
        .form-inline{
            width:100%;
            height:100%;
        }
        .input-group{
            width:100%!important;
        }

        #submit,button {
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
    <header class ="d-flex flex-row" style="background-color:#0A0A0A;padding: 1%;justify-content: center;">
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
            <button class="cart-button" style="background-color:var(--primary); color:white; padding:2% 1%; width:60%;" onclick="window.location.href = 'findCart';">Cart</button>
        </div>
    </header>
    <body>
        <form action="payment_add" method="post">
            <br>
            <p>Confirm to make the payment?
                <br><br>
                <input id="submit" type="submit" value="Confirm" name="submit"/>
                <a href="payment_creditcard.jsp"><button type="button" onclick="cancel();">Cancel</button></a><!--- maybe return to main page? help to change it. thank you-->
               <!-- <a href="payment_ewallet.jsp"><button type="button" onclick="cancel();">Cancel</button></a> -->
        </form>
    </body>
    <script>
        function cancel() {
            alert('payment has been canceled');
        }
    </script>
</html>
