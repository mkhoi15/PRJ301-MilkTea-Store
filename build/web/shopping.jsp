<%-- 
    Document   : shopping
    Created on : Jun 15, 2023, 10:15:00 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BoBa Tea JSP</title>
    </head>
    <body>
        <h1>Welcome to BoBa Tea</h1>
        <form action="MainController">
            <select name="cmbTea">
                <option value="T01- Milk Tea- 30">Milk Tea- 30k </option>
                <option value="T02- Green Tea- 30">Green Tea- 30k </option>
                <option value="T01- Black Tea- 30">Black Tea- 30k </option>
                <option value="T01- Matcha Tea- 30">Matcha Tea- 30k </option>
                <option value="T01- Red Tea- 30">Red Tea- 30k </option>
            </select>   
            <select name="cmbQuantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
            </select>   
            <input type="submit" name="action" value="Add">
            <input type="submit" name="action" value="View">
        </form>

        ${requestScope.MESSAGE}     


  

</body>
</html>
