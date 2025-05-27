<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/header.jsp" %>

<html>
<head>
    <title>Add category</title>
</head>
<body>
<div class="container py-4 px-3 mx-auto">
    <h2>Add your own task category: </h2>

    <form:form action="${pageContext.request.contextPath}/categories" modelAttribute="category" method="post">

        <form:hidden path="id" id="id"/>

        <label for="category">Category name:</label>
        <form:input path="category" id="category"/>

        <br>


        <button type="submit">Confirm</button>

    </form:form>

</div>
</body>
</html>
