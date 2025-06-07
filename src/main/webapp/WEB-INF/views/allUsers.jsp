<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="/header.jsp" %>

<html>
<head>
    <title>All Users</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
</head>
<body>
<div class="container py-4 px-3 mx-auto">
    <h2>All Household Members</h2>
    <div class="px-4 py-3 bg-light rounded-2">
        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>Name</th>
                    <th>Role</th>
                    <th colspan="4">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td><c:out value="${user.name}" /></td>
                        <td><c:out value="${user.role}" /></td>

                        <!-- Edit -->
                        <td>
                            <a href="${pageContext.request.contextPath}/users/edit/${user.id}" class="btn btn-sm btn-warning">
                                Edit
                            </a>
                        </td>

                        <!-- Delete -->
                        <td>
                            <form action="${pageContext.request.contextPath}/users/delete/${user.id}" method="post"
                                  style="display:inline;"
                                  onsubmit="return confirm('Are you sure you want to delete ${user.name}?');">
                                <input type="submit" value="Delete" class="btn btn-sm btn-danger"/>
                            </form>
                        </td>

                        <!-- Show Details -->
                        <td>
                            <a href="${pageContext.request.contextPath}/users/show/${user.id}" class="btn btn-sm btn-info">
                                Show Details
                            </a>
                        </td>

                        <!-- Assign Task -->
                        <td>
                            <form action="${pageContext.request.contextPath}/assignTask" method="get" style="display:inline;">
                                <input type="hidden" name="userId" value="${user.id}" />
                                <input type="submit" value="Assign Task" class="btn btn-sm btn-secondary"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
