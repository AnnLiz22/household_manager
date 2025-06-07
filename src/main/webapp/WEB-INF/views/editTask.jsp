<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/header.jsp" %>

<html>
<head>
  <title>Edit Task</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous">
</head>
<body>

<div class="container py-4 px-3 mx-auto">
  <h3>Edit Task: <c:out value="${task.taskName}" /></h3>

  <div class="px-4 py-3 bg-light rounded-2">

    <form:form action="${pageContext.request.contextPath}/tasks/edit/${task.id}"
               method="post" modelAttribute="task">

      <form:hidden path="id" />

      <div class="mb-3">
        <label for="taskName" class="form-label">Task Name:</label>
        <form:input path="taskName" id="taskName" cssClass="form-control" />
        <form:errors path="taskName" cssClass="text-danger" />
      </div>

      <div class="mb-3">
        <label for="taskDescription" class="form-label">Task Description:</label>
        <form:input path="taskDescription" id="taskDescription" cssClass="form-control" />
        <form:errors path="taskDescription" cssClass="text-danger" />
      </div>

      <div class="mb-3">
        <label for="dueDate" class="form-label">Due Date:</label>
        <form:input type="date" path="dueDate" id="dueDate" cssClass="form-control" />
        <form:errors path="dueDate" cssClass="text-danger" />
      </div>

      <button type="submit" class="btn btn-primary">Update Task</button>

    </form:form>

  </div>
</div>

</body>
</html>
