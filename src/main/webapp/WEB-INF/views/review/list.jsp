<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 


<!DOCTYPE html>


<html id="html" lang="ko"> 
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=1024" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	
	<script>
		var isMobile = false,
			isMobileOptimised = true,
			renderMobile = false,
			useStaticFonts = false,
			disableFrameProtection = false;
	</script> 
	<title>&lrm;Reviews of ${filmVO.title} &bull; FILMEE </title>

   <%@include file="/resources/html/header.jsp" %>   
	<link href="/resources/css/letterboxd.css" rel="stylesheet" media="screen, projection" />  
	<link href="https://s.ltrbxd.com/static/css/desktop.min.f73f6420.css" rel="stylesheet" media="screen, projection"/>
	<script src="https://s.ltrbxd.com/static/js/main.min.15362e15.js"></script>
	

	<style>
	
	  * {
            font-family: 'ELAND 초이스';
        }
        
	#content{
	width: 998px;
	margin: 0 auto;
	}
	
	section{
	display: inline-block;
	}
	</style>
	
	 <script>

        $(function () {
            console.clear();
            console.debug('jq started...');

            // 게시글의 등록, 수정, 삭제 처리 후, 리다이렉션을 통해,
            // 게시글 목록화면으로 이동시킬 때 함께 임시박스(rttrs)로 전송시킨
            // 처리결과를 경고창으로 출력시키자!
            var result = '<c:out value="${result}" />';
            if(result.length > 0) {
                alert(result);
            } // if

/*             $('#regBtn').click(function () {
                console.log('onclick on #regBtn clicked...');

                location.href = "/board/register?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";  // GET, Request URI: /board/register
            }); // onclick */

			$('a.prev, a.next').on('click', function (e) {
				console.debug("onclicked for a.next or a.prev ...");
				console.log('\t+ this:', this);

				// Event에 의한 선택된 요소의 기본동작을 금지(무력화)
				e.preventDefault();

				// 아래 지역변수에는 Rvalue 선택자에 의해서 선택된 요소
				// (즉,form 태그)가 저장됨.
				var paginationForm = $('#paginationForm');

				paginationForm.attr('action', '/film/{filmid}/reviews');
				paginationForm.attr('method', 'GET');

				paginationForm.find('input[name=currPage]').val($(this).attr('href'));
				paginationForm.find('input[name=amount]').val('${pageDTO.criFR.amount}');
				paginationForm.find('input[name=pagesPerPage]').val('${pageDTO.criFR.pagesPerPage}');

				paginationForm.submit();
			});	// onclick for Prev, Next button

        }); // .jq

    </script>

</head>

<body class="views">



<div id="content" class="site-body">
	
	<div class="content-wrap">

</div>		
<!-- 	<section class="section col-17 col-main"> -->
		
<header class="page-header overflow person-header film-header">
	<div class="contextual-title">
		<h1 class="headline-2 prettify">
			<span class="context">Reviews of</span>
			<a href="/film/${filmVO.film_id}">${filmVO.original_title}</a> <small class="metadata">
<%-- 			<fmt:formatDate value="${filmVO.release_date}" pattern="yyyy" /></a></small>
 --%>		</h1>
	</div>
