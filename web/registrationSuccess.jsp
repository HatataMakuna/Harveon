<%-- 
    Document   : registrationSuccess
    Created on : Mar 11, 2022, 11:00:09 PM
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
                boolean success = (Boolean) session.getAttribute("success");
                if (success==true) {%>
                <script>
                    alert("Success Register");
                 </script>
                <% } else { %>
                <script>
                    alert("Unable to to register");
                </script>
                <% } %>
    </body>
</html>
