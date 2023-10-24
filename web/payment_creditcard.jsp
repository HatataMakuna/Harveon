<%-- 
    Document   : payment_creditcard
    Created on : Mar 30, 2022, 6:55:19 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Payment"%>
<jsp:useBean id="creditcarddetails" scope="session" class="model.Payment"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment: Creditcard</title>
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

        div.ccard {
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
            margin: auto;
            margin-bottom: 50px;
            margin-top: 50px;
            padding: 250px;
            padding-right: 180px;
            padding-botton:250px;
            width: 58%;
            height: 80%;
            background-image: url("images/payment_picture_4.png");
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.7);

        }

        input[type="text"] {
            width: 250px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        select {
            width: 15%;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"],input[type="reset"] {
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

        #submit{
            margin-left: 100px;
        }

        #submit:hover,#reset:hover{
            background-color: #d3d3d3;
        }


        .right-box {
            position: absolute;
            top: 0;
            right: 0;
            box-sizing: border-box;
            width: 50%;
            height: 85%;
            background: rgba(255,255,255,0.7);
            border-radius: 20px;
            padding-top:40px;
            margin-top:40px;
            margin-right: 30px;
            margin-bottom:40px;
        }

        label{
            font-size: 100%;
            color:black;
            font-family:"Times New Roman";
            padding-left: 50px;
        }

        p{
            font-size: 200%;
            color:black;
            font-family:"Times New Roman";
            padding-left: 50px;
            text-align: left;
            padding-bottom: 20px;
            padding-top: 20px;
            padding-right:0px;
            margin: 0px;
            width: 250px;
        }


        .titles{
            position: relative;

        }

        #a{
            position: absolute;
            top: 5px;
            right: 40px;
        }

        .details{
            padding-top:20px;
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
            <button class="cart-button" style="background-color:var(--primary);color:white;padding:2% 1%;width:60%;" onclick="window.location.href = 'findCart';">Cart</button>
        </div>
    </header>
    <body>
        <div class="ccard">
            <form class="carddetails" action="payment_validateCreditCard" method="POST">
               
                <div class="right-box">
                    <div class="titles">
                        <p>Card Details</p>
                        <img id="a" src="images/payment_picture_3.png" alt="" style="width:100px"/>
                    </div>
                    <div class="details">
                        <label class="cardnumber">Card Number:</label>
                        <input type="text" id="cardnumber" name="cardnumber" required><br><br>
                        <label class="expirydate">Expiry Date:</label>
                        <select name="expirymonth" id="expirymonth">
                            <option value="1">01</option>
                            <option value="2">02</option>
                            <option value="3">03</option>
                            <option value="4">04</option>
                            <option value="5">05</option>
                            <option value="6">06</option>
                            <option value="7">07</option>
                            <option value="8">08</option>
                            <option value="9">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        /
                        <select name="expiryyear" id="expiryyear">
                            <option value="2022">22</option>
                            <option value="2023">23</option>
                            <option value="2024">24</option>
                            <option value="2025">25</option>
                            <option value="2026">26</option>
                            <option value="2027">27</option>
                            <option value="2028">28</option>
                            <option value="2029">29</option>
                            <option value="2030">30</option>
                            <option value="2031">31</option>
                        </select>
                        <br><br>
                        <label class="cvv">Cvv:</label>
                        <input type="text" name="cvv" id="cvv" required><br><br>
                        <input id="submit" name="submit" type="submit" value="Pay" onclick="getInputValue();">
                        <input id="reset" name="reset" type="reset" value="Reset">
                    </div>
                </div>
            </form>
        </div>
        <script>
            function getInputValue() {
                var cardnumber = document.getElementById("cardnumber").value;
                var ccv = document.getElementById("cvv").value;

                if (cardnumber === "" || ccv === "") {
                    alert("All are required fields");
                  
                }
            }
        </script>
    </body>
</html>
