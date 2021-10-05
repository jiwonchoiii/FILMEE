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

    <script>
    
	    $(function() {
	        
		    $('a#prev, a#next').on('click', function(e) {				
				
				e.preventDefault();				
				
				var paginationForm = $('#form_pagination');
				
				paginationForm.attr('action', '/mypage/myreviews');
				paginationForm.attr('method', 'GET');
				
				paginationForm.find('input[name=userid]').val('${pageMaker.criR.userid}');
				paginationForm.find('input[name=currPage]').val($(this).attr('href'));
				paginationForm.find('input[name=amount]').val('${pageMaker.criR.amount}');
				paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.criR.pagesPerPage}');
				
				paginationForm.submit();
			});	//onclick
			
		}); //jq
		
		function deleteMyReview(rno) {
			
			if(confirm('삭제하시겠습니까?')) {
			
				let formObj = $('#form_'+rno);
				
				formObj.attr("action", "/mypage/deleteMyReview");
				formObj.attr("method", "POST");					
			  
			  	formObj.submit();
			} else {
				;;
			} //if-else
		} //deleteMyReview
    	
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
        #film_poster {
            width: 200px;
            
        }
        
        #mypage_review_title {
        	font-size: 23px; 
        	font-weight: bold;
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
        #delBtn {
        	position: absolute;
        	bottom: 10px;
       		right: 20px;
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
                                <a class="nav-link" href="/mypage/activity?userid=${pageMaker.criR.userid}&currPage=1&amount=10&pagesPerPage=5">ACTIVITY</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/films?userid=${pageMaker.criR.userid}&code=1&currPage=1&amount=5&pagesPerPage=5">FILMS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">REVIEWS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/follower?userid=${pageMaker.criR.userid}&currPage=1&amount=10&pagesPerPage=5">FOLLOWS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/guestbook?userid=${pageMaker.criR.userid}&currPage=1&amount=10&pagesPerPage=5">GUESTBOOK</a>
                            </li>
                        </ul>                        
                      </div>


                    </div>
                  
                </nav>

            </div>

            <div id='mypage_mid_menu'>

                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="#">My Reviews</a>
                    </li>
                    
                    <li class="nav-item">
                      <a class="nav-link" href="/mypage/likedreviews?userid=${pageMaker.criR.userid}&currPage=1&amount=5&pagesPerPage=5">Favorite Reviews</a>
                    </li>                    
                    
                  </ul>

                  
            </div>

            

            <div id='mypage_reviews' class='container-sm'>

                <hr>
                
                <c:forEach items="${myReviews}" var="myReviews">
                <form action="/mypage/deleteMyReview" method="POST" id='form_${myReviews.rno}'>
               <input type='hidden' name='rno' value='${myReviews.rno}'>
               <input type='hidden' name='userid' value='${pageMaker.criR.userid}'>
               <input type='hidden' name='currPage' value='${pageMaker.criR.currPage}'>
               <input type='hidden' name='amount' value='${pageMaker.criR.amount}'>
               <input type='hidden' name='pagesPerPage' value='${pageMaker.criR.pagesPerPage}'>
                   <div class='row'>
   
                       <div class='col-3'>
                           <a href='/film/${myReviews.filmid}'><img src='https://www.themoviedb.org/t/p/original${myReviews.poster}' id='film_poster'></a>
                       </div>
   
                       <div class='col-9' id='mypage_button'>
                       
                          <a href='/film/${myReviews.filmid}'  id='mypage_review_title'>${myReviews.title}</a><br>
                          
                          <div class='RatingStar'>
                               <div class='RatingScore'>
                                   <div class='outer-star'>                                   
                                      <div class='inner-star' style='width: ${myReviews.width}%'></div>
                                   </div>
                               </div>
                           </div>                        
                           
                           <h6>${myReviews.rate} / 5</h6>
                           
                           <hr>                          
   
                           <div class='mypage_review_content' id='mypage_review_content'>
   
                               <a href='/film/${myReviews.filmid}/review/${myReviews.rno}' style='font-size: 17px; color: black;'>${myReviews.content}</a>
   
                           </div>
                           
                           <button id='delBtn' onclick="deleteMyReview('${myReviews.rno}')" type="button" class="btn btn-outline-danger btn-sm">del</button>
                           
                       </div>
   
                   </div>
                
                   <hr>
                   </form>
                </c:forEach>                    

            </div>

            <div id='section_pagination'>

                <hr>
                
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
                      <li class="${pageMaker.criR.currPage == pageNum ? 'page-item active' : 'page-item'}">
                         <a class="page-link" href="/mypage/myreviews?userid=${pageMaker.criR.userid}&currPage=${pageNum}&amount=${pageMaker.criR.amount}&pagesPerPage=${pageMaker.criR.pagesPerPage}">${pageNum}</a>
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