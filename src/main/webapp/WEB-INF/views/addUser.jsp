<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add User</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="container py-4 px-3 mx-auto">
    <h2>Join by filling this form: </h2>

    <form:form action="${pageContext.request.contextPath}/users" modelAttribute="user" method="post">

        <form:hidden path="id" id="id"/>

        <label for="name">Preferred name or login:</label>
        <form:input path="name" id="name"/>

        <label for="role">Household member role:</label>
        <form:input path="role" id="role"/>

        <br>

        <button type="submit">Submit </button>

    </form:form>

</div>
</body>
</html>
