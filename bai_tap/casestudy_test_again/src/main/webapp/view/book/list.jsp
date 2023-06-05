<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/2/2023
  Time: 9:54 AM
  To change this template use File | Settings | File Templates.
--%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<center>
    <h1>List Book</h1>
    <a href="/book?action=create" style="tab-size: 50px">Create</a><br>
    <form action="/book?action=search" method="post">
        <input type="text" name="search" placeholder="Nhập tên muốn tìm kiếm">
        <input type="submit">
    </form>
</center>
<table border="1" class="table-view table-row-cell tab-label" width="800px" style="height: 400px" align="center">
    <tr>
        <th>Title</th>
        <th>Page_size</th>
        <th>Author_id</th>
        <th>Cate_gory_id</th>
        <th>Sửa</th>
        <th>Xóa</th>
    </tr>
    <c:forEach items="${bookList}" var="book">
        <c:if test="${bookList.size()==0}">
            <tr >
                <td colspan="5">Không có sản phẩm phù hợp</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </c:if>
        <tr>
            <td><c:out value="${book.title}"/></td>
            <td><c:out value="${book.page_size}"/></td>
            <td><c:out value="${book.author_id.name}"/></td>
            <td><c:out value="${book.cate_gory_id.name}"/></td>
            <td><a href="/book?action=edit&id=${book.id}">Edit</a></td>
            <td>
                <a onclick="deleteBook(${book.id},'${book.title}')" type="button" class="btn btn-primary"
                   data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </a>
            </td>
        </tr>
    </c:forEach>
</table>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="title"></p>
            </div>
            <div class="modal-footer">
                <form action="/book?action=delete" method="post">
                    <input type="text" name="deleteId" id="deleteId" hidden>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="id" name="id">Sure</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script>
    function deleteBook(id, name) {
        document.getElementById("title").innerText = name;
        document.getElementById("deleteId").value = id;
    }
</script>

</body>
</html>
