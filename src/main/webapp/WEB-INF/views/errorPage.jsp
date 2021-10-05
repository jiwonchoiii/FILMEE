<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page session = "false" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>FILMEE | FILM MEETING</title>
	<link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">
</head>
<body>
    <h1>예외뜸 ㅋㅋ</h1>

    <h1>/WEB-INF/views/errorPage.jsp</h1>

    <p>${exception}</p>
    <!-- EL 표현식 -->

    <hr>

    <ul>
        <c:forEach items="${exception.getStackTrace()}" var="stack">
            <li><c:out value="${stack}"/></li>
        </c:forEach>
    </ul>
</body>
</html>