</header> 

		
		<div class="clear"/></div>

				
				<section class="viewings-list">
				
				        <table border="1">
 

            <tbody>
				<section id="popular-reviews" class="film-reviews section">

                <h2 class="section-heading"><a href="/film/${filmVO.film_id}/reviews">Popular reviews</a></h2>
                <ul class="film-popular-review">
                    
                      <c:forEach items="${reviewFilmUserVOList}" var="reviewFilmUserVO" begin="0" end="9"  varStatus="status">                                 
                        <li class="film-detail"> 
                         <a class="avatar -a40" href="/mypage/main?userid=${reviewFilmUserVO.writer}" > 
                             <img src="https://younghoon.s3.ap-northeast-2.amazonaws.com/${reviewFilmUserVO.profile_photo_path}"  width="40" height="40" />
                            </a> 
                            
                            <div class="film-detail-content"> <div class="attribution-block -large"> 
                            <p class="attribution"> <a href="/film/${reviewFilmUserVO.film_id}/review/${reviewFilmUserVO.rno}" class="context" title="${reviewFilmUserVO.nickname}의 리뷰"> 
                            Review by <strong class="name">${reviewFilmUserVO.nickname}</strong> </a> 
                            <span class="rating -green rated-10"> 
                            ${reviewFilmUserVO.rate}
                            </span> <span class="content-metadata"> 
                            </span> </p> </div> 
                            <div class="body-text -prose collapsible-text" data-full-text-url="/s/full-text/viewing:29006694/"> 
                            <p>${reviewFilmUserVO.content} </div> 
                            </div> </li>

                    </c:forEach>
               </ul>
            </section>
             
            </tbody>
        </table>

	
			<%-- 		<ul>
						
							<li class="film-detail"> <a class="avatar -a40" href="/mypage/main?userid=${reviewFilmUserVO.writer}"> 
							<img src="https://younghoon.s3.ap-northeast-2.amazonaws.com/${reviewFilmUserVO.profile_photo_path}" 
							alt="${reviewFilmUserVO.nickname}" width="40" height="40" /> </a> 
							<div class="film-detail-content"> <div class="attribution-block"> <p class="attribution"> 
							<span class="content-metadata"> <span class="date"> <a href="/demiadejuyigbe/film/candyman-2021/" 
							class="context"> Review by <strong class="name">${reviewFilmUserVO.nickname}</strong> </a> 
							<span class="_nobr">
					<!-- 날짜넣기..c태그 이용 -->
							</span> </span> <a href="/film/${reviewFilmUserVO.film_id}/review/${reviewFilmUserVO.rno}" 
							class="has-icon icon-comment icon-16 comment-count">5</a> </span> </p> </div> 
							<div class="body-text -prose collapsible-text" data-full-text-url="/s/full-text/viewing:192838265/"> 
							<p>${reviewFilmUserVO.content}</p> </div> 
							<p class="like-link-target react-component -monotone" data-component-class="globals.comps.LikeLinkComponent" data-likeable-uid="viewing:192838265" 
							data-likeable-name="review" data-likeable="true" data-likes-page="/demiadejuyigbe/film/candyman-2021/likes/" data-format="svg" data-owner="demiadejuyigbe" > 
							<span class="svg-action -like"></span> </p> </div> </li>

					</ul>
			<!-- 		<div class="pagination"> <div class="paginate-nextprev paginate-disabled"><span class="previous">Previous</span></div> <div class="paginate-nextprev"><a class="next" href="/film/candyman-2021/reviews/by/activity/page/2/">Next</a></div> </div>
			 --> --%>
			 	</section>
			
		<div id="pagination">

			<form id="paginationForm">
				<!-- 어느 화면에서든, 게시판 목록 페이지로 이동시, 반드시 아래 3개의 기준 전송파라미터를
				전송시키기 위해, hidden 값으로 설정 -->
				<input type="hidden" name="currPage">
				<input type="hidden" name="amount">
				<input type="hidden" name="pagesPerPage">

				<ul>
					<c:if test="${pageDTO.prev}">
						<li class="prev"><a class="prev" href="${pageDTO.startPage - 1}">Prev</a></li>
					</c:if>

					<!-- begin ~ end까지 반복하고, 현재의 번호값은 var속성에 넣어준다 -->
					<c:forEach
						begin="${pageDTO.startPage}"
						end="${pageDTO.endPage}"
						var="pageNum">

						<li class="${pageDTO.cri.currPage == pageNum? 'currPage' : ''}">
							<a 	
								class="${pageDTO.cri.currPage == pageNum? 'currPage' : ''}"
								href="/film/${filmVO.film_id}/reviews?currPage=${pageNum}&amount=${pageDTO.cri.amount}&pagesPerPage=${pageDTO.cri.pagesPerPage}">
								${pageNum}
							</a>
						</li>

					</c:forEach>

					<c:if test="${pageDTO.next}">
						<li class="next"><a class="next" href="${pageDTO.endPage + 1}">Next</a></li>
					</c:if>
				</ul>

			</form>

		</div>
	

<%-- 	<aside class="sidebar">
		<section class="section poster-list -p230 el col"> 
		<div class="really-lazy-load poster film-poster film-poster-493441 linked-film-poster" data-image-width="230" data-image-height="345"
		 data-target-link="/film/candyman-2021/" data-show-menu="true" data-hide-tooltip="true" > 
		<img src="https://www.themoviedb.orgA/t/p/original${filmVO.poster_path}" class="image" 
		width="230" height="345" alt="${filmVO.original_title}"/> 
		<span class="frame"><span class="frame-title"></span></span> </div>
		</section>
			
	</aside>
 --%>
</div>	



	<%@ include file="/resources/html/footer.jsp" %>
</body>
</html>