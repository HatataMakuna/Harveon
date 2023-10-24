<%-- 
    Document   : SearchResult
    Created on : Mar 12, 2022, 10:35:06 AM
    Author     : nocry
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%List<Product> searchResult = (List<Product>)session.getAttribute("searchResult");%>
        <style>
            .product-box{
                display:flex;
                flex-direction: column;
                border:1px solid black;
                width:fit-content;
            }
            .product-image,.product-description{
                aspect-ratio:1/1;
                width:200px;
                border:1px solid black;
            }
            
            .product-image{
                background-size: contain;
                background-position: center;
            }
            button{
                cursor:pointer;
            }
        </style>
        <h1>Hello World!</h1>
        <form class="form-inline" action="ProcessSearch">
            <div class="input-group">
                <input name="search" class="form-control form-control-navbar" type="search" placeholder="Enter product name or id">
                <div class="input-group-append">
                    <button class="btn btn-navbar" type="submit">
                        <i class="tf-ion-android-search"></i>
                    </button>
                </div>
            </div>
        </form>
        <div style="display:flex;flex-direction: row;flex-wrap: wrap">
            <%
                Product product;
                for(int i = 0;i<searchResult.size();i++){ 
                    product = searchResult.get(i);
            %>
            <a href="DisplayProductInfo?method=GET&prodId=<%=product.getProdId()%>">
            <div class="product-box">
                <div class="product-image" style="background-image:url('<%=product.getMainImage()%>')">
                    
                </div>
                <div class="product-description">
                    <p><%=product.getProdName()%></p>
                    <span><%=product.getPrice()%></span>
                    <span><%=product.getStock()%></span>
                </div>
            </div>
            </a>
            <% } %>
        </div>
    </body>
</html>
