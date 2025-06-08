<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/header.jsp" %>

<html>
<head>
    <title>Edit user task</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container py-4 px-3 mx-auto">
    <h3>Edit task assigned to user</h3>
    <div class="px-4 py-3 bg-light rounded-2">

        <form:form action="${pageContext.request.contextPath}/assignTask/edit/${userTask.id}" method="post" modelAttribute="userTask">

            <label for="task">Task:</label>
            <form:select path="task.id" id="task" cssClass="form-select">
                <form:options items="${tasks}" itemValue="id" itemLabel="taskName"/>
            </form:select>
            <br/><br/>

            <label for="isDone">Is the task done:</label>
            <form:checkbox id="isDone" path="isDone" />
            <br/><br/>

            <input type="submit" value="Confirm" class="btn btn-primary"/>
        </form:form>

    </div>

    <h4>Add Comment:</h4>
    <form:form method="post" action="${pageContext.request.contextPath}/comments/addToTask/${userTask.id}" modelAttribute="newComment">
        <div class="mb-3">
            <label for="comment">Comment:</label>
            <form:textarea path="comment" id="comment" cssClass="form-control"/>
        </div>
        <button type="submit" class="btn btn-primary">Add Comment</button>
    </form:form>



</div>

</body>
</html>