<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/2/2023
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/book?action=create" method="post">
    <p>Input title</p>
    <input type="text" name="title" placeholder="Title"><br>
    <p>Input page size</p>
    <input type="text" name="pageSize" placeholder="Page size"><br>
    <select name="authorId" id="authorId">
        <option value="0">Authors</option>
        <c:forEach items="${authorsList}" var="authors">
            <option value="${authors.id}">${authors.name}</option>
        </c:forEach>
    </select><br>
    <select name="cateGory" id="cateGory">
        <option value="0">Cate</option>
        <c:forEach items="${cateGoryList}" var="cateGory">
            <option value="${cateGory.id}">${cateGory.name}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Submit">
</form>
</body>
</html>
