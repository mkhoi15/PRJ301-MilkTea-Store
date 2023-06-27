<%-- 
    Document   : admin
    Created on : May 29, 2023, 11:16:01 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIn Page</title>      
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/fonts/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="./assets/css/table.css">
    </head>
    <body>
        <!--Phân quyền-->
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>

        <!--Log out-->
        <c:url var="logoutLink" value="MainController" >
            <c:param name="action" value="Logout"></c:param>
        </c:url>

        <div class="user-logout pt-md-2 pb-md-2 pt-lg-3 pb-lg-3">
            <p class="user">${LOGIN_USER.fullName}</p>        
            <a href="${logoutLink}" class="logout">Logout</a>
        </div>


        <!--Search Button-->
        <form action="MainController">
            <div class="d-flex justify-content-center">
                <div class="input-group w-25 mt-4 pt-lg-1 ">
                    <input type="text" name="search" value="${param.search}" class="form-control rounded" placeholder="Search" />
                    <button type="submit" name="action" value="Search" class="btn btn-outline-primary">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
        </form>






        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Users</b></h2>
                            </div>

                        </div>
                    </div>
                    <c:if test="${requestScope.LIST_USER != null}">
                        <c:if test="${not empty requestScope.LIST_USER}">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>User ID</th>
                                        <th>Full Name</th>
                                        <th>Role ID</th>
                                        <th>Password</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                                    <form action="MainController" method="POST">
                                        <tr>
                                            <td> 
                                                ${counter.count}
                                            </td>
                                            <td> 
                                                <input type="text" name="userID" value="${user.userID}" readonly="" />
                                            </td>
                                            <td> 
                                                <input type="text" name="fullName" value="${user.fullName}" required="" />           
                                            </td> 
                                            <td>
                                                <input type="text" name="roleID" value="${user.roleID}" required=""/>
                                            </td>  
                                            <td>${user.password}</td>>
                                            <!--Update here-->
                                            <td>
                                                <input type="hidden" name="search" value="${param.search}" />
                                                <button class="btn btn-warning btn-g px-2" type="submit" name="action" value="Update">Update</button>
                                            </td> 
                                            <!--Delete here-->
                                            <td>
                                                <c:url var="deleteLink" value="MainController" >
                                                    <c:param name="action" value="Delete"></c:param>
                                                    <c:param name="search" value="${param.search}"></c:param>
                                                    <c:param name="userID" value="${user.userID}"></c:param>
                                                </c:url>
                                                <a href="${deleteLink}" class="delete" ><i
                                                        class="material-icons"  title="Delete">&#xE872;</i></a>
                                            </td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </c:if>   
                    ${requestScope.ERROR}
                    </body>
                    </html>
