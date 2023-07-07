<%-- 
    Document   : successOrder
    Created on : Jul 6, 2023, 8:21:02 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--===============================================================================================-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <!--===============================================================================================-->
        <link rel="stylesheet" href="./assets/fonts/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" href="./assets/css/style.css">  
        <!--===============================================================================================-->
        <title>amour Milk Tea</title>
    </head>
    <body>
        <c:url var="logoutLink" value="MainController" >
            <c:param name="action" value="Logout"></c:param>
        </c:url>
        <div class="contain">
            <div class="user-logout pt-md-2 pb-md-2 pt-lg-3 pb-lg-3">
                <a href="usPage.jsp" class="user">${LOGIN_USER.fullName}</a>        
                <a href="${logoutLink}" class="logout">Logout</a>
            </div>
            <div class="success-image">
                <div class="success-text">
                    <h1 style="font-size:42px">ORDER SUCCESS</h1>
                    <form action="MainController" method="POST">
                        <button type="submit" class="btn btn-light btn-lg btn-block" name="action" value="ShoppingPage">
                            Add more
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
