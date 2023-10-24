<%-- 
    Document   : emailValidation.jsp
    Created on : Mar 13, 2022, 11:21:47 PM
    Author     : tzeha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validation </title>
    </head>
    <body>
            <%
                boolean valid = (Boolean) session.getAttribute("valid");
                if (valid==true) {%>
                <script>
                    alert("Verification Done");
                    location='../registerServlet';
                 </script>
                <% } else { %>
                <script>
                    alert("Incorrect verification code");
                    location='CustomerRegister.html';
                </script>
                <% } %>
    </body>
</html>
