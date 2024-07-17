
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/header.jsp" %>
<html>
<head>
  <title>Edit task</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>

<div class="container py-4 px-3 mx-auto">
  <h3>Edit task "${task.taskName}"</h3>
  <div class="px-4 py-3 bg-light rounded-2">

    <form:form action="${pageContext.request.contextPath}/tasks/edit/${task.id}" method="post" modelAttribute="task">


      <label for="taskName">Task Name:</label>
      <form:input id="taskName" path="taskName" value="${task.taskName}" required="true" />
      <br/>
      <label for="taskDescription">Task description:</label>
      <form:input id="taskDescription" path="taskDescription" value="${task.taskDescription}" required="true" />
      <br/>

      <label for="dueDate">Task due date:</label>
      <form:input id="dueDate" path="dueDate" value="${task.dueDate}" required="true" />
      <br/>

      <input type="submit" value="Update task" />
    </form:form>


  </div>
</div>
</body>
</html>
