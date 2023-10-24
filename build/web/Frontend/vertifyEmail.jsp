<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html class>
    <head>
        <title>Verify Email</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        
        <style>
            ._picture{
                display: block;
                margin-left: auto;
                margin-right: auto;
                width: auto;
            }
            form{
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                color: white;
                background: #0A0A0A;
                width:50%;
                padding:5%;
                border:1px solid black;
                border-radius:10px;
            }
            
            ._SubmitBtn{
                color: white;
                background-color:rgb(0,48,143);
            }

           
            form div input{
                width:100%;
                padding:2%;
            }
            
            html{
            min-height: 100%;
            display:flex;
            background:url('../picture/registerBackground.jpg') center no-repeat;
            background-size: cover;
            }
            
            body{
                width:100%;
                margin:auto;
                background:rgba(255,255,255,0);
            }
            
        </style>
    </head>
    <body class="._content">
        
        
        <div class="container">
        <form action="../VerifyCode" method="post">
            <header><img class="_picture" src="../picture/harvenLogo.jfif" alt="Login"></header>
            <div>
                
                <span>We already send a verification code to your email.</span>
                <input type="text" placeholder="Enter verification code" name="authcode"><br><br>
                <input class="btn-primary" type="submit" value="Verify">
            </div>
        </form>
        </div>
        
    </body>
</html>
