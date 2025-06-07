<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/header.jsp" %>

<html>
<head>
    <title>Edit User</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
</head>
<body>
<div class="container py-4 px-3 mx-auto">
    <h3>Edit user: <c:out value="${user.name}" /></h3>

    <div class="px-4 py-3 bg-light rounded-2">
        <form:form action="${pageContext.request.contextPath}/users/edit/${user.id}" method="post"
                   modelAttribute="user">

            <form:hidden path="id"/>

            <div class="mb-3">
                <label for="login" class="form-label">Login:</label>
                <form:input id="login" path="name" cssClass="form-control" required="true"/>
            </div>

            <div class="mb-3">
                <label for="role" class="form-label">Household Member Role:</label>
                <form:input id="role" path="role" cssClass="form-control" required="true"/>
            </div>

            <button type="submit" class="btn btn-primary">Update User</button>
        </form:form>
    </div>
</div>
</body>
</html>
