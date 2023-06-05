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
<p>Title</p>
<form action="/book?action=edit" method="post">
    <input type="text" value="${book.id}" name="id" hidden>
    <input type="text" value="${book.title}" name="title"><br>
    <p>Page</p>
    <input type="text" value="${book.page_size}" name="page"><br>
    <p>Author</p>
    <select name="author">
        <option value="${book.author_id.id}">${book.author_id.name}</option>
        <c:forEach items="${authorsList}" var="author">
            <option value="${author.id}">${author.name}</option>
        </c:forEach>
    </select>
    <select value="cate" name="cate">
        <option value="${book.cate_gory_id.id}">${book.cate_gory_id.name}</option>
        <c:forEach items="${cateGoryList}" var="cate">
            <option value="${cate.id}">${cate.name}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Submit">
</form>
</body>
</html>
