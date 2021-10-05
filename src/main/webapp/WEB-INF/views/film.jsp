<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 



<!DOCTYPE html>


<html id="html" lang="ko" >

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
    
    <title>&lrm;${filmVO.title} • FILMEE </title>

        <%@include file="/resources/html/header.jsp" %>   
    
  
    <!-- CSS -->
    
    <link href="/resources/css/film.css" rel="stylesheet" media="screen, projection" />  
    <script src="https://s.ltrbxd.com/static/js/main.min.ed93f370.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

  
     <script>
        $(function () {
            console.clear();
            console.debug('jq started...');
            $('#regBtn').click(function () {
                console.log('onclick on #regBtn clicked...');
                  location.href = "/film/${filmVO.film_id}/register";
 }); // onclick
        
        }); // .jq
    </script>
    

    <style>
    
        * {
            font-family: 'ELAND 초이스';
        }
        
    #diary-entry-submit-button{
    
        float: right;
        margin-right: 50px;
    }
    #starbox{
        float:left;
        
        }       
    .star-rating {
      display: flex;
      flex-direction: row-reverse;
      font-size: 2.25rem;
      line-height: 2.5rem;
      justify-content: space-around;
      padding: 0 0.2em;
      text-align: center;
      width: 5em;
    }
     
    .star-rating input {
      display: none;
    }
     
    .star-rating label {
      -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
      -webkit-text-stroke-width: 2.3px;
      -webkit-text-stroke-color: #2b2a29;
      cursor: pointer;
    }
     
    .star-rating :checked ~ label {
      -webkit-text-fill-color: gold;
    }
     
    .star-rating label:hover,
    .star-rating label:hover ~ label {
      -webkit-text-fill-color: #fff58c;
    }
    
    #frm-review{
    height: 350px;
    width: 350px;
    }
    
    #plotBackground{
    background-color:rgba(255, 255, 255, 0.376);
    color:black;
    border-radius: 2%;
    padding: 8px;
    }
    
    #backdrop{
    width:998px;
    height:560px;   
    }
    
    .film backdropped{
	width: 998px;
	margin: 0 auto;
	}
    
    .btn-primary{
        background-color: #445566;
        border-color: #445566;
    }
    </style>

</head>

    <!-- 스틸컷 -->
