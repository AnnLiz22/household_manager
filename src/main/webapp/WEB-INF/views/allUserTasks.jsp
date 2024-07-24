<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/header.jsp" %>

<html>
<head>
    <title>User task list</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="container py-4 px-3 mx-auto">
<%--    <h2>User ${userTasks.user.id} tasks</h2>--%>
    <div class="px-4 py-3 bg-light rounded-2">

        <table>
            <thead>
            <th>Who is doing the task:</th>
            <th>Task:</th>
            <th>Task description:</th>
            <th>Is the task done:</th>
            <th>[mark if yes]</th>
            <th>Comment:</th>

            </thead>
            <tbody>

            <c:forEach items="${userTasks}" var="userTask">
                <tr>
                    <td class="px-4 py-3"><c:out value="${userTask.user.name}"/></td>

                    <td class="px-4 py-3"><c:out value="${userTask.task.taskName}"/></td>
                    <td class="px-4 py-3"><c:out value="${userTask.task.taskDescription}"/></td>
                    <td><c:out value="${userTask.done}"/></td>
<%--                    <td><form:checkbox path="isDone"/></td>--%>
                    <td class="px-4 py-3">
                        <input type="checkbox" name="userTasks[${status.index}].done"
                               value="true" ${userTask.done ? 'checked="checked"' : ''}/>
                        <input type="hidden" name="userTasks[${status.index}].done" value="false"/>
                    </td>
                    <td class="px-4 py-3"><a href="${pageContext.request.contextPath}/comments">Add comment</a>
                    </td>
                    <td class="px-4 py-3">
                        <form:form action="/tasks/show/${task.id}" method="get" cssStyle="display:inline;">
                            <input type="submit" value="Show task details"/>
                        </form:form>
                    </td>
<%--                    <td><c:out value="${userTask.comment}"/></td>--%>

                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>
</body>
</html>
