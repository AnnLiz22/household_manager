
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/header.jsp" %>

<html>
<head>
    <title>Assign task</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="container py-4 px-3 mx-auto">
    <h3>Assign task to user:</h3>
    <div class="px-4 py-3 bg-light rounded-2">
        <form:form action="${pageContext.request.contextPath}/assignTask" modelAttribute="userTask" method="post">
            <label for="user">User:</label>
            <select id="user" name="userId">
                <c:forEach var="user" items="${users}">
                    <option value="${user.id}">${user.name}</option>
                </c:forEach>
            </select>
            <br/><br>

            <label for="task">Task:</label>
            <select id="task" name="taskId">
                <c:forEach var="task" items="${tasks}">
                    <option value="${task.id}">${task.taskName}</option>
                </c:forEach>
            </select>
            <br/><br>

            <input type="submit" value="Assign Task"/>
        </form:form>
    </div>
</div>
</body>
</html>
