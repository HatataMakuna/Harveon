<%-- 
    Document   : vertifyEmail
    Created on : Mar 13, 2022, 5:31:12 PM
    Author     : tzeha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Page</title>
    </head>
    <body>
        <span>We already send a verification code to your email.</span>
        <form action="VerifyCode">
            <input type="text" name="authcode">
            <input type="submit" value="verify">
        </form>
    </body>
</html>
