<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add comment</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="container py-4 px-3 mx-auto">
    <h2>Add your comment: </h2>

    <form:form action="${pageContext.request.contextPath}/comments" modelAttribute="comment" method="post">

        <form:hidden path="id" id="id"/>

        <label for="comment">Your comment:</label>
        <form:input path="comment" id="comment"/>

        <br>

        <button type="submit">Confirm</button>

    </form:form>

</div>


</body>
</html>
