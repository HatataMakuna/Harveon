<%-- 
    Document   : ewallet
    Created on : Mar 30, 2022, 12:11:39 PM
    Author     : USER
--%>

<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Customer customer = (Customer)session.getAttribute("currentCus");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment: EWallet</title>
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

        div.epay {
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
            background-image: url("../images/ewallet.jpeg");
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.7);
        }

        input[type="text"],input[type="password"] {
            width: 250px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"],input[type="reset"] {
        
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 10px;
            width: 100px;
            margin-top:0px;
            padding: 5px;
            margin: 20px;
            margin-top:60px;
            margin-bottom:0;
            background-color:#A0A0A0;
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
            right:0;
            box-sizing: border-box;
            width: 50%;
            height: 85%;
            background: rgba(255,255,255,0.7);
            border-radius: 20px;
            padding-top:40px;
            margin-top:40px;
            margin-bottom:40px;
            margin-right: 50px;
        }

        label{
            font-size: 100%;
            color:black;
            font-family:"Times New Roman";
            padding-left: 50px;
        }

        .details{
            padding-top:20px;
        }
        
        p{
            font-size: 200%;
            color:black;
            font-family:"Times New Roman";
              padding-left: 50px;
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
        <div class="epay">
            <form class="ewalletdetails" action="../payment_validateEWallet" method="POST">             
                <div class ="right-box">
                    <p>Ewallet Details</p>
                    <div class="edetails">
                        <label class="ewalletnumber" >Contactnumber:</label> 
                        <input type="text" id ="ewalletnumber" name="ewalletnumber" placeholder="01x-xxxxxxx" required><br><br>
                        <label class="password">Password(6-digit):</label> 
                        <input type="password" placeholder="xxxxxx" name="password" id="password" required><br><br>
                        <input id="submit" name="submit" type="submit" value="Pay" onclick="getInputValue();">
                        <input id="reset" name="reset" type="reset" value="Reset">
                    </div>
                </div>
            </form>
        </div>
        <script>
            function getInputValue() {
                var ewalletnumber = document.getElementById("ewalletnumber").value;
                var pwd = document.getElementById("password").value;

                if (ewalletnumber === "" || pwd === "") {
                    alert("All are required fields");
                    
                }
            }
        </script>

    </body>
</html>
