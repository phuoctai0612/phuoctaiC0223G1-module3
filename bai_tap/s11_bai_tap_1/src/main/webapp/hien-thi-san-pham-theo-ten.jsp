<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/31/2023
  Time: 9:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:choose>
    <c:when test="${list==0}">
        <p>Không có sản phẩm</p>
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>STT</th>
                <th>Tên sản phẩm</th>
                <th>Giá sản phẩm</th>
                <th>Mô tả</th>
                <th>Nhà sản xuất</th>
            </tr>
            <c:forEach items="${list}" var="product">
                <tr>
                    <td><c:out value="${product.id}"/></td>
                    <td><c:out value="${product.nameProduct}"/></td>
                    <td><c:out value="${product.price}"/></td>
                    <td><c:out value="${product.moTa}"/></td>
                    <td><c:out value="${product.nhaSanXuat}"/></td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

<a href="/product-servlet">Quay lại trang chủ</a>
</body>
</html>
