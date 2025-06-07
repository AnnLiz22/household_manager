<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/footer.jsp" %>

<html>
<head>
    <title>Show Task</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
</head>

<body>
<div class="container py-4 px-3 mx-auto">
    <h3>Task Details</h3>

    <div class="px-4 py-3 bg-light rounded-2">

        <table class="table table-bordered table-hover">
            <tbody>
            <tr>
                <th scope="row">Task Name</th>
                <td><c:out value="${task.taskName}" /></td>
            </tr>
            <tr>
                <th scope="row">Description</th>
                <td><c:out value="${task.taskDescription}" /></td>
            </tr>
            <tr>
                <th scope="row">Category</th>
                <td><c:out value="${task.category.category}" /></td>
            </tr>
            <tr>
                <th scope="row">Created On</th>
                <td><c:out value="${task.createdOn}" /></td>
            </tr>
            <tr>
                <th scope="row">Deadline</th>
                <td><c:out value="${task.dueDate}" /></td>
            </tr>
            </tbody>
        </table>

        <div class="d-flex gap-3 mt-3">
            <a href="${pageContext.request.contextPath}/tasks/edit/${task.id}" class="btn btn-warning">Edit Task</a>
            <a href="${pageContext.request.contextPath}/tasks/all" class="btn btn-secondary">Back to All Tasks</a>
        </div>

    </div>
</div>
</body>
</html>
