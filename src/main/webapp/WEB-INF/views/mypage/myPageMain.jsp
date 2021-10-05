<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>FILMEE | FILM MEETING</title>
    <link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>    

	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css'/>

    <link rel="stylesheet" href="/resources/css/layout.css">
    <link rel="stylesheet" href="/resources/css/swiper.css">
    
    <script src="../resources/js/jquery-1.8.3.min.js"></script>
    <script src="../resources/js/swiper.js"></script>

    <script>
        window.onload = function(){
            var swiper = new Swiper('.swiper-container', {
                         pagination: '.swiper-pagination',
                         paginationType: 'progress',
                         slidesPerView: 'auto',
                         paginationClickable: true,
                         spaceBetween: 0,
                         freeMode: true,
                         nextButton: '.next',
                         prevButton: '.back'
             });
        };        
        		
		function deleteMainReview(rno) {
			
			if(confirm('삭제하시겠습니까?')) {
			
				let formObj = $('#form_'+rno);
				
				formObj.attr("action", "/mypage/deleteMainReview");
				formObj.attr("method", "POST");					
			  
			  	formObj.submit();
			} else {
				;;
			} //if-else
		} //deleteMainReview
		
		function deleteMainGuestbook(gno) {
			if(confirm('삭제하시겠습니까?')) {
				
				let formObj = $('#form_'+gno);
				
				formObj.attr("action", "/mypage/deleteMainGuestbook");
				formObj.attr("method", "POST");					
			  
			  	formObj.submit();
			} else {
				;;
			} //if-else
		} //deleteMainGuestbook
		
		function insertFollow(follower, followee) {
							
			let formObj = $('#insertFollow');
			
			formObj.attr("action", "/mypage/insertFollow");
			formObj.attr("method", "POST");					
		  
		  	formObj.submit();
		
		} //insertFollow
		
		function deleteFollow(follower, followee) {
			
			let formObj = $('#deleteFollow');
			
			formObj.attr("action", "/mypage/deleteFollow");
			formObj.attr("method", "POST");					
		  
		  	formObj.submit();
		
		} //deleteFollow
	
		//====== 비밀번호 수정 ======
        // input에 입력시 유효성을 체크할 변수
        var isCurrentPwChecked = false;
        var isNewPwValid = false;
        var isNewPwConfirmed = false;
                
        //모든 input 태그의 유효성 검사가 성공적이면 Change버튼 활성화
        function isChangeBtnValid(){
            if(isCurrentPwChecked && isNewPwValid && isNewPwConfirmed){
                // console.log("good to go");
                $(".new_pw_submit_btn").prop("disabled", false);
            }else{
                // console.log("failed");
                $(".new_pw_submit_btn").prop("disabled", true);
            }//if-else
        }//isChangeBtnValid
        //현재 비밀번호 검증
        function checkCurrentPw(){
            var currentPw = $('#current_pw').val();
            $.ajax({
                data : {
                    email : '${__LOGIN__.email}',
                    password : currentPw
                },
                type:'post',
                url : "/mypage/checkCurrentPw",
                dataType:'json',
                success : function(data){
                    if(currentPw == 0){
                        isCurrentPwChecked = false;
                        $("#current_pw_message").text("");
                        // $(".new_pw_submit_btn").prop("disabled", true);
                    } else if (data == 0) {
                        isCurrentPwChecked = false;
                        $("#current_pw_message").text("현재 비밀번호와 일치하지 않습니다.❌🙅🏻🙅🏻‍♀🤦🏻‍♂🤦🏻🤷🏻‍♀🤷🏻‍♂");
                        // $(".new_pw_submit_btn").prop("disabled", true);
                    } else if (data == 1) {
                        isCurrentPwChecked = true;
                        $("#current_pw_message").text("✅☑✔👌🙆🏻‍♂🙆🏻‍♀🙆‍♀");
                        // $(".new_pw_submit_btn").prop("disabled", false);
                    }//if-elseif-elseif-elseif
                    isChangeBtnValid();
                }//success
            });//ajax
        };//checkCurrentPw
        //새비밀번호의 유효성 검증과 비밀번호 확인
        function confirmNewPw(){
            var newPw = $('#new_pw_input').val();
            npLeng=newPw.length;
            var confirmPw = $('#confirm_pw_input').val();
            if(npLeng==0){
                isNewPwValid = false;
                $("#new_pw_message").text("");
                // $("#new_pw_input").css("background-color", "");
            }else if(npLeng < 6){
                isNewPwValid = false;
                $("#new_pw_message").text("비밀번호는 6자리 이상이어야 합니다.❌🙅🏻🙅🏻‍♀🤦🏻‍♂🤦🏻🤷🏻‍♀🤷🏻‍♂");
                // $("#new_pw_input").css("background-color", "#FFCECE");
            }else{
                isNewPwValid = true;
                $("#new_pw_message").text("✅☑✔👌🙆🏻‍♂🙆🏻‍♀🙆‍♀");
                // $("#new_pw_input").css("background-color", "#C2DBFE");
            }//if-elseif-else
            if(confirmPw.length == 0){
                isNewPwConfirmed = false;
                $("#confirm_pw_message").text("");
                // $(".new_pw_submit_btn").prop("disabled", true);
                // $("#confirm_pw_input").css("background-color", "");
            }else if(confirmPw != newPw){
                isNewPwConfirmed = false;
                $("#confirm_pw_message").text("비밀번호가 일치하지 않습니다.❌🙅🏻🙅🏻‍♀🤦🏻‍♂🤦🏻🤷🏻‍♀🤷🏻‍♂");
                // $(".new_pw_submit_btn").prop("disabled", true);
                // $("#confirm_pw_input").css("background-color", "#FFCECE");
            } else{
                isNewPwConfirmed = true;
                $("#confirm_pw_message").text("✅☑✔👌🙆🏻‍♂🙆🏻‍♀🙆‍♀");
                // $(".new_pw_submit_btn").prop("disabled", false);
                // $("#confirm_pw_input").css("background-color", "#C2DBFE");
            }//if- elseif -else
            isChangeBtnValid();
        };//pwConfirm

        
        
        $(function(){
        	
        	console.log('jq started.')
        	
	        $(document).on("change", "input[name=file]", function(e){
	        	   var $file = $(this);
	        	   var $preview = $("#profilePhotoImg");
	        	   
	        	   var reader = new FileReader();
	        	   reader.onload = function(e) {
	        	      $preview.attr("src", e.target.result);
	        	   };	        	 
	        	   
	        	   reader.readAsDataURL($file[0].files[0]);
	        	});
        }); //jq
        
        
        $(function(){
            console.log('jq started');
            $("#agree_cb").on('click', function(){
                var agreeCb = $("#agree_cb").prop("checked");
                console.log("agreeCb :", agreeCb);
                if(agreeCb){
                    $("#del_acc_btn").prop("disabled", false);
                } else {
                    $("#del_acc_btn").prop("disabled", true);
                }//if-else
            });//agree_cb onclick
            $("#del_acc_btn").on('click', function(e){
                e.preventDefault();     //submit 취소
                if("${__LOGIN__.email}".includes("SOC.KAKAO_")){    //현재 로그인된 계정이 카카오 계정이라면
                    Kakao.API.request({     //카카오 간편로그인 token 해제
                        url: '/v1/user/unlink',
                        success: function(response) {
                            console.log(response);
                            $("#del_acc_form").submit();    //DB에서 탈퇴처리
                        },
                        fail: function(error) {
                            console.log(error);
                        }
                    });//Kakao.API,request
                }else {         //현재 로그인된 계정이 일반계정이라면
                    $("#del_acc_form").submit();    
                }//if-else
            });//del_acc_btn onclick
            
        });//jq
     

    </script>

    <style>
    
    	* {
    		text-decoration-line: none !important;
    	}
        #container {
            width: 998px;
            margin: 0 auto;
            font-family:'Florencesans SC Exp', 'ELAND 초이스'; 
            font-family: 'ELAND 초이스'; 
        }
        #mypage_info {
            width: 100%;
            height: 300px;            
        }
        #mypage_profile {
            width: 50%;
            height: 300px;           
            padding-left: 10px;
            padding-right: 10px;
            
            float: left;
        }

        
        #userProfileRegBtn {
        	margin-top: 15px;
        }

        #mypage_usable-statistics {
            width: 50%;
            height: 300px;          
            
            float: right;
        }
        #img-thumbnail {
            width: 230px;
            height: 160px;
            float: left;
        }
        #form-control {
            width: 230px;
            height: 160px;
            float: right;
        }
       #userRegBtn {
       		margin-top: 15px;
       }
       
       #followBtn {
       		margin-top: 15px;
       }
       
       #unfollowBtn {
       		margin-top: 15px;
       }
       
       #followListBtn {
       		float: right;
       		margin-top: 15px;
       }       
        #follower_count {
            width: 45%;
            height: 45%;
            float: left;
        }
        #following_count {
            width: 45%;
            height: 45%;
            float: right;
        }
        #watched_film_count {
            width: 45%;
            height: 45%;
            float: left;
        }
        #my_review_count {
            width: 45%;
            height: 45%;
            float: right;
        }
        
        
        #mypage_usable-statistics li {
            text-align: center;
            line-height: 40px;
            font-size: 20px;
        }
        .inWrap {
            padding-left: 10px;
            padding-right: 10px;
        }      
        
        #myFilmsBtn {
        	margin-left: 900px;
        }      
        
        #film_poster {
            width: 200px;
            
        }
        
         .inner-star::before {
            color: yellow;
        }
        
        .outer-star {
            position: relative;
            display: inline-block;
            color: rgb(177, 175, 175);
        }
        
        .inner-star {
            position: absolute;
            left: 0;
            top: 0;
            width: 0%;
            overflow: hidden;
            white-space: nowrap;
        }
        
        .outer-star::before, .inner-star::before {
            content: '\f005 \f005 \f005 \f005 \f005';
            font-family: 'Font Awesome 5 free';
            font-weight: 900;
        }
        #mypage_review_content {             
            overflow: hidden;
        	text-overflow: ellipsis;
        	white-space: normal;
        	line-height: 1.2;
        	text-align: left;
        	word-wrap: break-word;
        	display: -webkit-box;
        	-webkit-line-clamp: 5 ;
       		-webkit-box-orient: vertical;  			
        }
        
        #mypage_button {
        	position: relative
        }
        #reviewDelBtn {
        	position: absolute;
        	bottom: 10px;
       		right: 20px;
       }
       
       .activity_a {
        	color: blue !important;
        	font-weight: bold;
        }
        
        #activity_review_content_a {
        	display: inline-block;
        	white-space: nowrap;
        	overflow: hidden;
        	text-overflow: ellipsis;
        	width: 150px;
        	        	
        	color: blue;
        	font-weight: bold;        	
        }
        
        #myReviewsBtn {
        	margin-left: 900px;
        }
        
        #activityBtn {
        	margin-left: 320px;
        }
        
        #guestbookBtn {
        	margin-left: 500px;
        	margin-top: 20px;
        }
        
        
        
    </style>
	