<body class="film backdropped" data-type="film" data-tmdb-type="movie" data-tmdb-id="${filmVO.film_id}">

        <div class="backdrop-container" >
        <div id="backdrop" class="backdrop-wrapper"
            data-backdrop="https://www.themoviedb.org/t/p/original${filmVO.backdrop_path}" 
            data-offset="0">
            <div class="backdropimage js-backdrop-image"></div>
           <!--  <div class="backdropmask js-backdrop-fade"></div> -->
        </div>
    </div>
    
        <div
          class="react-component"
          data-component-class="globals.comps.NavComponent"
        ></div>

    <div id="content" class="site-body -backdrop">
        <div class="content-wrap">


            <div id="film-page-wrapper" class="cols-3 overflow">

                <div class="col-6 gutter-right-1 col-poster-large" id="js-poster-col">
                            <img
                                src="https://www.themoviedb.org/t/p/original${filmVO.poster_path}"
                                width="230" height="345" alt="${filmVO.title}" class="image"                               
                                itemprop="image" /> <span class="frame"><span class="frame-title"></span></span>
                        </div>
                        <div class="js-serial-csi" data-src="/esi/film/the-social-network/stats/" data-on-load="">
                        <!-- 
                            <ul class="film-stats">
                                <li class="stat"><a class="has-icon icon-placeholder">&nbsp;</a></li>
                            </ul> -->
                        </div>

              
               
 
                <div class="col-17">
                    <section id="featured-film-header" class="film-header-lockup -default">

                        <h1 class="headline-1 js-widont prettify">${filmVO.original_title}</h1>

                        <p>
                            <small class="number">
                            <fmt:formatDate value="${filmVO.release_date}" pattern="yyyy" />
                            </small>
                            Directed by                                                   
                                <c:forEach items="${filmPeopleVOList}" var="filmPeopleVO">
                                    <c:if test="${filmPeopleVO.credit_order eq null}">
                                    <a href="/search/people/${filmPeopleVO.people_id}/"><span class="prettify"> 
                                        ${filmPeopleVO.enname} </span></a>
                                    </c:if>
                                </c:forEach>
                        </p>

                    </section>

                    <section class="section col-10 col-main">

                        <section>


                            <div class="review body-text -prose -hero prettify">  
                                
                                 <div class="truncate" id="plotBackground" data-truncate="450">                              
                                    ${filmVO.plot}                         
                                </div>
                                                      
                               
                            </div>

                        </section>

                        <div id="tabbed-content" data-selected-tab>
                            <header>
                                <ul>
                                    <li class="active"><a href="#tab-cast" data-id="cast">Cast</a></li>
                                    <li><a href="#tab-details" data-id="details">Details</a></li>  
                                </ul>
                            </header> 

                            <div id="tab-cast" class="tabbed-content-block" style="display:block;">
                            <h3 class="hidden">Cast</h3>
                                <div class="cast-list text-sluglist">
                                     <p> 
                                     <c:forEach items="${filmPeopleVOList}" var="filmPeopleVO" begin="0" end="29"  varStatus="status">
                                         <c:if test="${filmPeopleVO.credit_order != null}">

                                           <a title="${filmPeopleVO.character}" href="/search/people/${filmPeopleVO.people_id}"
                                             class="text-slug tooltip1">${filmPeopleVO.enname}</a>                                           

                                         </c:if>
                                    </c:forEach> 
                        
                                    </p>                               
                                </div>
                            </div>

              
                            <div id="tab-details" class="tabbed-content-block column-block" style="display: none;">    
                                <h3 class="hidden">Details</h3> 
                            <h3><span>Countries</span></h3>                           
                                <div class="text-sluglist">
                                    <p> ${filmVO.country} </p>                                   
                                </div>
                            <h3><span>Genre</span></h3>
                             <div class="text-sluglist">
                                    <p> ${filmGenreVO.genre} </p>                                   
                                </div>
                            </div>

                        </div>

                        <p class="text-link text-footer">

                            ${filmVO.runtime}&nbsp;mins &nbsp;

                        </p>

 
                    </section>

            
                 
                    <aside class="sidebar">
                        <section id="userpanel" class="actions-panel">
                           
                            <ul class="js-actions-panel">
                                <li class="action-large -watch"><span class="film-watch-link-target"
                                        data-film-id="26711"><span class="film-watch-link -large"><span
                                                class="action -watch ajax-click-action"
                                                data-action="/film/the-social-network/mark-as-watched/">Watch</span></span></span>
                                </li>
                                <li class="action-large -like"><span class="like-link-target react-component"
                                        data-component-class="globals.comps.LikeLinkComponent"
                                        data-likeable-uid="film:26711" data-likeable-name="film" data-likeable="true"
                                        data-likes-page="/film/the-social-network/likes/" data-format="large"><span
                                            class="like-link"><span class="action -like ajax-click-action  "
                                                data-action="/s/film:26711/like/"
                                                data-recaptcha-action="film_like">Like</span></span></span></li>
                                <li class="hidden action-large -watchlist"><a href="#" data-film-id="26711"
                                        class="action -watchlist -on remove-from-watchlist ajax-click-action"
                                        data-action="/film/the-social-network/remove-from-watchlist/"><span
                                            class="watchlist-link-text"><span class="_hidetext">This film is in your
                                            </span>Watchlist</span></a></li>
                                <li class="action-large -watchlist"><a href="#"
                                        class="action -watchlist add-to-watchlist ajax-click-action"
                                        data-film-id="26711"
                                        data-action="/film/the-social-network/add-to-watchlist/">Watchlist</a></li>
                                <li class="-row-clear panel-rate js-panel-rate">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#writeModal">
                                  리뷰와 별점을 남겨보세요 
                                </button>
                                    <span class="rateit-label js-rateit-label"></span>
                                    <input id="frm-sidebar-rating" data-film-id="26711" class="panel-rateit-field"
                                        type="range" min="0" max="10" step="1" value="0" style="display: none;">
                                                    <span class="rateit-label js-rateit-label">   </span>
                    
                                </li>
                                
      <!-- Button trigger modal -->
        
        <!-- Modal -->
        <div class="modal fade" id="writeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"> <b>${filmVO.title}</b> </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
  
        
                
                    <% 
            Integer writer = (Integer) session.getAttribute("userId");
                    %>
        
        <section class="col col-13 overflow expanded">
             <form method="POST" action="/film/${filmVO.film_id}/review/register">
                
                <input type="hidden" name="film_id" value="${filmVO.film_id}" id="frm-film-id">
                <input type="hidden" name="writer" value="${__LOGIN__.userId}">

                <fieldset>
                    
                    <div class="form-row">
                        <textarea name="content" id="frm-review" class="field" placeholder="리뷰를 작성해보세요"></textarea>
                    </div>
                         
                         <div id = "starbox">
                         
                         
                         <div class="star-rating space-x-4 mx-auto">
                            <input type="radio" id="5-stars" name="rate" value=5 v-model="ratings"/>
                            <label for="5-stars" class="star pr-4">★</label>
                            <input type="radio" id="4-stars" name="rate" value=4 v-model="ratings"/>
                            <label for="4-stars" class="star">★</label>
                            <input type="radio" id="3-stars" name="rate" value=3 v-model="ratings"/>
                            <label for="3-stars" class="star">★</label>
                            <input type="radio" id="2-stars" name="rate" value=2 v-model="ratings"/>
                            <label for="2-stars" class="star">★</label>
                            <input type="radio" id="1-star" name="rate" value=1 v-model="ratings" />
                            <label for="1-star" class="star">★</label>
                        </div>

                        </div>
                    <div class="form-row clearfix">
                    
                
                    <button type="submit" class="btn btn-primary" id="diary-entry-submit-button">리뷰 등록</button>
                    </div>  

                    <div class="form-row clearfix row-last  row-sharing"></div>
                </fieldset>
             </form> 
        </section>                                       
                    </div>
            
                          
                        </div>
                      </div>
                    </div>
                            </ul> 
                        </section>


                   
                        <section class="section ratings-histogram-chart">
                            <h2 class="section-heading"><a href="/film/the-social-network/ratings/" class=""
                                    title="">Ratings</a></h2>  <span class="average-rating"
                                itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating"> <a
                                    href="/film/the-social-network/ratings/" class="tooltip display-rating"
                                    data-original-title="Weighted average of 3.94 based on 512,169&nbsp;ratings">3.9</a>
                            </span>
                            <div class="rating-histogram clear rating-histogram-exploded"> <span
                                    class="rating-green rating-green-tiny rating-1"><span
                                        class="rating rated-2">★</span></span>
                                <ul>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 0px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip1"
                                            data-original-title="1,034&nbsp;half-★ ratings (0%)">1,034&nbsp;half-★
                                            ratings (0%)<i style="height: 1.2879252956184999px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 16px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip1"
                                            data-original-title="3,373&nbsp;★ ratings (1%)">3,373&nbsp;★ ratings (1%)<i
                                                style="height: 1.9392379324189557px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 32px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip1"
                                            data-original-title="1,979&nbsp;★½ ratings (0%)">1,979&nbsp;★½ ratings
                                            (0%)<i style="height: 1.5510678530261233px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 48px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip1"
                                            data-original-title="15,442&nbsp;★★ ratings (3%)">15,442&nbsp;★★ ratings
                                            (3%)<i style="height: 5.299944308453459px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 64px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip1"
                                            data-original-title="13,024&nbsp;★★½ ratings (3%)">13,024&nbsp;★★½ ratings
                                            (3%)<i style="height: 4.6266335107691905px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 80px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip1"
                                            data-original-title="74,896&nbsp;★★★ ratings (15%)">74,896&nbsp;★★★ ratings
                                            (15%)<i style="height: 21.8553703487845px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 96px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip1"
                                            data-original-title="65,474&nbsp;★★★½ ratings (13%)">65,474&nbsp;★★★½
                                            ratings (13%)<i style="height: 19.231741591224047px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 112px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip1"
                                            data-original-title="154,422&nbsp;★★★★ ratings (30%)">154,422&nbsp;★★★★
                                            ratings (30%)<i style="height: 44.0px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 128px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip1"
                                            data-original-title="71,170&nbsp;★★★★½ ratings (14%)">71,170&nbsp;★★★★½
                                            ratings (14%)<i style="height: 20.817836836720158px;"></i></a> </li>
                                    <li class="rating-histogram-bar" style="width: 15px; left: 144px"> <a
                                            href="/film/the-social-network/ratings/by/rating/" class="ir tooltip1"
                                            data-original-title="111,355&nbsp;★★★★★ ratings (22%)">111,355&nbsp;★★★★★
                                            ratings (22%)<i style="height: 32.00766082553004px;"></i></a> </li>
                                </ul> <span class="rating-green rating-green-tiny rating-5"><span
                                        class="rating rated-10">★★★★★</span></span>
                            </div>
                        </section>

                    </aside>

                </div>

                <div class="clear"></div>
            </div>
 


            <section id="popular-reviews" class="film-reviews section">
                    
                <h2 class="section-heading"><a href="/film/${filmVO.film_id}/reviews">Popular reviews</a></h2>
                <a href="<%-- /film/${filmVO.film_id}/reviews --%> #" class="all-link">More</a>
                <ul class="film-popular-review">
                    
                      <c:forEach items="${reviewFilmUserVOList}" var="reviewFilmUserVO" begin="0" end="2"  varStatus="status">                                 
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
                            <p class="like-link-target react-component -monotone" data-component-class="globals.comps.LikeLinkComponent" data-likeable-name="review" data-format="svg" > 
                            <span class="svg-action -like"></span> </p> </div> </li>

                    </c:forEach>
               </ul>
            </section>
        </div>

    </div>

 
	<%@ include file="/resources/html/filmFooter.jsp" %>
	</body>
