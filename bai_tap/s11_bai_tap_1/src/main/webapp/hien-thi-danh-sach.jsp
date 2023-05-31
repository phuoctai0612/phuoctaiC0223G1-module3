<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/31/2023
  Time: 12:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hiển thị danh sách</title>
</head>
<body>
<a href="/product-servlet?action=themMoi">
    <p>Thêm mới danh sách</p>
</a>
<table>
    <tr>
        <th>STT</th>
        <th>Tên sản phẩm</th>
        <th>Giá sản phẩm</th>
        <th>Mô tả</th>
        <th>Nhà sản xuất</th>
        <th>Xóa</th>
        <th>Sửa</th>
    </tr>
    <c:forEach items="${list}" var="product" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${product.nameProduct}"/></td>
            <td><c:out value="${product.price}"/></td>
            <td><c:out value="${product.moTa}"/></td>
            <td><c:out value="${product.nhaSanXuat}"/></td>
            <td><button><a href="/product-servlet?action=xoaDanhSach&id=${product.id}">X</a></button>
            </td>
            <td><button><a href="/product-servlet?action=suaDanhSach&id=${product.id}">Sửa</a></button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
