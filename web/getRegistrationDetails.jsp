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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Details</title>
    </head>
    <body style="background: black; color: white; text-align: center;">
        <header><img class="_picture" src="./picture/register.PNG" alt="Login" style=" display: block; margin-left: auto;margin-right: auto;width: auto;"></header>

        <% if (customerDetails.getUsername() == null || customerDetails.getPassword() == null || customerDetails.getName() == null || String.valueOf(customerDetails.getGender()) == null || customerDetails.getIc() == null || customerDetails.getPhone()==null || customerDetails.getGmail() == null || customerDetails.getAddress() == null) { %>
        <script>
            alert("All data is requirement !!!");
            location = 'CustomerRegister.html';
        </script>  
        <% } else { %>
        <% String password = request.getParameter("confirmpassword");%>    
        <% if (password.equals(customerDetails.getPassword()) != true) {%>
        <script>
            alert("The password is not consistence !!!");
            location = 'CustomerRegister.html';
        </script>
        <% return;
        } else { %>
        <%Customer cus = new Customer(customerDetails.getUsername(), customerDetails.getPassword(), customerDetails.getName(), customerDetails.getGender(), customerDetails.getIc(),customerDetails.getPhone(), customerDetails.getGmail(), customerDetails.getAddress());%> 

        <% HttpSession httpSession = request.getSession();%>
        <%httpSession.setAttribute("customer", cus);%>

        <form style="text-align: center;" method="post" action="registerValidationServlet">
            Username:<%=customerDetails.getUsername()%><br> 
            Password:<%=customerDetails.getPassword()%><br>
            Name:<%=customerDetails.getName()%><br>
            Gender:<%=customerDetails.getGender()%><br>
            IC:<%=customerDetails.getIc()%><br>
            Phone: <%=customerDetails.getPhone()%><br>
            Gmail:<%=customerDetails.getGmail()%><br>
            Address:<%=customerDetails.getAddress()%><br>
            <input type="submit" value="Register">
        </form>
        <% } %>
        <% }%> 
    </body>
</html>
