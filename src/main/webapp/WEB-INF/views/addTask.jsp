<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/header.jsp" %>

<html>
<head>
    <title>Create Task</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
</head>
<body>
<div class="container py-4 px-3 mx-auto">
    <h2>Create a New Household Task</h2>

    <form:form action="${pageContext.request.contextPath}/tasks" modelAttribute="task" method="post" class="needs-validation">

        <form:hidden path="id" />

        <div class="mb-3">
            <label for="taskName" class="form-label">Task:</label>
            <form:input path="taskName" id="taskName" cssClass="form-control" />
            <form:errors path="taskName" cssClass="text-danger" />
        </div>

        <div class="mb-3">
            <label for="taskDescription" class="form-label">Description:</label>
            <form:input path="taskDescription" id="taskDescription" cssClass="form-control" />
            <form:errors path="taskDescription" cssClass="text-danger" />
        </div>

        <div class="mb-3">
            <label for="category" class="form-label">Category:</label>
            <form:select path="category.id" id="category" cssClass="form-select">
                <form:option value="" label="-- Select Category --"/>
                <form:options items="${categories}" itemValue="id" itemLabel="category" />
            </form:select>
            <form:errors path="category" cssClass="text-danger" />
        </div>

        <div class="mb-3">
            <label for="dueDate" class="form-label">Due Date:</label>
            <form:input type="date" path="dueDate" id="dueDate" cssClass="form-control" />
            <form:errors path="dueDate" cssClass="text-danger" />
        </div>

        <button type="submit" class="btn btn-primary">Submit Task</button>

    </form:form>
</div>
</body>
</html>