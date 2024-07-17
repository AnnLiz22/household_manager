<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/header.jsp" %>

<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="container py-4 px-3 mx-auto">

    <h3>Welcome to your household manager! </h3>

    <div class="px-4 py-3 bg-light rounded-2">
        <p>Now you can easily organize all of your household duties together with your family.</p>
        <ul><h5> >>> Let's   <a href="${pageContext.request.contextPath}/tasks">create </a>
            a new task :-) </h5>
            <h5> >>> Let's  do it together. <a href="${pageContext.request.contextPath}/users">add </a>
                a family member :-) </h5>

        </ul>

        <p>Have fun!</p>

    </div>
</div>
</body>
</html>
