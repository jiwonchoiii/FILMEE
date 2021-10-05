<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>FILMEE | FILM MEETING</title>
	<link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

	<script>
		$(function(){
			$(".fg_pw_send_btn").on('click', function(e){
				e.preventDefault();		//submit 취소
				let email = $('#forgot_pw_email').val(); //email : 지역변수
				console.log("email forgotPw: ", email);
			
				if(email.length == 0){
					alertModalMessaging("이메일 주소를 입력하세요.");
				} else if(!isEmail(email)){
					alertModalMessaging("옳바른 이메일 형식이 아닙니다.");
				} else {
					checkEmail(email);
					if(!isEmailExist){
						console.log("isEmailExist:",isEmailExist);
						alertModalMessaging("등록된 이메일 주소가 아닙니다.");
					} else {
						$("#fgpw_form").submit();
					}
				}//if-elseIf-elseIf
			});//onclick .fg_pw_send_btn
		});//jquery
	</script>
	<style>
		#container{
			width: 400px;
			height: 600px;
			margin : 0 auto;
		}
		
		#fgpw_title{
			margin-top: 30px;
		}
		#fgpw_title p{
			font-size: 25px;
			text-align: center;
		}
		#fgpw_description{
			margin : 20px 0 30px 50px;
		}
		#fgpw_description p{
			font-size : 15px;
		}
		
		#fgpw_form_wrapper{
			width : 300px;
			height: 100%;
			margin : 0 auto;
		}
		form{
			margin-top: 50px;
		}
		form p{
			font-size: 15px;
			margin: 0 auto;
			text-align: center;
		}
	</style>

</head>

<body>
	<%@include file="/resources/html/header.jsp" %>

	<div id="container">
		<div id="fgpw_title">
			<p>비밀번호 찾기</p>
			<hr>
		</div>
		<div id="fgpw_description">
			<p>가입 이메일 주소로 임시 비밀번호를 발송합니다.</p>
		</div>
		<div id="fgpw_form_wrapper">
			<form class="row g-3" id="fgpw_form" action="/mypage/newPassword" method="POST">
				<div class='mb-3'>
					<label for="forgot_pw_email" class="form-label"><b>Email</b></label>
					<input type="email" class="form-control" id="forgot_pw_email" name="email"
					placeholder="가입에 사용한 이메일 주소를 입력하세요." autocomplete="username">
				</div>
				<div class="d-grid gap-2">
					<button type="submit" class="btn btn-primary mb-3 fg_pw_send_btn">SEND</button>
				</div>
			</form>
		</div>
	</div>
	
	<%@include file="/resources/html/footer.jsp" %>

</body>

</html>