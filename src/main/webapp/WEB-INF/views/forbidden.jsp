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

    <script>
        window.onload = function(){
            setTimeout(function(){
                history.go(-1);
            }, 2000)
        }
    </script>
</head>
<body>
    <h1>잘못된 경로입니다.</h1>
    <h3>2초 후 자동으로 이전 페이지로 이동합니다.</h3>

</body>
</html>
