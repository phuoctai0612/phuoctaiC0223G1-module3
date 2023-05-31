<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/29/2023
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<form action="/product-servlet" method="post">
    <fieldset style="width: 500px"></fieldset>
    <legend>Product Description</legend>
    <input type="text" name="product">
    <p>List Price: </p>
    <input type="text" name="price">
    <p>Discount Percent: </p>
    <input type="text" name="discount">
    <input type = "submit" id = "submit" value = "Result"/>
</form>
</body>
</html>
