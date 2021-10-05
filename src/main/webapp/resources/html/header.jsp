<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>

<html lang="ko">
	<head>
    	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FILMEE | FILM MEETING</title>
        <link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">

        <!---------- BootStrap ---------->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

        <!---------- jQuery ---------->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>

        <!---------- Social Login ---------->           
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

        <!---------- Google Recpatch ---------->
        <script src="https://www.google.com/recaptcha/api.js"></script>

        <!---------- External JS ---------->
    	  <script src="/resources/js/header.js"></script>

        <!---------- API-KEY ---------->
        <fmt:setBundle basename="application-API-KEY" var="API_KEY" />
        
        <script>
            Kakao.init('<fmt:message key="kakao-login-key" bundle="${API_KEY}"/>');
            console.log("API Initialized :", Kakao.isInitialized());

            $(function() {
              console.log('jq started.');
              //로그인 여부에 따라 보여주는 header 변경
              if("${__LOGIN__}".length > 0){	//로그인 돼있을 경우
                  $(".strangerHeadermenu").attr("style", "display:none");
                  $(".memberHeadermenu").attr("style", "display:inline");
                  $(".memberHeadermenu").attr("style", "font-size:19px");
                $(".memberHeadermenu").attr("style", "font-weight:bold");
              }//if
              //전달된 message가 있으면 alert
              switch("${message}"){
                  //회원가입 성공시
                  case 'just_joinned' :
                      alertModalMessaging("회원가입완료! 이메일 인증 완료 후 로그인 가능합니다.");
                      break;
                  //소셜로그인을 통해 회원가입시
                  case 'social_join' :
                      alertModalMessaging("회원가입완료! 카카오 계정으로 로그인 가능합니다.");
                      break;
                  //회원가입 후 이메일 인증까지 마쳤을 시
                  case 'join_complete' :
                      alertModalMessaging("이메일 인증이 완료되었습니다. 로그인 가능합니다.");
                      break;
                  //임시비밀번호 발송시
                  case 'temp_pw_sent' :
                      alertModalMessaging("임시비밀번호를 발송했습니다.");
                      break;
                  //비밀번호 찾기에서 미가입 이메일 입력시
                  case 'no_info_forgot_pw' :
                      alertModalMessaging("등록되지 않은 이메일 주소입니다.");
                      break;
                  //비밀번호 변경시
                  case 'pw_changed' :
                      alertModalMessaging("비밀번호가 변경되었습니다.");
                      break;
                  //회원 탈퇴시
                   case 'account_deleted' :
                      alertModalMessaging("회원탈퇴가 정상적으로 처리되었습니다.");
                      break;
                  //오류, 정보 불일치 등으로 실패시
                  case 'task_failed' :
                      alertModalMessaging("오류 발생! 다시 시도해주세요. 이 메세지가 반복될 시 관리자에게 문의해주세요. ");
                      break;
                  default :
              }//switch-case
              $('#header_search').on('propertychange change keyup paste input', function() {
                var selected = $('#header_select').val();                
                if(selected == 1){
                    var filmTitle = $('#header_search').val();
                    var filmTitleComplete = {filmTitle : filmTitle};
                    $.ajax({
                        url:'/search/searchFilmAutoComplete',
                        type:'post',
                        data: filmTitleComplete,
                        success : function(listFilm) { 
                            $('#autocomplete_result_list').css('display', 'inline-block');
                            $('#autocomplete_result_list').css('z-index', 3);
                            $('.searchTrTemp').remove();
                        console.log('length :' + listFilm.length);
                        for(var i = 0; i < listFilm.length; i++) {
                          console.log('poster : ' + listFilm[i].poster);
                          console.log('title : ' + listFilm[i].title);
                          $('#searchTr').append("<tr class='searchTrTemp' id='searchTr"+i+"'>");
                          $('#searchTr'+i).append("<td class='searchTd' id='searchTd"+i+"' style='width: 300px'>");                    			
                          $('#searchTd'+i).append("<a href='/film/"+listFilm[i].filmid+"'><img src='https://www.themoviedb.org/t/p/original"+listFilm[i].poster+"' style='width:150px; height:100px; float: left;'></a>");
                              $('#searchTd'+i).append("<a href='/film/"+listFilm[i].filmid+"' id='searchTitle' style='float: left;'>"+listFilm[i].title+"</a>");
                        } //for
                        } //success
                    }); //ajax
                } //if
                	
                if(selected == 2){
                  var nickname = $('#header_search').val();
                    var nicknameComplete = {nickname : nickname};
                    $.ajax({
                        url:'/search/searchUserAutoComplete',
                        type:'post',
                        data: nicknameComplete,
                        success : function(listUser) { 
                            $('#autocomplete_result_list').css('display', 'inline-block');
                            $('#autocomplete_result_list').css('z-index', 3);
                            $('.searchTrTemp').remove();
                        console.log('length :' + listUser.length);
                        for(var i = 0; i < listUser.length; i++) {
                          console.log('photo : ' + listUser[i].photo);
                          console.log('nickname : ' + listUser[i].nickname);
                          $('#searchTr').append("<tr class='searchTrTemp' id='searchTr"+i+"'>");
                          $('#searchTr'+i).append("<td class='searchTd' id='searchTd"+i+"' style='width: 300px'>");                    			
                          $('#searchTd'+i).append("<a href='/mypage/main?userid="+listUser[i].userid+"'><img src='../resources/img/"+listUser[i].photo+"' style='width:150px; height:100px; float: left;'></a>");
                              $('#searchTd'+i).append("<a href='/mypage/main?userid="+listUser[i].userid+"' id='searchTitle' style='float: left;'>"+listUser[i].nickname+"</a>");
                        } //for
                        } //success
                    }); //ajax
                } //if
              }); //propertychange change keyup paste input
                
            $('#searchBtn').on('click', function(e) {
              e.preventDefault();
	            	
					var searchForm = $('#searchSubmit');
					var selected = $('#header_select').val();
					var text = $('#header_search').val();
					
					if(selected == 1){
						
		    			searchForm.attr('action', '/search/f');
		    			searchForm.attr('method', 'GET');
		    			
		    			searchForm.find('input[name=searchWord]').val();
		    			searchForm.find('input[name=currPage]').val();
		    			searchForm.find('input[name=amount]').val();
		    			searchForm.find('input[name=pagesPerPage]').val();		    			    			
		    			
		    			searchForm.submit();
					
					} //if
	    			
					if(selected == 2){
						
						searchForm.attr('action', '/search/u');
		    			searchForm.attr('method', 'GET');
		    			
		    			searchForm.find('input[name=searchWord]').val();
		    			searchForm.find('input[name=currPage]').val();
		    			searchForm.find('input[name=amount]').val();
		    			searchForm.find('input[name=pagesPerPage]').val();		    			    			
		    			
		    			searchForm.submit();
						
					} //if
	            	
	            	
	            }); //click
            }); //.jq        
        </script>
    	
    	<style>    		
			#header {
			    width: 998px;
			    height: 150px;
			    margin: 0 auto;
			    font-size: 20px;
			    font-family: 'ELAND 초이스';
			}
			
            #header_nav_logo {
			    width: 200px;
			    margin: 0;
			}
            #autocomplete_result_list {
                position: absolute;
                top: 90px;
                right: 100px;
                
                width: 300px;
                list-style: none;
            }
            
            #header_select {
            	width: 100px;
            	height: 38px;
            }
            
            #header_search {
            	width: 300px;
            	height: 38px;
            }
            
            #forgot_pw_a_wrapper{
            	font-size: 13px;
                margin: 5px 0 0 160px;
            }
            
            #kakao_login{
                margin : auto;
            }
            .wrong_info{
                background-color: #f0adce96;
            }
    	</style>
	</head>
	<body>
	
		<header>
            <div id='header'>
	        <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                  <a class="navbar-brand" href="/main"><img id='header_nav_logo'  src='/resources/img/filmeeLogo.png'></a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                        <a class="nav-link strangerHeadermenu" data-bs-toggle="modal" data-bs-target="#login" aria-current="page" href="#" style='display: inline-block; font-size: 19px; font-weight: bold;'>Login</a>
                        <a class="nav-link memberHeadermenu" aria-current="page" href="/main/logout" style='display: none'>Logout</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link strangerHeadermenu" data-bs-toggle="modal" data-bs-target="#join" href="#" style='display: inline-block; font-size: 19px; font-weight: bold;'>Join</a>
                        <a class="nav-link memberHeadermenu" href="/mypage/main?userid=${__LOGIN__.userId}" style='display: none'>Mypage</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="/board/list" style='font-size: 19px; font-weight: bold;'>Board</a>
                      </li>                                           
                    </ul>

                    <form id='searchSubmit' class="d-flex">
                    <input type='hidden' name='currPage' value='1' >
                    <input type='hidden' name='amount' value='10' >
                    <input type='hidden' name='pagesPerPage' value='5' >
                        <select id='header_select' class="form-select" aria-label="Default select example">                            
                            <option value="1" selected>Film</option>
                            <option value="2">User</option>                            
                        </select>  
                      	<input id='header_search' class="form-control me-2" type="search" name='searchWord' placeholder="Search" aria-label="Search" style='width: 300px'>
                      	<table id='autocomplete_result_list' class='table table-hover' style='display: none; background-color: white;'>
                          <tr id='searchTr'><th style='display: none;'></th></tr>
                                                                         
                      	</table>
                      	<button id='searchBtn' class="btn btn-secondary" type="submit" style='width: 80px; font-size: 13px;'>Search</button>
                    </form>
                  </div>
                </div>
              </nav>
            </div>
    	</header>

        <!-- alert Modal -->
        <div class="modal fade" id="alert_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content"> 
                    <div class="modal-body">
                        <p style="font-size: 16px; text-align: center;"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- login Modal -->
        <div class="modal fade input_modal" id="login" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="staticBackdropLabel"><B>SIGN IN</B></h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="login_form" method="POST">
                            <div class="mb-3">
                                <label for="login_email" class="form-label"><b>Email</b></label>
                                <input type="email" class="form-control" id="login_email" name="email" placeholder="이메일 주소" autocomplete="username">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label"><b>Password</b></label><br>
                                <input type="password" class="form-control" id="login_password" name="password" placeholder="비밀번호" autocomplete="current-password">
                                <div id="forgot_pw_a_wrapper">
                                    <a href="/main/forgotPw">Forgot Password</a>
                                </div>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label" for="rememberMe"><b>Remember me</b></label>
                                <input class="form-check-input" type="checkbox" name="rememberMe" id="rememberMe">
                            </div>
                            <div class="d-grid gap-2">
                                <button type="button" 
                                class="btn btn-primary login_submit_btn g-recaptcha" 
                                data-sitekey="<fmt:message key='recaptcha-key' bundle='${API_KEY}' />"
                                data-callback='onSubmit' 
                                data-action='submit'>SIGN IN</button>
                            </div>
                        </form>
                        <p>&nbsp;</p>
                        <div class="d-grid gap-2">
                            <button type="button" class="btn btn-primary" id="close_login_open_join" data-bs-toggle="modal" data-bs-target="#join">JOIN</button>
                            <p>&nbsp;</p>
                            <div id="kakao_login"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- join Modal -->
        <div class="modal fade input_modal" id="join" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                <h2 class="modal-title" id="staticBackdropLabel"><B>SIGN UP</B></h2>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/main/joinPost" method="POST">
                        <div class="mb-3">
                            <label for="join_email" class="form-label"><b>Email</b></label>
                            <input type="email" class="form-control" id="join_email" name="email" placeholder="이메일 주소" autocomplete="username"
                            oninput="javascript:checkEmail( $('#join_email').val() )">
                            <p class='input_message' id='email_message'></p>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label"><b>Password</b></label>
                            <input type="password" class="form-control" id="join_password" name="password" placeholder="비밀번호" oninput="javascript:checkPw()" autocomplete="new-password">
                            <p class='input_message' id='pw_message'></p>
                        </div>
                        <div class="mb-3">
                            <label for="nickname" class="form-label"><b>Nickname</b></label>
                            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임" oninput="javascript:checkNickname($('#nickname').val())">
                            <p class='input_message nickname'></p>
                            </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary sign_up_btn" disabled><b>SIGN UP</b></button>
                            <!-- <button type="submit" 
                            class="btn btn-primary sign_up_btn g-recaptcha" data-sitekey="6Lde0E4cAAAAALC52i_2yWY1ihnWWwRKIHtrtlln"
                            data-callback='onSubmit'
                            data-action='submit' disabled>SIGN UP</button> -->

                        </div>
                    </form>
                </div>
            </div>
            </div>
        </div>

        <!-- socail_join Modal -->
        <div class="modal fade input_modal" id="social_join" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                <h2 class="modal-title" id="staticBackdropLabel"><b>SOCIAL SIGN UP</b></h2>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/main/joinPost" method="POST">
                        <div class="mb-3">
                            <input type="hidden" name="email" id="social_join_email">
                            <input type="hidden" name="password">
                            <input type="hidden" name="fromWhere" id="fromWhere">

                            <label for="nickname" class="form-label"><b>Nickname</b></label>
                            <input type="text" class="form-control" id="social_nickname" name="nickname" placeholder="닉네임" oninput="javascript:checkNickname($('#social_nickname').val())">
                            <p class='input_message nickname'></p>
                            </div>
                        <div class="d-grid gap-2">
                            <button class="btn btn-primary sign_up_btn" type="submit" disabled><b>SIGN UP</b></button>
                        </div>
                    </form>
                </div>
            </div>
            </div>
        </div>         
	</body>

</html>