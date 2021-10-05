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
				
				paginationForm.attr('action', '/mypage/films');
				paginationForm.attr('method', 'GET');
				
				paginationForm.find('input[name=userid]').val('${pageMaker.criFilm.userid}');
				paginationForm.find('input[name=code]').val('${pageMaker.criFilm.code}')
				paginationForm.find('input[name=currPage]').val($(this).attr('href'));
				paginationForm.find('input[name=amount]').val('${pageMaker.criFilm.amount}');
				paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.criFilm.pagesPerPage}');
				
				paginationForm.submit();
			});	//onclick
			
		}); //jq
    
	    function deleteFilmReaction(userid, filmid, code) {
			if(confirm('삭제하시겠습니까?')) {
				
				let formObj = $('#form_'+userid+'_'+filmid+'_'+code);
				
				formObj.attr("action", "/mypage/deleteFilmReaction");
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
        #film_poster {
            width: 200px;
            
        }
        
        #mypage_film_title {
        	font-size: 23px; 
        	font-weight: bold;
        }
        #mypage_film_content {             
            overflow: hidden;
        	text-overflow: ellipsis;
        	white-space: normal;

        	line-height: 2.0;

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
                                <a class="nav-link" href="/mypage/activity?userid=${pageMaker.criFilm.userid}&currPage=1&amount=10&pagesPerPage=5">ACTIVITY</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">FILMS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/myreviews?userid=${pageMaker.criFilm.userid}&currPage=1&amount=5&pagesPerPage=5">REVIEWS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/follower?userid=${pageMaker.criFilm.userid}&currPage=1&amount=10&pagesPerPage=5">FOLLOWS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/guestbook?userid=${pageMaker.criFilm.userid}&currPage=1&amount=10&pagesPerPage=5">GUESTBOOK</a>
                            </li>
                        </ul>                        
                      </div>


                    </div>
                  
                </nav>

            </div>

            <div id='mypage_mid_menu'>

                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="${pageMaker.criFilm.code == 1 ? 'nav-link active' : 'nav-link'}" href="/mypage/films?userid=${pageMaker.criFilm.userid}&code=1&currPage=1&amount=${pageMaker.criFilm.amount}&pagesPerPage=${pageMaker.criFilm.pagesPerPage}">Favorite</a>
                    </li>
                    
                    <li class="nav-item">
                      <a class="${pageMaker.criFilm.code == 2 ? 'nav-link active' : 'nav-link'}" href="/mypage/films?userid=${pageMaker.criFilm.userid}&code=2&currPage=1&amount=${pageMaker.criFilm.amount}&pagesPerPage=${pageMaker.criFilm.pagesPerPage}">Watched</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="${pageMaker.criFilm.code == 3 ? 'nav-link active' : 'nav-link'}" href="/mypage/films?userid=${pageMaker.criFilm.userid}&code=3&currPage=1&amount=${pageMaker.criFilm.amount}&pagesPerPage=${pageMaker.criFilm.pagesPerPage}">WishToWatch</a>
                      </li>
                  </ul>

            </div>

            <div id='mypage_myfilms' class='container-sm'>

                <hr>

				
				<c:forEach items="${films}" var="films">
				<form action="/mypage/deleteFilmReaction" method="POST" id='form_${films.userid}_${films.filmid}_${films.code}'>
				<input type='hidden' name='userid' value='${pageMaker.criFilm.userid}'>
				<input type='hidden' name='filmid' value='${films.filmid}'>
				<input type='hidden' name='code' value='${films.code}' >
				<input type='hidden' name='currPage' value='${pageMaker.criFilm.currPage}'>
				<input type='hidden' name='amount' value='${pageMaker.criFilm.amount}'>
				<input type='hidden' name='pagesPerPage' value='${pageMaker.criFilm.pagesPerPage}'>
	                <div class='row'>
	
	                    <div class='col-3'>
	                        <a href='/film/${films.filmid}'><img src='https://www.themoviedb.org/t/p/original${films.poster}' id='film_poster'></a>
	                    </div>
	
	                    <div class='col-9' id='mypage_button'>
	                        <a href='/film/${films.filmid}'  id='mypage_film_title' style='color: blue; font-size: 30px;'>${films.title}</a><br>
	                        
	                        <hr>
	
	                        <div class='mypage_film_content' id='mypage_film_content'>
	
	                            <a href='/film/${films.filmid}' style='font-size: 17px; color: black;'>${films.plot}</a>	
	
	                        </div>
	                            
	                        <button id='delBtn' onclick="deleteFilmReaction('${films.userid}', ${films.filmid}, ${films.code})" type="button" class="btn btn-outline-danger btn-sm">Del</button>
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
                    <input type='hidden' name='code'>
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
                      <li class="${pageMaker.criFilm.currPage == pageNum ? 'page-item active' : 'page-item'}">
                         <a class="page-link" href="/mypage/films?userid=${pageMaker.criFilm.userid}&code=${pageMaker.criFilm.code}&currPage=${pageNum}&amount=${pageMaker.criFilm.amount}&pagesPerPage=${pageMaker.criFilm.pagesPerPage}">${pageNum}</a>
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