<%-- 
    Document   : AdminRatingComment
    Created on : Apr 7, 2022, 7:29:37 PM
    Author     : 1darr
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.*"%>
<%String user = (String) session.getAttribute("user");%>
<%
    List<RatingComment> RatingCommentList = (List) session.getAttribute("RatingCommentList");
%>
<!--等staff pass value过来-->
<!DOCTYPE html>
<html>
    <head><meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
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
                position: sticky;
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
                padding-bottom: 10px;
                padding-left: 20px;
                padding-right: 10px;
                padding-top: 20px;
            }
            button{
                padding:10px;
            }
            button:hover{
                background-color: #555555;
                color: white;
            }
            table{
                width: 80%;
                padding-top: 2%;
                padding-left: 2%;
            }
            .info tr:nth-child(odd){
                background-color: #CCCCCC;
            }
            th,td{
                padding-top: 1%;
                padding-bottom: 1%;
                padding-left: 1%;
            }
            
            button{
                padding:10px;
            }
            button:hover{
                background-color: #555555;
                color: white;
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
            
        </style>
        <title>Rating and Comment</title>

    </head> 
    <body style="background-color: #EDEDEE">
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
             <h1>Rating and Comment - Customer</h1>
        </div>
        <ul id="docs-nav-pills" class="nav nav-pills mb-4" role="tablist" style="margin-left: 350px; margin-top: 30px">
            <li class="nav-item">
                <a class="btn btn-secondary" href="../AdminShowRatingComment">Customer</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-light active" href="../ShowAdminComment">Staff</a>
            </li>
        </ul>
        <div>
            <table id="dtBasicExample" class="table table-striped table-bordered table-sm" style="margin-top: 50px; margin-left: 250px;width: 75%">
                <tr>
                    <th style="width:60px"><div style="margin-left: 9px">ID</div></th>
                    <th style="width:110px;">Prod ID</th>
                    <th style="width:160px;">Username</th>
                    <th style="width:90px;">Rating</th>
                    <th>Comment</th>
                    <th style="width:90px;"></th>
                </tr>
                <% for (RatingComment ratingComment : RatingCommentList) {%>
                <tr>
                    <td style="width:90px;"><%=ratingComment.getRatingCommentId()%></td>
                    <td style="width:110px;"><%=ratingComment.getProductId().getProdId()%></td>
                    <td style="width:160px;"><%=ratingComment.getUsername().getUsername()%></td>
                    <td style="width:90px"><div style="margin-left: 9px"><%=ratingComment.getRating()%></div></td>
                    <td><div style="margin-left: 12px"><%=ratingComment.getComment()%></div></td>
                    <th style="width:90px;"><div style="margin-left: 9px"><button type="button" id="<%=ratingComment.getRatingCommentId()%>" onclick="showDialog(this.id)" class="btn btn-primary btn-sm">Reply</button></div></th>
                </tr>
                <% }%>
            </table>
        </div>
        <div>
            <div id="myModal" class="modal fade" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Comment</h5>
                            <button type="button" style="border:none; background-color: white" data-bs-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form action="../addAdminComment">
                                <input type="hidden" type="text" id="rid" name="rid" value="a">
                                <textarea class="form-control" name="comment" style="height:200px"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Reply</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function showDialog(id) {
                $(document).ready(function () {
                    $("#myModal").modal('show');
                });
                document.getElementById("rid").value = id;

            }
        </script>
    </body>
</html>

