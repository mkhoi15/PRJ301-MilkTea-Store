<%-- 
    Document   : usPage
    Created on : May 29, 2023, 11:06:54 AM
    Author     : ADMIN
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>User Information</h1>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"US".equals(loginUser.getRoleID())) {
                    response.sendRedirect("login.html");
                    return;
                }
        %>
        UserID: <%= loginUser.getUserID() %><br/>
        Password: <%= loginUser.getPassword() %><br/>
        RoleID: <%= loginUser.getRoleID() %><br/>
        FullName: <%= loginUser.getFullName() %>
    </body>
</html>
