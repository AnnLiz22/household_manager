
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/header.jsp" %>

<html>
<head>
    <title>Edit user task</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>

<div class="container py-4 px-3 mx-auto">
    <h3>Edit task assigned to user</h3>
    <div class="px-4 py-3 bg-light rounded-2">

        <form:form action="${pageContext.request.contextPath}/assignTask/edit/${userTask.id}" method="post" modelAttribute="userTask">


            <label for="taskName">Task :</label>
            <form:input id="taskName" path="task" value="${userTask.task.taskName}" required="true" />
            <br/>

            <label for="isDone">Is the task done:</label>
            <form:checkbox id="isDone" path="isDone" />
            <br/>

<%--            <label for="comment">Add a comment:</label>--%>
<%--            <form:input id="comment" path="userTaskComments" value="${userTask.comment}" required="true" />--%>
<%--            <br/>--%>

            <input type="submit" value="Confirm" />
        </form:form>


    </div>
</div>

</body>
</html>
