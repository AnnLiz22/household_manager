
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

            <div class="mb-3">
                <label for="user">User:</label>
                <form:select path="user.id" id="user" cssClass="form-select">
                    <form:options items="${users}" itemValue="id" itemLabel="name"/>
                </form:select>
            </div>

            <div class="mb-3">
                <label for="task">Task:</label>
                <form:select path="task.id" id="task" cssClass="form-select">
                    <form:options items="${tasks}" itemValue="id" itemLabel="taskName"/>
                </form:select>
            </div>

            <input type="submit" value="Assign Task" class="btn btn-primary"/>
        </form:form>

    </div>
</div>
</body>
</html>
<%@ include file="/footer.jsp" %>
