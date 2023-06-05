<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
        <form action="/users" method="post">
            <input name="action" value="sort" hidden>
            <input type="submit">
        </form>
    </h2>
</center>
<div align="center">
    <form action="/users?action=findName" method="post">
        <input type="text" name="findName" >
        <input type="submit" >Find Name</input>
    </form>
    <table border="1" cellpadding="5" cellspacing="1">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}&name=${user.name}&email=${user.email}&country=${user.country}">Edit</a>
                </td>

                <td>
                    <a type="button" class="btn btn-primary"
                       data-bs-toggle="modal" data-bs-target="#exampleModal" >
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="name"></p>
            </div>
            <div class="modal-footer">
                <form action="/users?action=delete" method="post">
                    <input type="hidden" name="deleteId" id="deleteId" >
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary"  id="id">Save changes</button>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script>
    function deleteUser(id,name){
        document.getElementById("name").innerText=name;
        document.getElementById("deleteId").value=id;
    }
</script>
</body>
</html>






