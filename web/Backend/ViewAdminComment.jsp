<%-- 
    Document   : ViewAdminComment
    Created on : Apr 7, 2022, 7:29:37 PM
    Author     : 1darr
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.*"%>
<%
    List<AdminRatingComment> AdminRatingCommentList = (List) session.getAttribute("AdminRatingCommentList");
    String asd = "";
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
                width: 20%;
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
            .main{
                margin-left: 20%;
                padding-bottom: 1%;
                padding-left: 2%;
                padding-right: 1%;
                padding-top: 2%;
                background-color: #EDEDEE;
            }
            table{
                width: 80%;
                padding-top: 2%;
                padding-left: 2%;
            }
            tr:nth-child(odd){
                background-color: #CCCCCC;
            }
            th,td{
                padding-top: 1%;
                padding-bottom: 1%;
                padding-left: 1%;
            }
            <%--
            th, td {
                border:1px solid black;
            }
            --%>
        </style>
        <title>Rating and Comment</title>

    </head> 
    <body>
        <div class="sidebar w3-sidebar" >
            <img src="../Assignment'/logo.png" alt="HARVEN" width="40" height="32">

            <ul class="logo"> </ul>
            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#"/></svg>
                        Home
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#"/></svg>
                        Staff
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#"/></svg>
                        Orders
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#"/></svg>
                        Products
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <svg class="bi me-1" width="16" height="16"><use xlink:href="#"/></svg>
                        Customers
                    </a>
                </li>
            </ul>
        </div>
        <div class="main">
            <h1>Rating and Comment - Staff</h1>
        </div>
        <ul id="docs-nav-pills" class="nav nav-pills mb-4" role="tablist" style="margin-left: 350px; margin-top: 30px">
            <li class="nav-item">
                <a class="btn btn-light active" data-mdb-toggle="tab" href="../AdminShowRatingComment" role="tab" aria-selected="true">Customer</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-secondary" data-mdb-toggle="tab" href="../ShowAdminComment" role="tab" aria-selected="false">Staff</a>
            </li>
        </ul>
        <% String s = "a";%>
        <div>
            <table id="dtBasicExample" class="table table-striped table-bordered table-sm" style="margin-top: 30px; margin-left: 350px;width: 75%">
                <tr>
                    <th style="width:110px"><div style="margin-left: 9px">RID</div></th>
                    <th><div style="margin-left: 12px">Comment</div></th>
                    <th style="width:90px;"></th>
                </tr>
                <% for (AdminRatingComment adminRatingComment : AdminRatingCommentList) {%>
                <tr>
                    <td style="width:110px;"><div style="margin-left: 9px"><%=adminRatingComment.getRatingCommentId().getRatingCommentId()%></div></td>
                    <td><div style="margin-left: 12px"><%=adminRatingComment.getComment()%></div></td>
                    <th style="width:90px;"><div style="margin-left: 14px"><button type="button" id="<%=adminRatingComment.getId()%>" onclick="showDialog(this.id)" name="<%=adminRatingComment.getComment()%>" class="btn btn-sm btn-warning">View</button></div></th>
                </tr>
                <% }%>
            </table>
        </div>
        <div>
            <div id="myModal" class="modal fade" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title"><asd></asd></h5>
                            <button type="button" style="border:none; background-color: white" data-bs-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form action="">
                                <textarea class="form-control" id="comment" name="comment" value="asd" style="height:200px" disabled></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" onclick="confirmation(this.name)" id="temp" name="temp" data-bs-dismiss="modal">Delete</button>
                            <!--<button type="button" class="btn btn-primary" onclick="editRecord(this.name)" id="temp1" name="temp1" data-bs-dismiss="modal">Edit</button>-->
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--
    <div>
        <div id="editRecord" class="modal fade" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit</h5>
                        <button type="button" style="border:none; background-color: white" data-bs-dismiss="modal">&times;</button>
                    </div>
                    <form action="../EditAdminComment">
                        <div class="modal-body">
                            <input type="hidden" type="text" id="staff" name="staff" value="S0001">
                            <input type="hidden" type="text" id="rtID" name="rtID" value="a">
                            <input type="hidden" type="text" id="AID" name="AID" value="a">
                            <textarea class="form-control" id="comment" name="comment" value="asd" style="height:200px"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Edit</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
        -->
        <div>
            <div id="confirmation" class="modal fade" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Confirm Delete <asd></asd> ?</h5>
                            <button type="button" style="border:none; background-color: white" data-bs-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-footer">
                            <form action="../DeleteAdminComment">
                                <input type="hidden" type="text" id="deleteID" name="deleteID" value="a">
                                <button type="submit" class="btn btn-primary">Yes</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            </form>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function showDialog(id) {
                $("asd").text(id);
                $(document).ready(function () {
                    $("#myModal").modal('show');
                });
                //document.getElementById("rid").value = id;
                //var a = document.getElementById(id);
                //alert(a.name);
                document.getElementById("comment").value = document.getElementById(id).name;
                document.getElementById("temp").name = id;
                document.getElementById("temp1").name = id;
            }
            function confirmation(id) {
                $(document).ready(function () {
                    $("#confirmation").modal('show');
                });
                document.getElementById("deleteID").value = id;
            }

            //function editRecord(id) {
            //    $(document).ready(function () {
            //        $("#editRecord").modal('show');
            //    });
            //    document.getElementById("AID").value = id;
            //    document.getElementById("rtID").value = "RID1001";
            //}

        </script>
    </body>
</html>

