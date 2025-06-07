<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/header.jsp" %>

<html>
<head>
    <title>User Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
</head>
<body>
<div class="container py-4 px-3 mx-auto">
    <h2>User Details</h2>
    <div class="card p-4 bg-light rounded-3">
        <div class="mb-3">
            <strong>Name:</strong>
            <span><c:out value="${user.name}" /></span>
        </div>

        <div class="mb-3">
            <strong>Role:</strong>
            <span><c:out value="${user.role}" /></span>
        </div>

        <div class="mt-4">
            <a href="${pageContext.request.contextPath}/users/edit/${user.id}" class="btn btn-warning btn-sm">
                Edit User
            </a>
            <a href="${pageContext.request.contextPath}/users/all" class="btn btn-secondary btn-sm">
                Back to List
            </a>
        </div>
    </div>
</div>
</body>
</html>
