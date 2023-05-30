<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/30/2023
  Time: 1:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/MayTinhServlet" method="get">
    <h1>Máy tính đơn giản</h1>
    <br>
    <fieldset style="width: 400px">
        <legend>Máy tính</legend>
        <p>Giá trị thứ nhất: </p>
        <input type="text" name="num1" value="0">
        <p>Phép toán</p>
        <select name="pheptinh" >
            <option value="cong">cong</option>
            <option value="tru">tru</option>
            <option value="nhan">nhan</option>
            <option value="chia">chia</option>
        </select>
        <p>Giá trị thứ hai: </p>
        <input type="text" name="num2" value="0"><br>
        <button type="submit">Tính</button>
    </fieldset>
</form>
</body>
</html>
