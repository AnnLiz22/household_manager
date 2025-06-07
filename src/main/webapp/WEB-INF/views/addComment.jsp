<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add comment</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
</head>
<body>
<div class="container py-4 px-3 mx-auto">
    <h2>Add your comment: </h2>

    <form:form action="${pageContext.request.contextPath}/comments/add" modelAttribute="comment" method="post">

        <form:hidden path="id" id="id"/>

        <div class="mb-3">
            <label for="comment" class="form-label">Your comment:</label>
            <form:input path="comment" id="comment" cssClass="form-control"/>
            <form:errors path="comment" cssClass="text-danger"/>
        </div>

        <div class="mb-3">
            <label for="user" class="form-label">User:</label>
            <form:select path="user.id" id="user" cssClass="form-select">
                <form:options items="${users}" itemValue="id" itemLabel="email"/>
            </form:select>
        </div>

        <div class="mb-3">
            <label for="userTask" class="form-label">Assigned Task:</label>
            <form:select path="userTask.id" id="userTask" cssClass="form-select">
                <form:options items="${userTasks}" itemValue="id" itemLabel="task.taskName"/>
            </form:select>
        </div>

        <button type="submit" class="btn btn-primary">Confirm</button>
    </form:form>
</div>
</body>
</html>
