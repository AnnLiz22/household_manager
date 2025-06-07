<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/header.jsp" %>

<html>
<head>
    <title>All Tasks</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
</head>
<body>
<div class="container py-4 px-3 mx-auto">

    <h2>What needs to be done:</h2>

    <div class="px-4 py-3 bg-light rounded-2">

        <table class="table table-striped table-bordered align-middle">
            <thead>
            <tr>
                <th>Task</th>
                <th>Description</th>
                <th>Created On</th>
                <th>Category</th>
                <th>Deadline</th>
                <th>Actions</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="task" items="${tasks}">
                <tr>
                    <td><c:out value="${task.taskName}" /></td>
                    <td><c:out value="${task.taskDescription}" /></td>
                    <td><c:out value="${task.createdOn}" /></td>
                    <td><c:out value="${task.category.category}" /></td>
                    <td><c:out value="${task.dueDate}" /></td>

                    <td>
                        <div class="d-flex gap-2 flex-wrap">
                            <form action="${pageContext.request.contextPath}/tasks/edit/${task.id}" method="get">
                                <button class="btn btn-warning btn-sm" type="submit">Edit</button>
                            </form>

                            <form action="${pageContext.request.contextPath}/tasks/delete/${task.id}" method="post"
                                  onsubmit="return confirm('Are you sure you want to delete ${task.taskName}?')">
                                <button class="btn btn-danger btn-sm" type="submit">Delete</button>
                            </form>
