<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/footer.jsp" %>


<html>
<head>
    <title>Show Task</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>

<body>
<div class="container py-4 px-3 mx-auto">
    <h3>Manage your task: </h3>
    <div class="px-4 py-3 bg-light rounded-2">

        <table>

            <th>Task Details:</th>
            <tbody>
            <tr>

                <td> Task: ${task.taskName}</td>
                <td> Description: ${task.taskDescription}</td>
                <td> Description: ${task.category}</td>
                <td> Created on: ${task.createdOn}</td>
                <td> Deadline: ${task.dueDate}</td>

                <td>
                    <a href="${pageContext.request.contextPath}/tasks/edit/{id}">Edit task</a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/tasks/all">Back to all tasks</a>
                </td>


            </tr>


            </tbody>
        </table>
    </div>
</div>
</body>
</html>
