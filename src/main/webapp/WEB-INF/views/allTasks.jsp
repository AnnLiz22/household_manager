
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/header.jsp" %>

<html>
<head>
    <title>All tasks</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="container py-4 px-3 mx-auto">

    <h2>All Created Tasks </h2>

    <div class="px-4 py-3 bg-light rounded-2">

        <table>

            <th>
            Manage tasks
            </th>


            <tbody>
            <c:forEach var="task" items="${tasks}">

                <tr>
                    <td>${task.taskName}</td>
                    <td>${task.taskDescription}</td>
                    <td>${task.createdOn}</td>
                    <td>${task.category}</td>
                    <td>${task.dueDate}</td>

                    <td class="px-4 py-3">
                        <form:form action="/tasks/edit/${task.id}" method="post" cssStyle="display:inline;">
                            <input type="submit" value="Edit"/>
                        </form:form>
                    </td>


                    <td class="px-4 py-3">
                        <form:form action="/tasks/delete/${task.id}" method="post" cssStyle="display:inline;"
                                   onClick="return confirm('Are you sure you want to delete ${task.taskName} from your list of tasks?')">
                            <input type="submit" value="Delete"/>
                        </form:form>
                    </td>

                    <td class="px-4 py-3">
                        <form:form action="/tasks/showTask/${task.id}" method="post" cssStyle="display:inline;">
                            <input type="submit" value="Show task details"/>
                        </form:form>
                    </td>


                    <td class="px-4 py-3">
                        <form:form action="${pageContext.request.contextPath}/assignTask" method="get" cssStyle="display:inline;">
                            <input type="submit" value="Assign to user"/>

                        </form:form>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>


    </div>
</div>
</body>

</html>
