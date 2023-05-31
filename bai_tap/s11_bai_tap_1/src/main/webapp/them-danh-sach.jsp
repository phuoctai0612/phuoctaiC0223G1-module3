<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/31/2023
  Time: 1:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<form action="/product-servlet?action=themMoi" method="post">
    <p>Nhập Id</p>
    <input type="text" name="id"><br>
    <p>Nhập tên sản phẩm</p>
    <input type="text" name="sanpham"><br>
    <p>Nhập giá sản phẩm</p>
    <input type="text" name="gia"><br>
    <p>Nhập mô tả</p>
    <input type="text" name="mota"><br>
    <p>Nhập nhà sản xuất</p>
    <input type="text" name="nhasanxuat">
    <input type="submit">
</form>
<a href="/product-servlet">quay lại trang chủ</a>
</body>
</html>
