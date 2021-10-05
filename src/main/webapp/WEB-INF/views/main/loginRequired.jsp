<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>FilMee</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

	<script>
		$(function(){
			console.log("jq started");
			$( document ).ready(function() {	//dom이 모두 준비되면
				
				$("#alert_modal p").text("로그인이 필요합니다.");
				$("#alert_modal").modal("show");
				var alertModalEl = document.getElementById('alert_modal');
				alertModalEl.addEventListener('hidden.bs.modal', function(){
			
					$("#login").modal("show");
					$("#login .btn-close").on('click', function(){
						location.reload();
						history.go(-1);
					});
				});//alertModal eventListener
			});//document.ready
			$(window).unload(function(){
				deleteCookie("__ORIGINAL_REQUEST_URI__");
			});
		});//jquery
	</script>


</head>

<body>
	<%@include file="/resources/html/header.jsp" %>
		<!-- <div style="margin : auto; width : 400px; height: 700px;">
			<form id="login_required_form" method="POST">
				<div class="mb-3">
					<label for="login_email" class="form-label"><b>Email</b></label>
					<input type="email" class="form-control" id="login_required_email" name="email" placeholder="name@example.com" autocomplete="username">
				</div>
				<div class="mb-3">
					<label for="password" class="form-label"><b>Password</b></label><br>
					<input type="password" class="form-control" id="login_required_password" name="password" placeholder="password" autocomplete="current-password">
					<div><a href="/main/forgotPw" style="color: #C2DBFE ;">Forgot Password</a></div>
				</div>
				<div class="form-check">
					<label class="form-check-label" for="rememberMe">Remember me</label>
					<input class="form-check-input" type="checkbox" name="rememberMe" id="required_rememberMe">
				</div>
				<div class="d-grid gap-2">
					<button type="button" class="btn btn-primary login_submit_btn">SIGN IN</button>
				</div>
			</form>
		
		</div>
	<%@include file="/resources/html/footer.jsp" %> -->

</body>

</html>