</head>

<body>

	<%@ include file="/resources/html/header.jsp" %>
   
    <div id='container'>
   
        <div id='mypage_info'>

            <div id='mypage_profile'>
                <h1 class="display-6">PROFILE</h1>            
                
                <hr>
                
                <div id='mypage_profile_photo_text'>

                    <img id='img-thumbnail' src="https://younghoon.s3.ap-northeast-2.amazonaws.com/${userVO.photo}" class="img-thumbnail" alt="..." >
               
                    <input id='form-control' class="form-control" type="text" value="${userVO.text}" aria-label="readonly input example" readonly>

                </div>

            <c:set var='userid' value='${cri.userid}' />
            <c:set var='sessionUserid' value='${__LOGIN__.userId}' />
            <c:set var='isFollowed' value='#{isFollowed}' />
                <button type="button" id='userRegBtn' class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#new_pw" style="${sessionUserid eq userid ? 'display:inline' : 'display:none'}">Register</button>
                <button type="button" id='userProfileRegBtn' class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#registerProfile" style="${sessionUserid eq userid ? 'display:inline' : 'display:none'}">RegisterProfile</button>
                
              <c:choose>
                 <c:when test="${isFollowed eq '0'}">
                    <c:choose>
                    <c:when test="${userid eq sessionUserid}">
                       <button type="button" id='noneBtn' class="btn btn-outline-info" style='display: none'>None</button>
                       <button type="button" id='followListBtn' class="btn btn-outline-info" onclick="location.href='/mypage/follower?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5'">FollowList</button>
                    </c:when>
                    <c:when test="${userid ne sessionUserid}">
                       <form action="/mypage/insertFollow" method="POST" id='insertFollow'>                       
                          <input type='hidden' name='sessionUserid' value='${__LOGIN__.userId}'>
                        <input type='hidden' name='userid' value='${cri.userid}'>
                          <button type="button" id='followBtn' class="btn btn-outline-info" onclick="insertFollow('${cri.userid}', '${__LOGIN__.userId}')">Follow</button>
                          <button type="button" id='followListBtn' class="btn btn-outline-info" onclick="location.href='/mypage/follower?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5'">FollowList</button>
                       </form>   
                    </c:when>
                    </c:choose>
                 </c:when>
                 <c:when test="${isFollowed eq '1'}">
                    <form action="/mypage/deleteFollow" method="POST" id='deleteFollow'>                       
                       <input type='hidden' name='sessionUserid' value='${__LOGIN__.userId}'>
                     <input type='hidden' name='userid' value='${cri.userid}'>
                       <button type="button" id='unfollowBtn' class="btn btn-outline-danger" onclick="deleteFollow('${cri.userid}', '${__LOGIN__.userId}')">UnFollow</button>
                       <button type="button" id='followListBtn' class="btn btn-outline-info" onclick="location.href='/mypage/follower?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5'">FollowList</button>
                    </form>
                 </c:when>
                 <c:when test="${isFollowed eq '2'}">
                    <button type="button" id='noneBtn' class="btn btn-outline-info" style='display: none'>None</button>
                    <button type="button" id='followListBtn' class="btn btn-outline-info" onclick="location.href='/mypage/follower?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5'">FollowList</button>
                 </c:when>
              </c:choose>
 
            </div>

            <div id='mypage_usable-statistics'>
                <h1 class="display-6">User-Statistics</h1>

            <hr>
   
                <div id='follower_count'>
                    <ul>
                        <li><a href='/mypage/follower?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5' style='color: black;'>Follower</a></li>
                        <li><a href='/mypage/follower?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5' style='color: black;'>${followees}</a></li>
                    </ul>
                </div>

                <div id='following_count'>
                    <ul>
                        <li><a href='/mypage/followee?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5' style='color: black;'>Following</a></li>
                        <li><a href='/mypage/followee?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5' style='color: black;'>${followers}</a></li>
                    </ul>
                </div>

                <div id='watched_film_count'>
                    <ul>
                        <li><a href='/mypage/films?userid=${cri.userid}&code=2&currPage=1&amount=5&pagesPerPage=5' style='color: black;'>Watched</a></li>
                        <li><a href='/mypage/films?userid=${cri.userid}&code=2&currPage=1&amount=5&pagesPerPage=5' style='color: black;'>${films}</a></li>
                    </ul>
                </div>

                <div id='my_review_count'>
                    <ul>
                        <li><a href='/mypage/myreviews?userid=${cri.userid}&currPage=1&amount=5&pagesPerPage=5' style='color: black;'>MyReviews</a></li>
                        <li><a href='/mypage/myreviews?userid=${cri.userid}&currPage=1&amount=5&pagesPerPage=5' style='color: black;'>${reviews}</a></li>
                    </ul>
                </div>
            </div>

        </div> 
        
        <hr>       

        <section class="feature">            
            
            <div class="inWrap">            

                <h1 class="display-6">Favorite Films</h1>

            <hr>         
                
                <div class="fInner swiper-container">
                    <ul class="swiper-wrapper">
                      <c:forEach items="${filmVO}" var="filmVO">
                           <li class="swiper-slide"><a href="/film/${filmVO.filmid}" style='background: url(https://www.themoviedb.org/t/p/original${filmVO.poster}) center center no-repeat; background-size: cover;'>
                           <span>${filmVO.title}<br>(${filmVO.year})</span></a></li>                        
                      </c:forEach>    
                    </ul>             
                    
                    <div class="swiper-pagination"></div>                    
         
                </div>
                <div class="button">
                    <div class="back"><a href="#" style='background: url(../resources/img/back-svgrepo-com.svg) center center no-repeat; background-size: 30px 30px;'><span class="hidden"></span></a></div>
                    <div class="next"><a href="#" style='background: url(../resources/img/next-svgrepo-com.svg) center center no-repeat; background-size: 30px 30px;'><span class="hidden"></span></a></div>
                </div>
            </div>
            
            <button type="button" id='myFilmsBtn' class="btn btn-outline-info" onclick="location.href='/mypage/films?userid=${cri.userid}&code=1&currPage=1&amount=5&pagesPerPage=5'">more</button>
        </section>
        
        <hr>        

        <div id='mypage_review'>
        

        	<h1 class="display-6">My Reviews</h1>
        	
        	<hr>
        	
			<c:forEach items="${reviewVO}" var="reviewVO">
        	<form action="/mypage/deleteMainReview" method="POST" id='form_${reviewVO.rno}'>
        	
			
				<input type='hidden' name='userid' value='${cri.userid}'>			
					
	                <div class='row'>
	
	                    <div class='col-3'>
	                        <a href='/film/${reviewVO.filmid}'><img src='https://www.themoviedb.org/t/p/original${reviewVO.poster}' id='film_poster'></a>
	                    </div>
	
	                    <div class='col-9' id='mypage_button'>
	                    
	                    	<a href='/film/${reviewVO.filmid}'  id='mypage_review_title' style='font-size: 25px;'>${reviewVO.title}</a><br>
	                    	
	                    	<div class='RatingStar'>
	                            <div class='RatingScore'>
	                                <div class='outer-star'>	                                
	                                	<div class='inner-star' style='width: ${reviewVO.width}%'></div>
	                                </div>
	                            </div>
	                        </div>	                     
	                        
	                        <h4>${reviewVO.rate} / 5</h4>
	                        
	                        <hr>   	                    	                         
	
	                        <div class='mypage_review_content' id='mypage_review_content'>
	
	                            <a href='/film/${reviewVO.filmid}/review/${reviewVO.rno}' style='font-size: 17px; color: black;'>${reviewVO.content}</a>
	
	                        </div>
	                        
	                        <input type='hidden' value='${reviewVO.rno}' name='rno'>
	                        
	                        <c:set var='userid' value='${cri.userid}' />
							<c:set var='sessionUserid' value='${__LOGIN__.userId}' />	                        
	                    	<button id='reviewDelBtn' onclick="deleteMainReview('${reviewVO.rno}')" type='button' class="btn btn-outline-danger btn-sm" style="${sessionUserid eq userid ? 'display:inline' : 'display:none'}">Del</button>                    	
	                        
	                    </div>
	
	                </div>
	                <hr>

                
                </form>
                </c:forEach>
                <button type="button" id='myReviewsBtn' class="btn btn-outline-info" onclick="location.href='/mypage/myreviews?userid=${cri.userid}&currPage=1&amount=5&pagesPerPage=5'">more</button>
        </div>

        <div class='row' id='mypage_bottom'>

            <div class='col-7' id='mypage_guestbook'>
            
               <div id='mypage_guest_book'>
   
                   <hr>
   
                   <div id='section_table'>            
                       
                  <h1 class="display-6">GuestBook</h1>
                       
                       <hr>
                  <table class="table table-striped table-hover">               
                     <thead>
                        <tr>
                           <th>Content</th>
                           <th>nickname</th>
                                   <th></th>                                             
                        </tr>
                     </thead>
                           
                     <tbody>                     
                     <c:forEach items="${guestbookVO}" var="guestbookVO">
                        <form action="/mypage/deleteMainGuestbook" method="POST" id='form_${guestbookVO.gno}'>
                           <input type='hidden' name='gno' value='${guestbookVO.gno}'>
                           <input type='hidden' name='userid' value='${cri.userid}'>
                           <tr>
                              <td>${guestbookVO.content}</td>                        
                              <td><a class='guestbook_a' href='/mypage/main?userid=${guestbookVO.writer}'>${guestbookVO.nickname}</a></td>
                              <c:set var='userid' value='${cri.userid}' />
                              <c:set var='sessionUserid' value='${__LOGIN__.userId}' />                              
                                      <td><button onclick="deleteMainGuestbook('${guestbookVO.gno}')" type="button" class="btn btn-outline-danger btn-sm" style="${sessionUserid eq userid ? 'display:inline' : 'display:none'}">Del</button></td>                        
                           </tr>                                  
                        </form>
                     </c:forEach>
                     </tbody>                  
                  </table>
                                    
                  <form action="/mypage/insertGuestbook" method="POST">
                     <div class="input-group">                    
                       <c:set var='userid' value='${cri.userid}' />
                       <c:set var='sessionUserid' value='${__LOGIN__.userId}' />
                       <c:choose>
                            <c:when test="${sessionUserid ne null}">
                       
                             <textarea id='form-control' class="form-control" aria-label="With textarea" name='content'></textarea>
                             <input type='hidden' name='userid' value='${cri.userid}'>
                             <input type='hidden' name='owner' value='${cri.userid}'>
                             <input type='hidden' name='writer' value='${__LOGIN__.userId}'>
                             
                             <button type='submit' class="btn btn-info">Submit</button>
                          </c:when>
                          <c:otherwise>
                             <textarea id='form-control' class="form-control" aria-label="With textarea" name='content' readonly>방명록을 작성하려면 로그인해주세요.</textarea>
                             <input type='hidden' name='userid' value='${cri.userid}'>
                             <input type='hidden' name='owner' value='${cri.userid}'>
                             <input type='hidden' name='writer' value='${__LOGIN__.userId}'>
                             
                             <button type='submit' class="btn btn-info" disabled>Submit</button>
                          </c:otherwise>
                       </c:choose>
                     </div>
                  </form>               
               </div>                               
               </div>
            
            <button type="button" id='guestbookBtn' class="btn btn-outline-info" onclick="location.href='/mypage/guestbook?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5'">more</button>

            </div>

            <div class='col-5' id='mypage_activity'>
            
               <div id='mypage_activity_log'>
   
                   <hr>
   
                   <div id='section_table'>            
                       
                  <h1 class="display-6">Activity</h1>
                       
                       <hr>
   
                  <table class="table table-striped table-hover">               
                     <thead>
                        <tr>
                           <th>Content</th>
                           <th>insert_ts</th>
                                   <th></th>                                             
                        </tr>
                     </thead>
                     
                     <tbody>
                        <c:forEach items="${activityVO}" var="activityVO">
                        
                           <tr>
                              <c:set var='type' value='${activityVO.type}' />
                              
                              <c:choose> 
                                  <c:when test="${type eq 'RV'}">
                                      <td id='activity_review_content_td'>
                                         <a class='activity_a' href='/mypage/main?userid=${activityVO.userid}'>${activityVO.nickname}</a>님이 
                                         <a class='activity_a' href='/film/${activityVO.filmid}'>${activityVO.title}</a>영화에 
                                         <a class='activity_a' href='/film/${activityVO.filmid}/review/${activityVO.rno}' id='activity_review_content_a'>${activityVO.content}</a> 리뷰를 작성하였습니다.
                                      </td>
                                      <td>${activityVO.insertTs}</td>
                                  </c:when>
                                  <c:when test="${type eq 'FW'}">
                                      <td>
                                         <a class='activity_a' href='/mypage/main?userid=${activityVO.followerid}'>${activityVO.nickname}</a>님이 
                                         <a class='activity_a' href='/mypage/main?userid=${activityVO.userid}'>${activityVO.nicknameFollower}</a>님을 팔로우 하였습니다.
                                      </td>
                                      <td>${activityVO.insertTs}</td>
                                  </c:when>
                                  <c:when test="${type eq 'RL'}">
                                      <td>
                                         <a class='activity_a' href='/mypage/main?userid=${activityVO.userid}'>${activityVO.nickname}</a>님이                                      
                                         <a class='activity_a' href='/film/${activityVO.reviewFilmId}/review/${activityVO.rno}' id='activity_review_content'>${activityVO.content}</a> 리뷰를 좋아합니다.                                      
                                      </td>
                                      <td>${activityVO.insertTs}</td>
                                  </c:when>
                                  <c:when test="${type eq 'GB'}">
                                     
                                      <td>
                                         <a class='activity_a' href='/mypage/main?userid=${activityVO.writer}'>${activityVO.nicknameGuestbook}</a>님이 방명록을 작성하였습니다.                                                                         
                                      </td>
                                      <td>${activityVO.insertTs}</td>
                                      
                                  </c:when>
                                  <c:when test="${type eq 'FL'}">
                                      <c:set var='code' value='${activityVO.code}' />
                                      <c:choose>
                                         <c:when test="${code eq '1'}">
                                            <td>
                                               <a class='activity_a' href='/mypage/main?userid=${activityVO.userid}'>${activityVO.nickname}</a>님이 
                                               <a class='activity_a' href='/film/${activityVO.filmid}'>${activityVO.title}</a>영화를 좋아합니다.
                                            </td>
                                            <td>${activityVO.insertTs}</td>
                                         </c:when>
                                         <c:when test="${code eq '2'}">
                                            <td>
                                               <a class='activity_a' href='/mypage/main?userid=${activityVO.userid}'>${activityVO.nickname}</a>님이 
                                               <a class='activity_a' href='/film/${activityVO.filmid}'>${activityVO.title}</a>영화를 본영화에 추가했습니다.
                                            </td>
                                            <td>${activityVO.insertTs}</td>
                                         </c:when>
                                         <c:when test="${code eq '3'}">
                                            <td>
                                               <a class='activity_a' href='/mypage/main?userid=${activityVO.userid}'>${activityVO.nickname}</a>님이 
                                               <a class='activity_a' href='/film/${activityVO.filmid}'>${activityVO.title}</a>영화를 볼영화에 추가했습니다.
                                            </td>
                                            <td>${activityVO.insertTs}</td>
                                         </c:when>
                                      </c:choose>
                                  </c:when>
                              </c:choose>                           
                                 
                           </tr>
                           
                                 </c:forEach>         
                     </tbody>                  
                  </table>
                  
                  <button type="button" id='activityBtn' class="btn btn-outline-info" onclick="location.href='/mypage/activity?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5'">more</button>               
               </div>                               
   
               </div>

            </div>

        </div>

      <hr>
   
    </div>
        
    <!-- new_pw Modal -->
    <div class="modal fade" id="new_pw" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered  modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="staticBackdropLabel"><B>CHANGE PASSWORD</B></h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/mypage/newPassword" method="POST">
                        <input type="hidden" name="email" value="${__LOGIN__.email}">
                        <div class="mb-3">
                            <label for="current_pw" class="form-label"><b>Current Password</b></label>
                            <input type="password" class="form-control" id="current_pw" placeholder="현재 비밀번호" oninput="javascript:checkCurrentPw()" autocomplete="current-password">
                            <p class="input_MSG" id='current_pw_message'></p>
                        </div>
                        <div class="mb-3">
                            <label for="new_pw" class="form-label"><b>New Password</b></label>
                            <input type="password" class="form-control" id="new_pw_input" placeholder="비밀번호 확인" name="password" autocomplete="new-password" oninput="javascript:confirmNewPw()">
                            <p class="input_MSG" id='new_pw_message'></p>
                        </div>
                        <div class="mb-3">
                            <label for="confirm_pw" class="form-label"><b>Confirm Password</b></label>
                            <input type="password" class="form-control" id="confirm_pw_input" placeholder="비밀번호 확인" oninput="javascript:confirmNewPw()">
                            <p class="input_MSG" id='confirm_pw_message'></p>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary new_pw_submit_btn" disabled>CHANGE</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- registerUserProfile -->
    <div class="modal fade" id="registerProfile" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">

        <div class="modal-dialog modal-dialog-centered">

            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="staticBackdropLabel"><B>REGISTER PROFILE</B></h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                	<form action="/mypage/registerUserProfile" method="POST" enctype="multipart/form-data">
                	<input type='hidden' name='userid' value='${cri.userid}'>
			        <img id='profilePhotoImg' src="https://younghoon.s3.ap-northeast-2.amazonaws.com/${userVO.photo}" class="img-thumbnail" alt="..." style='width:230px; height:230px;'>
			        <input id='form-control' class="form-control" type="text" name='profileText' value="${userVO.text}" aria-label="readonly input example" style='width:230px; height:230px;'>
			        <div class="mb-3">
					  <label for="formFile" class="form-label"></label>
					  <input class="form-control" type="file" id="profilePhoto" name="file">
					</div>
			        <div class="input-group input-group-sm mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-lg">Nickname</span>
					  <input type="text" class="form-control" name='nickname' id='registerNickname' value='${userVO.nickname}' aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" oninput="checkNickname($('#registerNickname').val())">
					  <p id='nick_message' class='input_message nickname'></p>
					</div>
			        <button type="submit" id='submitBtn' class="btn btn-outline-info" style='float:right;'>Submit</button>
			        </form>
			        
			        <!-- Button trigger modal -->
				     <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#del_acc_modal">
				         회원탈퇴
				     </button>         

                </div>
                
            </div>
        </div>
        
    </div>
    
    

     <!-- del_acc_modal -->
     <div class="modal fade" id="del_acc_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
         <div class="modal-dialog">
         <div class="modal-content">
             <div class="modal-header">
             <h5 class="modal-title" id="staticBackdropLabel"><b>DELETE ACCOUNT</b></h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
                 <h5>삭제된 계정은 복구가 불가능하며, 회원님이 작성하신 게시물과 영화 리뷰를 제외한 모든 정보는 탈퇴 즉시 삭제됩니다.
                 <strong>탈퇴 하시겠습니까?</strong></h5>
                 <p>&nbsp;</p>

                 <form action="/main/deleteAccount" id="del_acc_form" method="POST">
                     <div class="form-check">
                         <input class="form-check-input" type="checkbox" value="" id="agree_cb">
                         <label class="form-check-label" for="agree_cb">
                         회원탈퇴에 대한 주의사항을 모두 읽었고, 이에 동의합니다.
                         </label>
                     </div>
                     <hr>
                     <div class = row align-items-center">
                         <input type="hidden" name="userId" value="${__LOGIN__.userId}">
                         <button type="button" class="btn btn-secondary col" id="del_acc_btn" disabled>회원탈퇴</button>
                         <button type="button" class="btn btn-primary col" data-bs-dismiss="modal">취소</button>
                     </div>
                 </form>
             </div>
         </div>
         </div>
     </div>
    
    <%@include file="/resources/html/footer.jsp" %>

</body>
</html>