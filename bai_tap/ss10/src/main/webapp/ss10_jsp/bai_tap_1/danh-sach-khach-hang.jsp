<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/30/2023
  Time: 8:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            border: 1px;
            width: 300px
        }
        table,tr,td{
            text-align: center;
            padding: 40px;

        }
    </style>
</head>
<body>
<form action="/CustomerServlet" method="get">
    <table >
        <tr style="text-align: center;">
            <td >STT</td>
            <td >Tên</td>
            <td >Ngày sinh</td>
            <td >Địa chỉ</td>
            <td >Ảnh</td>
            <td>Xóa</td>
            <td>Sửa</td>
        </tr>
        <c:forEach items="${list}" var="c" varStatus="loop">
            <tr style="text-align: center;">
                <td>
                    <c:out value="${loop.count}"/>
                </td>
                <td>
                    <c:out value="${c.name}"/>
                </td>
                <td>
                    <c:out value="${c.dayOfBirth}"/>
                </td>
                <td><c:out value="${c.address}"/></td>
                <td>
                    <img style="width: 150px;height: 150px;" src=" <c:out value="${c.img}"/>"
                         alt="">
                </td>
                <td><a href="/CustomerServlet?action=delete"><i class="fa-sharp fa-solid fa-trash">Xoa</i></a></td>
                <td><a href="/CustomerServlet?action=edit"><i class="fa-solid fa-pen-to-square">Sửa</i></a></td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
