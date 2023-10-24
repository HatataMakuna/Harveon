<%-- 
    Document   : getRegistrationDetails
    Created on : Mar 7, 2022, 2:05:34 PM
    Author     : tzeha
--%>    
<%@page import="javax.persistence.*"%>
<%@page import="model.CustomerService"%>
<%@page import="model.Customer" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customerDetails" scope="session" class="model.Customer"/>
<jsp:setProperty name="customerDetails" property="*"/>  

<!DOCTYPE html>
<html class="d-flex" style="background:url('../picture/registerBackground.jpg') no-repeat center;background-size:cover;min-height: 100%;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Details</title>
         <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <style>
            .container{
                background-color:#0A0A0A;
                width:40%;
                margin:auto;
                border:1px solid black;
                border-radius:10px;
                padding:2%;
            }
        </style>
    </head>
    <body class="d-flex" style="color: white; text-align: center;width:100%;background: rgba(255,255,255,0)">
        <div class="container">
        <header><img class="_picture" src="../picture/harvenLogo.jfif" alt="Login" style=" display: block; margin-left: auto;margin-right: auto;width: auto;"></header>

        <% if (customerDetails.getUsername() == null || customerDetails.getPassword() == null || customerDetails.getName() == null || String.valueOf(customerDetails.getGender()) == null || customerDetails.getIc() == null || customerDetails.getPhone() == null || customerDetails.getGmail() == null || customerDetails.getAddress() == null) { %>
        <script>
            alert("All data is requirement !!!");
            location = 'CustomerRegister.html';
        </script>  

        <% } else { %>
        <% if (customerDetails.getPassword().length() < 7) {%>
        <script>
            alert("Password Length must be more than 7!!!");
            location = 'CustomerRegister.html';
        </script> 

        <%} else {%>
        <% int digit = 0, character = 0, special = 0;
            for (int index = 0; index < customerDetails.getPassword().length(); index++) {
                if (Character.isDigit(customerDetails.getPassword().charAt(index))) {
                    digit++;
                } else if (Character.isLetter(customerDetails.getPassword().charAt(index))) {
                    character++;
                } else {
                    special++;
                }
            }
            if (digit == 0 || character == 0) {%>
        <script>
            alert("Password must be combination with digit and character");
            location = 'CustomerRegister.html';
        </script> 

        <%} else {%>
        <%String password = request.getParameter("confirmpassword");%>    
        <% if (password.equals(customerDetails.getPassword()) != true) {%>
        <script>
            alert("The password is not consistence !!!");
            location = 'CustomerRegister.html';
        </script>

        <% return;
        } else { %>
        <%Customer cus = new Customer(customerDetails.getUsername(), customerDetails.getPassword(), customerDetails.getName(), customerDetails.getGender(), customerDetails.getIc(), customerDetails.getPhone(), customerDetails.getGmail(), customerDetails.getAddress());%> 

        <% HttpSession httpSession = request.getSession();%>
        <%httpSession.setAttribute("customer", cus);%>

        <form class="d-flex flex-column" style="text-align:left; align-items:center" method="post" action="../registerValidationServlet">
            <div class="grid-container" style="width:60%;display:grid;grid-template-columns:1fr 1fr;">
                <div class="grid-item">Username</div><div class="grid-item">:<%=customerDetails.getUsername()%><br></div> 
            <div class="grid-item">Password</div><div class="grid-item">:<%=customerDetails.getPassword()%><br></div> 
            <div class="grid-item">Name</div><div class="grid-item">:<%=customerDetails.getName()%><br></div> 
            <div class="grid-item">Gender</div><div class="grid-item">:<%=customerDetails.getGender()%><br></div> 
            <div class="grid-item">IC</div><div class="grid-item">:<%=customerDetails.getIc()%><br></div> 
            <div class="grid-item">Phone</div><div class="grid-item">:<%=customerDetails.getPhone()%><br></div> 
            <div class="grid-item">Gmail</div><div class="grid-item">:<%=customerDetails.getGmail()%><br></div> 
            <div class="grid-item">Address</div><div class="grid-item">:<%=customerDetails.getAddress()%><br></div> 
            </div>
            <br>
            <input style="width:30%;padding:1%;" class="btn-primary" type="submit" value="Register">
        </form>
            </div>
        <% } %>
        <% }%> 
        <% }%> 
        <% }%> 
    </body>
</html>
