<%-- 
    Document   : login
    Created on : Apr 10, 2022, 1:28:07 AM
    Author     : nocry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height:100%;">
    <head>
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <style>
            ._content{
                background-image:url('../picture/loginBackground.jpg');
                background-repeat: no-repeat;
                background-size:cover;
            }

            ._picture{
                display: block;
                margin-left: auto;
                margin-right: auto;
                width: auto;
            }
            ._form{
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                color: white;
            }

            ._form input{
                width:100%;
                padding:2%;
            }

            ._SubmitBtn{
                color: white;
                background-color:rgb(0,48,143);
            }
            ._RegisterBtn{
                color: white;
                margin-left:10%;
                background-color:rgb(0,48,143);
            }
        </style>

        <title>Customer Login</title>

        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>

    <body class="_content" style="height:100%;padding:5%;">
        <div class="d-flex" style="justify-content:flex-end">
            <div style="background-color:#0A0A0A;width:30%;padding:2%;border-radius:10px;border:1px solid #0A0A0A;">
                <header><img class="_picture" src="../picture/harvenLogo.jfif" alt="Login"></header>
                <form class="_form">
                    <div>
                        <input id="username" type="text" placeholder="Enter Staff ID / Admin" name="j_username"><br><br>
                        <input id="password" type="password" placeholder="Enter Password" name="j_password"><br>
                    </div><br>
                    <b><button onclick="login();" type="submit" name="submit" value="Login" class="_SubmitBtn"></button></b>

                </form>
            </div>
        </div>
        <script>
            function login(){
                var username = document.getElementById("username").value
                var password = document.getElementById("password").value
                window.location.href='j_security_check';
            }
        </script>
    </body>
    
</html>
