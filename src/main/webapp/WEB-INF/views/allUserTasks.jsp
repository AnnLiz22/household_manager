
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/header.jsp" %>

<html>
<head>
    <title>User task list</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="container py-4 px-3 mx-auto">
<h2>User tasks</h2>
    <div class="px-4 py-3 bg-light rounded-2">

    <table>
    <thead>
    <th>Task: </th>
    <th>Deadline: </th>
    <th>Is the task done: </th>
    <th>Comment: </th>

    </thead>
    <tbody>
    <c:forEach items="${userTasks}" var="userTask">
        <tr>
            <td><c:out value="${userTask.task}"/></td>
            <td><c:out value="${userTask.deadline}"/></td>
            <td><c:out value="${userTask.done}"/></td>

        <td>   <a href="${pageContext.request.contextPath}/comments">Add comment</a>
        </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
    </div>
</div>
</body>
</html>
