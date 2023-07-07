<%-- 
    Document   : viewCart
    Created on : Jun 15, 2023, 10:24:21 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.shopping.Tea"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <!--===============================================================================================-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <!--===============================================================================================-->
        <link rel="stylesheet" href="./assets/fonts/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" href="./assets/css/style.css">   
        <!--===============================================================================================-->
    </head>
    <body>
        <c:choose>
            <c:when test="${not empty sessionScope.LOGIN_USER}">
                <!--Logged in--> 
                <c:url var="logoutLink" value="MainController" >
                    <c:param name="action" value="Logout"></c:param>
                </c:url>
                <div class="contain">
                    <div class="user-logout pt-md-2 pb-md-2 pt-lg-3 pb-lg-3">
                        <a href="usPage.jsp" class="user">${LOGIN_USER.fullName}</a>        
                        <a href="${logoutLink}" class="logout">Logout</a>
                    </div>
                </div>

            </c:when>
            <c:otherwise>
                <div class="user-logout pt-md-2 pb-md-2 pt-lg-3 pb-lg-3">
                    <a href="login.html" class="user">Log In</a>        
                    <a href="MainController?action=CreatePage" class="logout">Sign Up</a>
                </div>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${not empty sessionScope.CART}">
                <!--Have Cart-->
                <section class="h-100 gradient-custom">
                    <div class="container py-5">
                        <div class="row d-flex justify-content-center my-4">
                            <div class="col-md-8">
                                <div class="card mb-4">
                                    <c:if test="${sessionScope.CART != null}">
                                        <div class="card-header py-3">
                                            <h5 class="mb-0">Cart - ${sessionScope.CART.getCart().size()} items</h5>
                                        </div>
                                        <div class="card-body">
                                            <!-- Single item -->
                                            <c:set var="total" value="${0}"></c:set>
                                            <c:forEach var="item" varStatus="counter" items="${sessionScope.CART.getCart().values()}">
                                                <c:set var="product" value="${item}"/>
                                                <c:set var="total" value="${total + (item.getPrice() * item.getQuantity())}"></c:set>
                                                    <form action="MainController" mothod="POST">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                                                <!-- Image -->
                                                                <div class="bg-image hover-overlay hover-zoom ripple rounded"
                                                                     data-mdb-ripple-color="light">
                                                                    <img src="${product.imgPath}"
                                                                     class="w-100" alt="${product.name}" />
                                                                <a href="#!">
                                                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                                                                </a>
                                                            </div>
                                                            <!-- Image -->
                                                        </div>

                                                        <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                                            <!-- Data -->
                                                            <p><strong>${product.name}</strong></p>
                                                            <input type="hidden" name="id" value="${product.id}" readonly="">
                                                            <p><strong>Price: ${product.price}$</strong></p>
                                                            <button type="submit" class="btn btn-primary btn-sm me-1 mb-2" name="action" value="Remove"
                                                                    data-mdb-toggle="tooltip" title="Remove item">
                                                                <i class="fa fa-trash"></i>
                                                            </button>
                                                            <button type="button" class="btn btn-danger btn-sm mb-2" data-mdb-toggle="tooltip"
                                                                    title="Move to the wish list">
                                                                <i class="fa fa-heart-o"></i>
                                                            </button>
                                                            <!-- Data -->
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                                            <!-- Quantity -->
                                                            <div class="d-flex mb-4" style="max-width: 300px">
                                                                <div class="form-outline">
                                                                    <input id="form1" min="1" name="quantity" value="${product.quantity}" type="number" class="form-control" />
                                                                    <label class="form-label" for="form1">Quantity</label>
                                                                </div>

                                                                <!--Edit-->
                                                                <button class="btn btn-primary btn-lg h-50" type="submit" name="action" value="Edit">Edit</button>
                                                                <!--Edit-->
                                                            </div>
                                                            <!-- Quantity -->

                                                            <!-- Price -->
                                                            <p class="text-start text-md-right">
                                                                <strong>Total: ${product.getPrice() * product.getQuantity()}$</strong>
                                                            </p>
                                                            <!-- Price -->
                                                        </div>
                                                    </div>
                                                    <!-- Single item -->

                                                    <hr class="my-4" />
                                                </form>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:if>
                                <div class="card mb-4 mb-lg-0">
                                    <div class="card-body">
                                        <p><strong>We accept</strong></p>
                                        <img class="me-2" width="45px"
                                             src="./assets/img/icons/icon-pay-02.png"
                                             alt="Visa" />
                                        <img class="me-2" width="45px"
                                             src="./assets/img/icons/icon-pay-03.png"
                                             alt="Mastercard" />
                                        <img class="me-2" width="45px"
                                             src="./assets/img/icons/icon-pay-04.png"
                                             alt="American Express" />
                                        <img class="me-2" width="45px"
                                             src="./assets/img/icons/icon-pay-01.png"
                                             alt="PayPal acceptance mark" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card mb-4">
                                    <div class="card-header py-3">
                                        <h5 class="mb-0">Summary</h5>
                                    </div>
                                    <div class="card-body">
                                        <ul class="list-group list-group-flush">
                                            <li
                                                class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                                Products
                                                <span>${total}$</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                                Shipping
                                                <span>Gratis</span>
                                            </li>
                                            <li
                                                class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                                <div>
                                                    <strong>Total amount</strong>
                                                    <strong>
                                                        <p class="mb-0">(including VAT)</p>
                                                    </strong>
                                                </div>
                                                <span><strong>${total}$</strong></span>
                                            </li>
                                        </ul>
                                        <form action="MainController" method="POST">
                                            <button type="submit" class="btn btn-primary btn-lg btn-block" name="action" value="ShoppingPage">
                                                Add More
                                            </button>
                                            <button type="submit" class="btn btn-primary btn-lg btn-block" name="action" value="CheckOut">
                                                Go to checkout
                                            </button>
                                        </form>
                                    </div>
                                </div>
                                <c:choose>
                                    <c:when test="${not empty requestScope.MESSAGE}">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <p><strong>${requestScope.MESSAGE}</strong></p>
                                            </div>
                                        </div>
                                    </c:when>
                                </c:choose>            
                            </div>
                        </div>
                    </div>
                </section>
            </c:when>
            <c:otherwise>
                <div class="empty-image">
                    <div class="empty-text">
                        <h1 style="font-size:50px">Your Cart is Empty</h1>
                        <form action="MainController" method="POST">
                            <button type="submit" class="btn btn-light btn-lg btn-block" name="action" value="ShoppingPage">
                                Add more
                            </button>
                        </form>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>


    </body>
</html>
