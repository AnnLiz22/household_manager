
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/header.jsp" %>

<html>
<head>
    <title>Create task</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="container py-4 px-3 mx-auto">
    <h2>Let's create a new household task !</h2>

    <form:form action="${pageContext.request.contextPath}/tasks" modelAttribute="task" method="post">

        <form:hidden path="id" id="id"/>

        <label for="taskName">Task:</label>
        <form:input path="taskName" id="taskName"/>

        <label for="taskDescription">Task Description:</label>
        <form:input path="taskDescription" id="taskDescription"/>

        <label for="category">Task Category:</label>
        <form:select path="category.id" id="category">
            <form:option value="" label="--kategoria--"/>
            <form:options items="${categories}" itemValue="id" itemLabel="category"/>
        </form:select>

        <label for="dueDate">Task Due Date:</label>
        <form:input id="dueDate" path="dueDate" required="true"/>
        <br>

        <button type="submit">Submit task</button>

    </form:form>

</div>
</body>
</html>
