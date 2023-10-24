<%-- 
    Document   : cartDisplay
    Created on : Mar 27, 2022, 7:32:59 PM
    Author     : tzeha
--%>

<%@page import="javax.transaction.UserTransaction"%>
<%@page import="javax.annotation.Resource"%>
<%@page import="model.CartPK"%>
<%@page import="java.util.List"%>
<%@page import="model.Customer"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.PersistenceContext"%>
<%@page import="model.CartService"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basic Page Needs
    
      ================================================== -->

        <meta charset="utf-8" />

        <title>template</title>

        <!-- Mobile Specific Metas
    
      ================================================== -->

        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <meta name="description" content="Construction Html5 Template" />

        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=5.0"
            />

        <meta name="author" content="" />



        <!-- Themefisher Icon font -->

        <link rel="stylesheet" href="../themefisherFont/style.css" />

        <!-- bootstrap.min css -->

        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />







        <!--Jquery Confirm-->

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.0/jquery-confirm.min.css"
            />

        <!-- Main Stylesheet -->

        <!--Cust-->
        <link rel="stylesheet" href="../css/custCss.css" />

        <script
            src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
            type="text/javascript"
        ></script>

        <script src="../jquery/dist/jquery.min.js"></script>

    </head>
    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .row {
            margin-left: 0;
            margin-right: 0;
        }

        .voucher-menu input[type="text"] {
            border: #f7f7f7;
        }
        .address-list,
        .address-detail {
            padding: 1%;
        }

        .name,
        .contact {
            font-weight: 600;
        }

        /*cart-list*/
        td {
            padding: 0 1%;
        }
        .cart-check {
            width: 5%;
        }
        .cart-image {
            width: 8%;
        }
        .cart-name {
            width: 15%;
        }
        .cart-variation {
            width: 10%;
        }
        .cart-unit,
        .cart-qty,
        .cart-total,
        .cart-function {
            width: 10%;
            text-align: center;
        }

        td input,
        .item-variation,
        .product-name,
        .function div,
        .function {
            width: 100% !important;
        }

        .row {
            border-bottom: 1px dashed #e8e8e8;
            padding: 1%;
        }
        .row div {
            vertical-align: middle;
        }

        .row > div {
            padding: 1%;
        }

        .cart-list tr {
            border-bottom: 1px solid #e8e8e8;
        }

        .cart-item {
            height: 120px;
            vertical-align: middle;
        }

        /*effect bootstrap*/
        .container {
            background: white;
            margin-top: 1%;
        }

        thead tr td {
            padding: 1% !important;
        }
        tbody {
            vertical-align: top;
        }
        .table {
            margin-bottom: 0;
        }

        @media only screen and (max-width: 991px) {
            tbody .cart-check {
                width: 10%;
            }
            tbody tr .cart-image {
                width: 20%;
            }
            tbody tr .cart-name {
                width: 25%;
            }
            tbody tr .cart-variation {
                width: 20%;
            }
            tbody tr .cart-unit,
            tbody tr .cart-qty {
                width: 15%;
                text-align: left;
            }

            tbody tr .cart-total tbody tr .cart-function {
                text-align: left;
            }

            .cart-list .product-name {
                -webkit-line-clamp: 1; /* number of lines to show */
                line-clamp: 1;
            }

            .table > tbody > tr > td {
                border: 0 !important;
            }

            .delete {
                margin-top: 82px;
            }
        }

        @media only screen and (max-width: 550px) {
            .cart-list tbody tr :nth-child(2) {
                width: 30%;
            }
        }

        .delete {
            font-size: x-large;
        }
    </style>



    <body id="body">
        <!-- Main Menu Section -->
        <!--Top Message Bar-->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    Select free shipping voucher below to enjoy free shiping discount
                </div>
            </div>
        </div>
        <!--Top Message Bar-->
        <!--Middle Cart Section-->
        <form action="../orderConfirm">
        
        <div class="container">
            <div class="table-container">

                <table class="table">
                    <thead class="mobile-hide">
                        <tr>
                            <td class="cart-check">
                                <input
                                    class="select-all"
                                    type="checkbox"
                                    onclick="toggle(this)"
                                    />
                            </td>
                            <!--Select All-->
                            <td class="cart-image">Product</td>
                            <td class="cart-name"></td>
                            <td class="cart-unit">Unit Price</td>
                            <td class="cart-quantity">Quantity</td>
                            <td class="cart-total">Total Price</td>
                            <td class="cart-function">Action</td>
                        </tr>
                    </thead>

                    <tbody>
                        <% for (int index = 0; index < cartList.size(); index++) {
                                Cart cart = cartList.get(index);%>
                        <tr class="cart-item"> <!--here--><!--use tr to generate per record-->
                            <td class="cart-check">
                                <input type="checkbox" class="select-item" name="cart-check" value="<%=cart.getProduct().getProdId()%>"/>
                            </td>
                            <td class="cart-image">
                                <a href="singleProd.html"> <!--here-->
                                    <div class="image">
                                        <img src="<%=cart.getProduct().getMainImage()%>"/> <!--here-->
                                    </div>
                                </a>
                            </td>

                            <td class="mobile-row cart-name">
                                <div>
                                    <div class="product-name two-row-hidden">   <!--here-->
                                        <%=cart.getProduct().getProdName()%>
                                    </div>
                                </div>
                            </td>

                            <td class="mobile-row cart-unit">
                                RM <span class="price-text-smaller unit-price">
                                    <%=cart.getProduct().getPrice()%>

                                </span> <!--here-->
                            </td>

                            <td class="mobile-row cart-qty">
                                <div class="counter">
                                    <button
                                        type="button"
                                        class="counter-btn decrement-quantity"
                                        aria-label="Subtract one"
                                        data-direction="-1"
                                        >
                                        <span>&#8722;</span>
                                    </button>

                                    <input
                                        class="qty"
                                        data-min="1"
                                        data-max="0"
                                        type="number"
                                        pattern="[0-9]"
                                        name="quantity"
                                        value="<%=cart.getQuantity()%>"
                                        style="text-align: center"
                                        />

                                    <button
                                        type="button"
                                        class="counter-btn increment-quantity"
                                        aria-label="Add one"
                                        data-direction="1"
                                        >
                                        <span>&#43;</span>
                                    </button>
                                </div>

                                <!-- <button class="clr-btn right-btn" style="width:100%"><i class="delete tf-ion-android-delete"></i></button></div>here-->
                            </td>

                            <td class="mobile-hide cart-total">
                                RM <span class="total-price">101.50</span>
                            </td>
                            <td class="cart-function">
                                <div class="function">
                                    <div style="width: 100%">
                                        <button
                                            type="submit"
                                            name="index"
                                            class="clr-btn right-btn delete"
                                            style="width: 100%"
                                            value="<%=index%>"
                                            formaction="../deleteCart"
                                            >
                                            <i class="tf-ion-android-delete"></i>
                                        </button>                                            
                                    </div>
                                </div>


                                </div>
                                </div>
                            </td>
                        </tr>
                        <!--cart item end--> 
                        <%}%>
                    </tbody> 
                </table>



            </div>

            <!--Message below cart-->
            <div class="row">
                <div class="col-lg-12">
                    <div class="voucher-detail">
                        Lorem ipsum dolor sit amet consectetur, adipisicing elit. Mollitia,
                        corporis!
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    Up to RM 5.90 off shipping for orders over RM11.00 <a>Learn more</a>
                </div>
            </div>
            <!--Message below cart-->
        </div>

        <!--No fixed Sections-->
        <!--Sticky-->
        <div class="container buy-now-function sticky card">
            <div class="row flex-row mobile-column">
                <div class="col-lg-8 col-xs-12 flex-row">
                    <input
                        class="auto-mid-v select-all"
                        type="checkbox"
                        onclick="toggle(this)"
                        />
                    <div class="col-lg-2 col-md-2 col-xs-6 clr-btn no-padding">
                        Select All
                    </div>
                </div>

                <div class="col-lg-4 col-xs-12 flex-row" style="align-self: flex-end">
                    <div class="col-lg-7 col-xs-12 no-padding">
                        <div>
                            Total (<span id="cart-select-total">99</span> item): RM<span
                                class="price-text total-cart-price"
                                >
                                0.00</span
                            >
                        </div>
                    </div>
                    <button
                        type="submit"
                        class="btn-primary col-lg-4 col-xs-12"
                        >
                        Check Out
                    </button>
                </div>
            </div>
        </div>
    </form>

    <!--Sticky-->

    <div class="modal fade show" id="modal-confimration" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4 class="modal-title">Delete Confirmation</h4></div>
                <div class="modal-body">
                    <p>Confirm to delete Product?</p>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" id="deleteConfirm" class="btn btn-default" data-dismiss="modal" onclick="cartDelete();">Confirm</button>
                </div>
            </div>
        </div>
    </div> 


    <footer class="footer section text-center"></footer>

    <!-- 

    Essential Scripts

    =====================================-->

    <!-- Main jQuery -->

    <script src="../jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap 3.1 -->

    <script src="../bootstrap/js/bootstrap.min.js"></script>








    <!--Jquery Confirm-->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.0/jquery-confirm.min.js"></script>

    <script src="../js/custFunction.js"></script>
    <script src="../js/generalFunction.js"></script>
    <script>
                        calculateSelected();
    </script>
    <script>
        var index;
        function saveValue(elem) {
            index = elem.value;
            alert(index);
        }

        function cartDelete() {
            var location = "../deleteCart?index=" + index;
            document.location.href = location;
        }
    </script> 
</body>
</html>

