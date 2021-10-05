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
    
    <script>
    
	    $(function() {
	        
		    $('a#prev, a#next').on('click', function(e) {				
				
				e.preventDefault();				
				
				var paginationForm = $('#form_pagination');
				
				paginationForm.attr('action', '/mypage/follower');
				paginationForm.attr('method', 'GET');
				
				paginationForm.find('input[name=userid]').val('${pageMaker.criF.userid}');
				paginationForm.find('input[name=currPage]').val($(this).attr('href'));
				paginationForm.find('input[name=amount]').val('${pageMaker.criF.amount}');
				paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.criF.pagesPerPage}');
				
				paginationForm.submit();
			});	//onclick
			
		}); //jq
		
		function cancelFollower(follower, followee) {
			if(confirm('팔로우 취소하시겠습니까?')) {
				
				let formObj = $('#form_'+follower+'_'+followee);
				
				formObj.attr("action", "/mypage/cancelFollower");
				formObj.attr("method", "POST");					
			  
			  	formObj.submit();
			} else {
				;;
			} //if-else
		} //deleteMainGuestbook
    
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
        #mypage_top_menu {
            font-size: 16px;
        }
        #mypage_mid_menu {
            font-size: 14px;
        }
        
        #mypage_follows {
        	position: relative;
        }
        #profile_photo {
            width: 150px;
            height: 100px;
        }        
        #cancelBtn {
        	position: absolute;
        	left: 170px;
        	bottom: 15px;
        }
        
        a.nav-link.active {
        	background-color: #C2DBFE  !important;
        }
    
    </style>

</head>
<body>

    <%@ include file="/resources/html/header.jsp" %>

<section>

        <div id='container'>

            <div id='mypage_top_menu'>

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    
                    <div class="container-fluid">
                      
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                      
                        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                        
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 nav-pills" style='font-size: 20px; font-weight: bold;'>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/activity?userid=${pageMaker.criF.userid}&currPage=1&amount=10&pagesPerPage=5">ACTIVITY</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/films?userid=${pageMaker.criF.userid}&code=1&currPage=1&amount=5&pagesPerPage=5">FILMS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/myreviews?userid=${pageMaker.criF.userid}&currPage=1&amount=5&pagesPerPage=5">REVIEWS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">FOLLOWS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/guestbook?userid=${pageMaker.criF.userid}&currPage=1&amount=10&pagesPerPage=5">GUESTBOOK</a>
                            </li>
                        </ul>                        
                      </div>


                    </div>
                  
                </nav>

            </div>

            <div id='mypage_mid_menu'>

                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="#">Following</a>
                    </li>
                    
                    <li class="nav-item">
                      <a class="nav-link" href="/mypage/followee?userid=${pageMaker.criF.userid}&currPage=1&amount=10&pagesPerPage=5">Followee</a>
                    </li>                    
                    
                  </ul>

            </div>
            
             <hr> 
         
         <c:forEach items="${followers}" var="followers">
            <form action="/mypage/cancelFollower" method="POST" id='form_${followers.follower}_${followers.followee}'>
            <input type='hidden' name='follower' value='${followers.follower}'>
            <input type='hidden' name='followee' value='${followers.followee}'>
            <input type='hidden' name='userid' value='${pageMaker.criF.userid}'>            
            <input type='hidden' name='currPage' value='${pageMaker.criF.currPage}'>
            <input type='hidden' name='amount' value='${pageMaker.criF.amount}'>
            <input type='hidden' name='pagesPerPage' value='${pageMaker.criF.pagesPerPage}'>
                  <div id='mypage_follows' class='container-sm'>                        
      
                     <div>
                         <a href='/mypage/main?userid=${followers.follower}'><img src='../resources/img/${followers.photo}' id='profile_photo'></a>
                     </div>                                            
         
                     <div class='mypage_follow_nickname'>
                         <a href='/mypage/main?userid=${followers.follower}' style='font-size: 17px'>${followers.nickname}</a>
                     </div>
                           
                     <button id='cancelBtn' onclick="cancelFollower('${followers.follower}', '${followers.followee}')" type="button" class="btn btn-outline-danger btn-sm">Cancel</button>                 
                   
                      <hr>
      
                  </div>
               </form>
         </c:forEach>            

            <div id='section_pagination'>
                
                <form id='form_pagination'>
                   <input type='hidden' name='userid'>
                    <input type='hidden' name='currPage'>
                    <input type='hidden' name='amount'>
                    <input type='hidden' name='pagesPerPage'>                                   
                    
                    <nav aria-label="Page navigation example">
                      <ul class="pagination">
                          <c:if test='${pageMaker.prev}'>
                            <li class="page-item">                      
                              <a id='prev' class="page-link" href='${pageMaker.startPage - 1}' aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                              </a>
                            </li>
                        </c:if>
                        
                        <c:forEach begin='${pageMaker.startPage}' end='${pageMaker.endPage}' var='pageNum'>
                      <li class="${pageMaker.criF.currPage == pageNum ? 'page-item active' : 'page-item'}">
                         <a class="page-link" href="/mypage/follower?userid=${pageMaker.criF.userid}&currPage=${pageNum}&amount=${pageMaker.criF.amount}&pagesPerPage=${pageMaker.criF.pagesPerPage}">${pageNum}</a>
                      </li>
                  </c:forEach>

                        <c:if test='${pageMaker.next}'>   
                            <li class="page-item">
                              <a id='next' class="page-link" href='${pageMaker.endPage + 1}' aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                              </a>
                            </li>
                        </c:if>
                      </ul>
                    </nav>
                </form>
            </div>

        </div>

    </section>
    
    <%@include file="/resources/html/footer.jsp" %>

</body>
</html>