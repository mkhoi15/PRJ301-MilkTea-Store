<%-- 
    Document   : usPage
    Created on : May 29, 2023, 11:06:54 AM
    Author     : ADMIN
--%>

<%@page import="sample.user.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Us Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="./assets/fonts/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->	
    </head>
    <body>
        <section class="vh-100" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-12 col-xl-4">

                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body text-center">
                                <div class="mt-3 mb-4">
                                    <img src="./assets/img/user.jpg"
                                         class="rounded-circle img-fluid" style="width: 100px;" />
                                </div>
                                <c:url var="logoutLink" value="MainController" >
                                    <c:param name="action" value="Logout"></c:param>
                                </c:url>
                                <h4 class="mb-2">${LOGIN_USER.fullName}</h4>
                                <p class="text-muted mb-4">${LOGIN_USER.roleID}</p>
                                <div class="mb-4 pb-2">

                                </div>
                                <a href="MainController?action=ShoppingPage">
                                    <button type="button" class="btn btn-primary btn-rounded btn-lg">Shopping</button>
                                </a>
                                <c:url var="logoutLink" value="MainController" >
                                    <c:param name="action" value="Logout"></c:param>
                                </c:url>
                                <a href="${logoutLink}" class="logout">
                                    <button type="submit" value="Logout" class="btn btn-primary btn-rounded btn-lg">Log Out</button>
                                </a>
                                <div class="d-flex justify-content-center text-center mt-5 mb-2">
                                    <div>
                                        <p class="mb-2 h5">Welcome to amour</p>
                                        <img src="./assets/img/my_logo.png">
                                    </div>    
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </body>

</html>

