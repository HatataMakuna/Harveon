<%-- 
    Document   : findPasswordSuccess
    Created on : Mar 14, 2022, 1:18:22 AM
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
                    alert("Password Already be Changed");
                 </script>
                <% } else { %>
                <script>
                    alert("Unable to change password");
                </script>
                <% } %>
    </body>
</html>
