<%-- 
    Document   : viewCart
    Created on : Jun 15, 2023, 10:24:21 AM
    Author     : ADMIN
--%>

<%@page import="sample.shopping.Tea"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
    </head>
    <body>
        <h1>The Iteams you have choosen</h1>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Remove</th>
                    <th>Edit</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    double total = 0;
                    for (Tea tea : cart.getCart().values()) {
                        total += tea.getPrice() * tea.getQuantity();
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td> <%= count++%> </td>
                    <td>
                        <input type="text" name="id" value="<%= tea.getId() %>" readonly="" />
                    </td>
                    <td><%= tea.getName()%></td>
                    <td><%= tea.getPrice()%>$</td>
                    <td>
                        <input type="number" name="quantity" value="<%= tea.getQuantity() %>" required="" min="1" />
                    </td>
                    <!--Edit Here-->
                     <td>
                       <input type="submit" name="action" value="Edit"/>
                     </td>
                    <!--Remove Here-->
                    <td>
                       <input type="submit" name="action" value="Remove"/>
                    </td>
                    <td><%= tea.getPrice() * tea.getQuantity()%>$</td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
     <h1>Total:${pageScope.total}$</h1>
    <%
        }
    %>
    <a href="shopping.html">Add more</a>
    
 
    
</body>

</html>
