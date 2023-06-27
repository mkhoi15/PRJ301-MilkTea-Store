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
      
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        
        UserID: ${sessionScope.LOGIN_USER.userID}<br/>
        Password: ${sessionScope.LOGIN_USER.password}<br/>
        RoleID: ${sessionScope.LOGIN_USER.roleID}<br/>
        FullName: ${sessionScope.LOGIN_USER.fullName}
        
          <!--Home Menu--> 
        
        <!--Home Slider-->
        
    </body>
</html>
