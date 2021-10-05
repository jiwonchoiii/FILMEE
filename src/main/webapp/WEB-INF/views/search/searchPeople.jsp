<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>FILMEE | FILM MEETING</title>
	<link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

	<link rel="stylesheet" href="/resources/css/searchPeople.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

	<script src="/resources/js/searchPeople.js"></script>

</head>

<body>
	<%@include file="/resources/html/header.jsp" %>
	<div id="container">
		<div class="row">
			<section class="col-9">
				<div id="sp_header">
					<p>
						films with <strong>${result[0].enname}</strong>
					</p>
				</div>				
				<div id="films">
					<div class="row">
						<c:forEach items="${result}" var="film">
							<div class="each_film col-3">
								<a href="/film/${film.filmId}">
									<div class="poster">
										<div>
											<img src="https://www.themoviedb.org/t/p/original<c:out value='${film.posterPath}' />" alt="posterPath" id="posterPath">
										</div>										
									</div>
									<div class="description">
										<c:out value="${film.originalTitle}" />
										<br>
										[<c:out value="${film.releaseDate}" />]
										<br>
										<c:out value="${film.character}" />
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
			<aside class="col-3">
				<img src="https://www.themoviedb.org/t/p/original${result[0].profilePath}" alt="profilePhoto" id="profilePhoto">
				<p>${result[0].enname}</p>
			</aside>
		</div>
	  </div>
	<%@include file="/resources/html/footer.jsp" %>

</body>

</html>