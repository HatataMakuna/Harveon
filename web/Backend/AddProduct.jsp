<%-- 
    Document   : AddProduct
    Created on : Apr 2, 2022, 3:31:22 AM
    Author     : nocry
--%>

<%@page import="model.SubImage"%>
<%@page import="model.Specification"%>
<%@page import="model.ProductSpecification"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="productDetails" scope="session" class="model.Product"/>
<jsp:include page="../LoadAllSpec"/>
<jsp:include page="../LoadAllImage"/>
<%String user = (String) session.getAttribute("user");%>


<!DOCTYPE html>
<html>
    <head><meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="../themefisherFont/style.css">
        <script src="../jquery/dist/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <style>
            .sidebar {
                height: 100%;
                width: 200px;
                position: fixed;
                top: 0;
                left: 0;
                background-color: #143649; 
            }
            .sidebar a{
                color: white;
            }

            li a:hover{
                color: black;
                background-color: white;
            }
            .searchfield{
                position: fixed;
                background-color: #E0E0E0;
                box-sizing: border-box;
                width: 100%;
                padding: 10px 15px;
            }

            input[type=text], select {
                padding: 5px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                
            }

            #submitS {
                background-color: #003366;
                color: white;
                padding: 5px 10px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            #submitS:hover {
                background-color: #0066cc;
            }
            .main{
                margin-left: 200px;
                height: 100vh;
                padding-bottom: 10px;
                padding-left: 20px;
                padding-right: 10px;
                padding-top: 75px;

            }
            button{
                padding:8px;
            }
            button:hover{
                background-color: #555555;
                color: white;
            }
            table.main{
                width: 80%;
                padding-top: 2%;
                padding-left: 2%;
            }
            tr.main:nth-child(odd){
                background-color: #CCCCCC;
            }
            th.main,td.main{
                padding-top: 1%;
                padding-bottom: 1%;
                padding-left: 1%;
            }

            .dropdown:hover .dropdown-menu{
                display: block;
            }

            .dropdown-menu {
                margin: auto;
                color: white;
                background-color: #143649;
            }
            .dropdown-toggle {
                margin: auto;
            }
            .navbar .dropdown-toggle,
            .nav-tabs .dropdown-toggle {
                margin: auto;
            }
            .grid-container{
                display:grid;
                grid-template-columns: 1fr 2fr;
                grid-row-gap:10px;
                padding:3% 2%;
                place-items:center;
            }
            .grid-item,.grid-item input{
                width:100%;
            }
            .card{
                width:40%;
            }
            input[type=number],textarea{
                border:1px solid #ccc !important;
            }
        </style>
        <title>Product</title>

    </head> 
    <body style="background-color: #EDEDEE">
        <%List<Specification> specList = (List<Specification>)session.getAttribute("specList"); %>
        <%List<SubImage> imageList = (List<SubImage>)session.getAttribute("imageList"); %>
        <div class="sidebar w3-sidebar" >
            <img src="../picture/harvenLogo.jfif" alt="HARVEN" width="100%" height="200px">
            
            <ul class="nav nav-pills flex-column" >
                <li class="nav-item">
                    <a href="ViewOrderStatus.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#home"/></svg>
                        Order
                    </a>
                </li>
                <li class="nav-item">
                    <a href="ViewSalesRecords.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                        Sale
                    </a>
                </li>
                <li class="nav-item">
                    <a href="AllProduct_Backend.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#table"/></svg>
                        Product
                    </a>
                </li>
                <li class="nav-item">
                    <a href="../AdminShowRatingComment" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#grid"/></svg>
                        Rating & Comment
                    </a>
                </li>
                <li class="nav-item">
                    <a href="ViewCustomerRecords.jsp" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                        Customer
                    </a>
                </li>
                <li class="nav-item">
                    <a href="../GetStaffDetails" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                        Staff
                    </a>
                </li>
                <li class="nav-item dropdown" style="padding-left: 20px;">
                    <a class="nav-link  dropdown-toggle" data-toggle="dropdown">  Report  
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" style="padding-left: 20px;">
                        <li><a class="dropdown-item" href="SalesReport.jsp"> Sales Report </a></li>
                        <li><a class="dropdown-item" href="ProductReport.jsp"> Product Report </a></li>
                        <li><a class="dropdown-item" href="customerReport.jsp"> Customer Report </a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div>
            <nav class="TopNavigation" style="margin-left:200px">
                <div class="searchfield">
                    <table>
                        <tr>
                            <td><p style="padding-left: 1135px;padding-top: 15px;"><%=user%></p></td>
                            <td><img src="../picture/people-outline.svg" alt="userIcon.png" style="margin-left: 20px; width: 30px ; height: 30px" ></td>
                        </tr>
                    </table>
                </div>
            </nav>
        </div>
        <div class="main">
            <h1>Add Product</h1>
            <br/>
            <div>
                <form id="add" action="../AddProduct" method="POST" enctype="multipart/form-data">
                    <div class="card">
                    <div class="grid-container card-body">
                        <div class="grid-item">ID</div>
                        <div class="grid-item"><input type="text" name="prodId" required/></div>
                        <div class="grid-item">Name</div>
                        <div class="grid-item"><input type="text" name="prodName" required/></div>
                        <div class="grid-item">Price</div>
                        <div class="grid-item"><input type="number" name="price" required/></div>
                        <div class="grid-item">Description</div>
                        <div class="grid-item"><textarea style="width:100%;" name="description" required/></textarea></div>
                        <div class="grid-item">Stock</div>
                        <div class="grid-item"><input type="number" name="stock" required/></div>
                        <div class="grid-item">Image</div>
                        <div class="grid-item d-flex flex-row">
                            <div data-toggle="modal" data-target="#modal-image">
                                <input placeholder="Click to select" id="main_image" type="text" name="mainImage" readonly required/>
                            </div>
                        </div>
                        </div>
                    <div class="card-footer text-center">
                    <button type="submit">Submit</button>
                    </div>
                    </div>
                </form>
                
                </div>
            </div>
                    <style>
                        .image-option{
                            width:18%;
                            aspect-ratio:1/1;
                        }
                    </style>  
               <div class="modal fade show" id="modal-image" aria-hidden="true">
                   <div class="modal-dialog" style="max-width:none;width:70%;">
                    <div class="modal-content">
                        <div class="modal-header"><h4 class="modal-title">Select Images</h4></div>
                        <div class="modal-body d-flex flex-row" style="flex-wrap:wrap;column-gap:1%">
                            <% SubImage image;
                                for(int i = 0;i<imageList.size();i++) { 
                                    image = imageList.get(i);
                            %>
                            <div class="image-option">
                            <input onclick="selectImage(this)" class="image" style="height:100%;" value="<%=image.getImageUrl()%>" type="image" src="<%=image.getImageUrl()%>">
                            </div>
                            <% } %>
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button onclick="confirmImage()" data-dismiss="modal">Confirm</button>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    <script>
        
          function confirmImage(){
               var activeImages = document.getElementsByClassName('selected');
              if(activeImages.length > 0){
                  document.getElementById("main_image").value = activeImages[0].value;
              }
          }
          function selectImage(elem) {
              var activeImages = document.getElementsByClassName('selected');
              if(elem.classList.contains('selected')){
                  elem.classList.remove('selected')
              }
              else{
                  if(activeImages.length > 0){
                  activeImages[0].classList.remove('selected')
              }
                  elem.classList.add('selected')
              }
          }
          
          $('#add').submit(function (e) {
              if(document.getElementById("main_image").value == null || document.getElementById("main_image").value == ""){
                  alert("Please select an image");
                  e.preventDefault(); //Prevent the submit from happening
              }
          });
          
          
</script>
</body>
</html>
