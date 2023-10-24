<%-- 
    Document   : DisplayOrderHistory
    Created on : Mar 20, 2022, 12:14:46 AM
    Author     : 1darr
--%>
<%@page import="java.util.List"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<OrderProduct> OrderProductList = (List) session.getAttribute("OrderProductList");
    List<Payment> PaymentList = (List) session.getAttribute("PaymentList");
    List<Product> ProductList = (List) session.getAttribute("ProductList");
    List<Customer> CustomerList = (List) session.getAttribute("CustomerList");
    List<OrderDetails> OrderDetailsList = (List) session.getAttribute("OrderDetailsList");
    java.text.DateFormat df = new java.text.SimpleDateFormat("dd-MM-yyyy");
%>
<%Customer cus = (Customer) session.getAttribute("currentCus");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
    </head>
    <body>
        <style>
            * {
                box-sizing: border-box;
            }

            line::after {
                display: block;
                content: '';
                width: 35%;
                height: 1.5px;
                background: black;
                position: center;
                bottom: 0;
                left: 0;
            }

            .rate {
                float: none;
                height: 50px;
                padding: 0 130px;
            }
            .rate:not(:checked) > input {
                position:absolute;
                top:-9999px;
            }
            .rate:not(:checked) > label {
                float:right;
                width:1em;
                overflow:hidden;
                white-space:nowrap;
                cursor:pointer;
                font-size:35px;
                color:#ccc;
            }
            .rate:not(:checked) > label:before {
                content: '★ ';
            }
            .rate > input:checked ~ label {
                color: #ffd84d;
            }
            .rate:not(:checked) > label:hover,
            .rate:not(:checked) > label:hover ~ label {
                color: #ffcd1a;
            }
            .rate > input:checked + label:hover,
            .rate > input:checked + label:hover ~ label,
            .rate > input:checked ~ label:hover,
            .rate > input:checked ~ label:hover ~ label,
            .rate > label:hover ~ input:checked ~ label {
                color: #ffc800;
            }
            <%--
            th, td {
                border:1px solid black;
            }
            --%>
        </style>
        <%int dlist = 0;
            int olist = 0;
            String username = "";
            String prodID = "";%>
        <h1><center><line style="position: relative">Order History</line></center></h1>
        <div style="margin-left:50px; margin-right:50px;">
            <div style="width: 65%; float: left; padding: 20px;">
                <table style="width: 100%">
                    <% for (OrderProduct orderProduct : OrderProductList) {%>
                    <%if (orderProduct.getUsername().getUsername() == cus.getUsername()) {%>
                    <tr>
                        <td>
                            <table style="width:100%; height: 50px; background-color:rgba(235,235,235);" onclick="myFunction(this.id)" id="<%=olist%>" class="list">
                                <tr>
                                    <td style="width: 30%"><div style="margin-left: 60px">#<%=orderProduct.getOrderId()%></div></td>
                                    <td style="width: 25%"><%= df.format(orderProduct.getOrderDate())%></td>
                                    <td style="width: 25%">Statue: <%=orderProduct.getStatus()%></td>
                                    <td style="width: 20%">RM&nbsp;<%=orderProduct.getTotalPrice()%></td>
                                </tr>
                            </table>
                            <br>
                            <%olist++;%>
                        </td>
                    </tr>
                    <% }%>
                    <% }%>
                </table>
            </div>
            <% for (OrderProduct orderProduct : OrderProductList) {%>
            <%if (orderProduct.getUsername().getUsername() == cus.getUsername()) {%>
            <div id="d<%=dlist%>" name="<%=dlist%>" style="width: 26%; float: left; padding: 20px; display: none; position:fixed; top:10; right:85px;">
                <table style="width: 100%; background-color:rgba(204,204,204);">
                    <tr>
                        <th colspan="2" style="height: 40px">Order Details</th>
                    </tr>
                    <tr>
                        <td style="height: 35px; width: 50%"><div style="margin-left: 60px">Statue</div></td>
                        <td><div style="margin-left: 20px"><%=orderProduct.getStatus()%></div></td>
                    </tr>
                    <tr>
                        <td style="height: 35px; width: 50%"><div style="margin-left: 60px">Order ID</div></td>
                        <td><div style="margin-left: 20px">#<%=orderProduct.getOrderId()%></div></td>
                    </tr>
                    <tr>
                        <td style="height: 35px; width: 50%"><div style="margin-left: 60px">Date</div></td>
                        <td><div style="margin-left: 20px"><%= df.format(orderProduct.getOrderDate())%></div></td>
                    </tr>
                    <tr>
                        <td style="height: 35px; width: 50%"><div style="margin-left: 60px">Payment</div></td>
                        <td><div style="margin-left: 20px">
                                <% for (Payment payment : PaymentList) { %>
                                <% if (orderProduct.getPaymentId().getPaymentId().toString() == payment.getPaymentId().toString()) {%>
                                <%=payment.getPaymentMethod()%>
                                <% }%>
                                <% }%>
                            </div></td>
                    </tr>
                    <tr>
                        <td colspan="2"><br></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="background-color:rgba(255,255,255);"></td>
                    </tr>
                </table>
                <table style="width: 100%; background-color:rgba(204,204,204);">
                    <tr>
                        <td style="height: 35px; width: 50%"><div style="margin-left: 60px">Product Name:</div></td>
                        <td><div style="margin-left: 20px">
                                <% for (OrderDetails orderDetails : OrderDetailsList) { %>
                                <% if (orderProduct.getOrderId().toString() == orderDetails.getOrderProduct().getOrderId().toString()) {%>
                                <% for (Product product : ProductList) { %>
                                <% if (product.getProdId().toString() == orderDetails.getProduct().getProdId().toString()) {%>
                                <%=product.getProdName()%>
                                <% }%>
                                <% }%>
                                <% }%>
                                <% }%>
                            </div></td>
                    </tr>
                    <tr>
                        <td style="height: 35px; width: 50%"><div style="margin-left: 60px">Quantity</div></td>
                        <td><div style="margin-left: 20px">
                                <% for (OrderDetails orderDetails : OrderDetailsList) { %>
                                <% if (orderProduct.getOrderId().toString() == orderDetails.getOrderProduct().getOrderId().toString()) {%>
                                <%username = orderDetails.getOrderProduct().getUsername().getUsername();%>
                                <%prodID = orderDetails.getProduct().getProdId();%>
                                <%=orderDetails.getQuantity()%>
                                <% }%>
                                <% }%>
                            </div></td>
                    </tr>
                    <tr>
                        <td style="height: 35px; width: 50%"><div style="margin-left: 60px">RM</div></td>
                        <td><div style="margin-left: 20px"><%=orderProduct.getTotalPrice()%></div></td>
                    </tr>
                    <tr>
                        <td colspan="2"><div style="margin-left: 60px; height:30px"><button onclick="showDialog(this.id)" id="<%=username%>" name="<%=prodID%>" style="width:230px">Comment this product</button></div></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="background-color:rgba(255,255,255);"></td>
                    </tr>
                </table>
                <table style="width: 100%; background-color:rgba(204,204,204);">
                    <tr>
                        <td style="height: 35px;"><div style="margin-left: 60px">Receiver</div></td>
                    </tr>
                    <tr>
                        <td style="height: 20px;"><div style="margin-left: 60px"><%=orderProduct.getUsername().getUsername()%></div></td>
                    </tr>
                    <tr>
                        <td style="height: 20px;"><div style="margin-left: 60px">
                                <% for (Customer customer : CustomerList) { %>
                                <% if (orderProduct.getUsername().getUsername().toString() == customer.getUsername().toString()) {%>
                                <%=customer.getPhone()%>
                                <% }%>
                                <% }%>
                            </div></td>
                    </tr>
                    <tr>
                        <td style="height: 20px;"><div style="margin-left: 60px">
                                <% for (Customer customer : CustomerList) { %>
                                <% if (orderProduct.getUsername().getUsername().toString() == customer.getUsername().toString()) {%>
                                <%=customer.getAddress()%>
                                <% }%>
                                <% }%>
                            </div></td>
                    </tr>
                    <tr>
                        <td style="height: 20px;"><div style="margin-left: 60px"></div></td>
                    </tr>
                </table>
                <%dlist++;%>
            </div>
            <% }%>
            <% }%>
        </div>
        <dialog id="xxx" style="width:50%;height:350px;background-color:#F4FFEF;border:1px dotted black;margin-top:100px">

            <form action="addRatingComment">
                <button id="close" type="reset" style="float: right; border: none; background-color:#F4FFEF; cursor: pointer;">X</button>
                <table style="width:60%;margin-left:auto;margin-right:auto">
                    <tr>
                        <td><input type="hidden" type="text" id="username" name="username" value="a"></td>
                    </tr>
                    <tr>
                        <td><input type="hidden" type="text" id="PID" name="PID" value="a"></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="rate">
                                <input type="radio" id="star5" name="rate" value="5"/>
                                <label for="star5" title="text">5 stars</label>
                                <input type="radio" id="star4" name="rate" value="4"/>
                                <label for="star4" title="text">4 stars</label>
                                <input type="radio" id="star3" name="rate" value="3"/>
                                <label for="star3" title="text">3 stars</label>
                                <input type="radio" id="star2" name="rate" value="2"/>
                                <label for="star2" title="text">2 stars</label>
                                <input type="radio" id="star1" name="rate" value="1" checked/>
                                <label for="star1" title="text">1 star</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><div><textarea cols="55" rows="12" name="comment" placeholder="Comment..."></textarea></div></td>
                    </tr>
                    <tr>
                        <td><button type="submit" style="float: right">Submit</button></td>
                    </tr>
                </table>
                <!--<b<button id="close">Close</button>utton onclick="getStar()">Submit</button><input type="reset" value="Reset">-->
            </form>
        </dialog>
        <script>
            function myFunction(id) {
                var oList = document.getElementById(id);
                var y = document.getElementsByClassName("list");
                var dList = document.getElementById("d" + id);
                if (dList.style.display === "none") {
                    for (var i = 0; i < y.length; i++) {
                        var dList = document.getElementById("d" + i);
                        dList.style.display = "none";
                    }
                    var dList = document.getElementById("d" + id);
                    dList.style.display = "block";
                } else {
                    dList.style.display = "none";
                }
            }
        </script>
        <script>
            function showDialog(username) {
                var dialog = document.getElementById("xxx");
                //document.getElementById("xxx").className = id;
                //var name = document.getElementById("xxx").className;
                //alert(name);
                document.getElementById("username").value = username;
                var c = document.getElementById(username);
                document.getElementById("PID").value = c.name;
                //alert(c.name);
                dialog.show();
                document.getElementById("close").onclick = function () {
                    dialog.close();
                };
            }
        </script>
    </body>
</html>