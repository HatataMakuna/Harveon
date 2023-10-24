<%-- 
    Document   : getLoginDetails
    Created on : Mar 8, 2022, 11:19:29 PM
    Author     : tzeha
--%>

<%@page import= "model.Customer" import="da.customerDA" import="control.MaintainCustomerControl" import="domain.customer" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customerDetails" scope="session" class="model.Customer"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Validation</title>
    </head>
    <body>
        <%! private MaintainCustomerControl cusControl;%>
        <% cusControl = new MaintainCustomerControl();%>
        <% String username = request.getParameter("username");%>
        <% String password = request.getParameter("password");%>
        
        <% if(username.length() == 0 || password.length() == 0) { %>
        <script>
            alert("Username and password is required !!!");
            location='CustomerLogin.html';
        </script>
        <%}%>
        
        
       <% Customer cus = cusControl.selectRecord(username);%>
         <% if((username.equals(cus.getUsername()))==true && (password.equals(cus.getPassword())==true) ){ %>
        <script>
            alert("Login Successful , Welcome !");
        </script>
        <% } else { %>
         <script>
            alert("The username or password is wrong , please try again");
            location='CustomerLogin.html';
        </script>
        <% } %>       
        
    </body>
</html>
