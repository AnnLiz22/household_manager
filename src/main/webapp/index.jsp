<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/header.jsp" %>

<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="container py-4 px-3 mx-auto">

    <h3>Welcome to your household manager! </h3>

    <div class="px-4 py-3 bg-light rounded-2">
        <h5>Now you can easily organize all of your household duties together with your family.</h5> <br>
        <ul><h5> >>> Let's <a href="${pageContext.request.contextPath}/tasks">create </a>
            a new task :-) </h5>
            <h5> >>> Let's do it together. <a href="${pageContext.request.contextPath}/users">add </a>
                a family member :-) </h5>
            <h5> >>> If you want to assign a task to a household member, you can do it <a
                    href="${pageContext.request.contextPath}/assignTask">here </a>. </h5>
            <h5> >>> And here you can find the <a href="${pageContext.request.contextPath}/assignTask/all"> tasks </a>
                that are already in progress. <br>
            </h5>
        </ul>
        <br>
        <h5>Have fun!</h5>

    </div>
</div>


</body>
</html>
<%@ include file="/footer.jsp" %>
