<%-- 
    Document   : admin
    Created on : May 29, 2023, 11:16:01 AM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIn Page</title>
        <!--<link rel="stylesheet" href="style.css">-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/fonts/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="./assets/css/table.css">
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }

            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>

        <blockquote class="blockquote text-center pt-lg-1 mt-4">
            <p class="mb-0">Welcome <%= loginUser.getFullName()%></p>
        </blockquote>

<!--        Welcome <%= loginUser.getFullName()%><br/>-->

        <!--Search Button-->
        <form action="MainController">
            <div class="d-flex justify-content-center">
                <div class="input-group w-25 mt-4 pt-lg-1 ">
                    <input type="text" name="search" value="<%= search%>" class="form-control rounded" placeholder="Search" />
                    <button type="submit" name="action" value="Search" class="btn btn-outline-primary">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
        </form>


        <!--        <form action="MainController">
                    Search<input type="text" name="search" value="<%= search%>"/>
                    <input  type="submit" name="action" value="Search"/><br/>
                </form>-->

        <%
            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (listUser.size() > 0) {
        %>
        
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
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>No. </th>
                                <th>User ID</th>
                                <th>Full Name</th>
                                <th>Role ID</th>
                                <th>Password</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                <%
                    int count = 1;
                    for (UserDTO user : listUser) {
                %>
            <form action="MainController">
                <tr>
                    <td> 
                        <%= count++%>  
                    </td>
                    <td> 
                        <input type="text" name="userID" value="<%= user.getUserID()%>" readonly="" />
                    </td>
                    <td> 
                        <input type="text" name="fullName" value="<%= user.getFullName()%>" required="" />           
                    </td> 
                    <td>
                        <input type="text" name="roleID" value="<%= user.getRoleID()%>" required=""/>
                    </td>  
                    <td><%= user.getPassword()%></td>
                    <!--Update here-->
                    <td>
                        <input type="hidden" name="search" value="<%= search%>" />
                        <button class="btn btn-warning btn-g px-2" type="submit" name="action" value="Update">Update</button>
                    </td> 
                    <!--Delete here-->
                    <td>
                        <a href="MainController?search=<%=search%>&action=Delete&userID=<%= user.getUserID()%>" class="delete" ><i
                                class="material-icons"  title="Delete">&#xE872;</i></a>
                    </td>
                </tr>
            </form>
            <%
                }
            %>    
        </tbody>
    </table>
    <%
            }
        }
    %>
    <%
        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    %>
    <%= error%>
</body>
</html>
