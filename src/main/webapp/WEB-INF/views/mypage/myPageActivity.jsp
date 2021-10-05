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
				
				paginationForm.attr('action', '/mypage/activity');
				paginationForm.attr('method', 'GET');
				
				paginationForm.find('input[name=userid]').val('${pageMaker.criA.userid}');
				paginationForm.find('input[name=currPage]').val($(this).attr('href'));
				paginationForm.find('input[name=amount]').val('${pageMaker.criA.amount}');
				paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.criA.pagesPerPage}');
				
				paginationForm.submit();
			});	//onclick
			
    	}); //jq
    
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
        
        .activity_a {
        	color: blue !important;
        	font-weight: bold;
        }
        
        a.nav-link.active {
        	background-color: #C2DBFE  !important;
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
                                <a class="nav-link active" aria-current="page" href="#">ACTIVITY</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/films?userid=${pageMaker.criA.userid}&code=1&currPage=1&amount=5&pagesPerPage=5">FILMS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/myreviews?userid=${pageMaker.criA.userid}&currPage=1&amount=5&pagesPerPage=5">REVIEWS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/follower?userid=${pageMaker.criA.userid}&currPage=1&amount=10&pagesPerPage=5">FOLLOWS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/guestbook?userid=${pageMaker.criA.userid}&currPage=1&amount=10&pagesPerPage=5">GUESTBOOK</a>
                            </li>
                        </ul>                        
                      </div>


                    </div>
                  
                </nav>

            </div>

            <div id='mypage_activity_log'>

                <hr>

                <div id='section_table'>            
                    
               <p style='font-size: 18px'>Activity Log</p>
                    
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
                     <c:forEach items="${activity}" var="activity">
                        <tr>
                           <c:set var='type' value='${activity.type}' />
                        
                           <c:choose> 
                               <c:when test="${type eq 'RV'}">
                                   <td id='activity_review_content_td'>
                                      <a class='activity_a' href='/mypage/main?userid=${activity.userid}'>${activity.nickname}</a>님이 
                                      <a class='activity_a' href='/film/${activity.filmid}'>${activity.title}</a>영화에 
                                      <a class='activity_a' href='/film/${activity.filmid}/review/${activity.rno}' id='activity_review_content_a'>${activity.content}</a> 리뷰를 작성하였습니다.
                                   </td>
                                   <td>${activity.insertTs}</td>
                               </c:when>
                               <c:when test="${type eq 'FW'}">
                                   <td>
                                      <a class='activity_a' href='/mypage/main?userid=${activity.userid}'>${activity.nicknameFollower}</a>님이 
                                      <a class='activity_a' href='/mypage/main?userid=${activity.followerid}'>${activity.nickname}</a>님을 팔로우 하였습니다.
                                   </td>
                                   <td>${activity.insertTs}</td>
                               </c:when>
                               <c:when test="${type eq 'RL'}">
                                   <td>
                                      <a class='activity_a' href='/mypage/main?userid=${activity.userid}'>${activity.nickname}</a>님이                                      
                                      <a class='activity_a' href='/film/${activity.reviewFilmId}/review/${activity.rno}' id='activity_review_content'>${activity.content}</a> 리뷰를 좋아합니다.                                      
                                   </td>
                                   <td>${activity.insertTs}</td>
                               </c:when>
                               <c:when test="${type eq 'GB'}">
                                  
                                   <td>
                                      <a class='activity_a' href='/mypage/main?userid=${activity.writer}'>${activity.nicknameGuestbook}</a>님이 방명록을 작성하였습니다.                                                                         
                                   </td>
                                   <td>${activity.insertTs}</td>
                                  
                              </c:when>
                               <c:when test="${type eq 'FL'}">
                                   <c:set var='code' value='${activity.code}' />
                                   <c:choose>
                                      <c:when test="${code eq '1'}">
                                         <td>
                                            <a class='activity_a' href='/mypage/main?userid=${activity.userid}'>${activity.nickname}</a>님이 
                                            <a class='activity_a' href='/film/${activity.filmid}'>${activity.title}</a>영화를 좋아합니다.
                                         </td>
                                         <td>${activity.insertTs}</td>
                                      </c:when>
                                      <c:when test="${code eq '2'}">
                                         <td>
                                            <a class='activity_a' href='/mypage/main?userid=${activity.userid}'>${activity.nickname}</a>님이 
                                            <a class='activity_a' href='/film/${activity.filmid}'>${activity.title}</a>영화를 본영화에 추가했습니다.
                                         </td>
                                         <td>${activity.insertTs}</td>
                                      </c:when>
                                      <c:when test="${code eq '3'}">
                                         <td>
                                            <a class='activity_a' href='/mypage/main?userid=${activity.userid}'>${activity.nickname}</a>님이 
                                            <a class='activity_a' href='/film/${activity.filmid}'>${activity.title}</a>영화를 볼영화에 추가했습니다.
                                         </td>
                                         <td>${activity.insertTs}</td>
                                      </c:when>
                                   </c:choose>
                               </c:when>
                           </c:choose>                           
                                                
                           
                                                           
                        </tr>
                              </c:forEach>         
                  </tbody>                  
               </table>               
            </div>                               

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
                      <li class="${pageMaker.criA.currPage == pageNum ? 'page-item active' : 'page-item'}">
                         <a class="page-link" href="/mypage/activity?userid=${pageMaker.criA.userid}&currPage=${pageNum}&amount=${pageMaker.criA.amount}&pagesPerPage=${pageMaker.criA.pagesPerPage}">${pageNum}</a>
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