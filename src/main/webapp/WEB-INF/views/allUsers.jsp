
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="/header.jsp" %>

<html>
<head>
    <title>All users</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="container py-4 px-3 mx-auto">
 <h2>All household members </h2>
    <div class="px-4 py-3 bg-light rounded-2">

    <table>
    <thead>
    <th>Name: </th>
    <th>Household member role: </th>

    </thead>
    <tbody>
    <c:forEach items="${users}" var="user">
        <tr>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.role}"/></td>

            <td class="px-4 py-3">
                <form:form action="/users/delete/${user.id}" method="post" cssStyle="display:inline;"
                           onClick="return confirm('Are you sure you want to delete ${user.name} from your household?')">
                    <input type="submit" value="Delete"/>
                </form:form>
            </td>

            <td class="px-4 py-3">
                <form:form action="/users/show/${user.id}" method="post" cssStyle="display:inline;">
                    <input type="submit" value="Show details"/>
                </form:form>
            </td>


            <td class="px-4 py-3">
                    <form:form action="${pageContext.request.contextPath}/assignTask" method="get" cssStyle="display:inline;">
                <input type="submit" value="Assign task"/>
                        </form:form>

        </tr>
    </c:forEach>
    </tbody>
</table>
    </div>
</div>

</body>
</html>
