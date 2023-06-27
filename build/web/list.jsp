<%-- 
    Document   : list
    Created on : Jun 27, 2023, 11:36:58 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table border="1">
            
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                </tr>
                <c:forEach items="${requestScope.TEA}" var="p">
                <tr>
                    <td>${p.id}</td>
                    
                </tr>
                </c:forEach>
               
           
        </table>

    </body>
</html>
