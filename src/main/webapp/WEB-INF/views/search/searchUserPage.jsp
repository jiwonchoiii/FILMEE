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
	    
	    <link rel="stylesheet" href="../resources/css/footer.css">
	    
	    <script>
	    
			$(function() {
				        
			    $('a#prev, a#next').on('click', function(e) {				
					
					e.preventDefault();				
					
					var paginationForm = $('#form_pagination');
					
					paginationForm.attr('action', '/search/u');
					paginationForm.attr('method', 'GET');
					
					paginationForm.find('input[name=searchWord]').val('${pageMaker.cri.searchWord}');
					paginationForm.find('input[name=currPage]').val($(this).attr('href'));
					paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
					paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');
					
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
	
	            font-family: 'ELAND 초이스'; 
	        }
	      
	        #profile_photo {
	            width: 150px;
	            height: 100px;
	        }   
	
	    
	    </style>
	    
	    
		<%@ include file="/resources/html/header.jsp" %>    	
	</head>
	<body>
		
		<div id='container'>
		
			<hr>
		
			<c:forEach items="${userList}" var="userList">
				
				<input type='hidden' name='searchWord' value='${pageMaker.cri.searchWord}'>				
				<input type='hidden' name='currPage' value='${pageMaker.cri.currPage}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='pagesPerPage' value='${pageMaker.cri.pagesPerPage}'>
		            <div id='search_user' class='container-sm'>                        
		
			            <div>
			                <a href='/mypage/main?userid=${userList.userid}'><img src='../resources/img/${userList.photo}' id='profile_photo'></a>
			            </div>                                            
			
			            <div class='searchUser_nickname'>
			                <a href='/mypage/main?userid=${userList.userid}' style='font-size: 17px'>${userList.nickname}</a>
			            </div>
		                 
		             	<hr>
		
		            </div>
            	
			</c:forEach>            

            <div id='section_pagination'>
                
                <form id='form_pagination'>
                	<input type='hidden' name='searchWord'>
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
						    <li class="${pageMaker.cri.currPage == pageNum ? 'page-item active' : 'page-item'}">
						    	<a class="page-link" href="/search/u?searchWord=${pageMaker.cri.searchWord}&currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${pageNum}</a>
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

  
		
		</div>
		
		
		<footer>
	        <div id="footer">
	            <a href="/main">
	                <img id="logoimg" src="/resources/img/filmeeLogo.png" alt="LOGO">
	            </a>
	            <div id="pageinfo">
	                <p>
	                    서울특별시 강남구 <br> 
	                    010-9876-5432<br>
	                    abcedferasdavazsdfzsdf
	                </p>
	            </div>
	            <div id="bugreport">
	                <button>의견보내기</button>
	            </div>
	        </div>
	    </footer>
				
	</body>
</html>