<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
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

    <link rel="icon" href="/img/favicon_noback.ico" type="image/x-icon">

    <link rel="stylesheet" href="/resources/css/layout.css">
    <link rel="stylesheet" href="/resources/css/swiper.css">
    <link rel="stylesheet" href="/resources/css/main.css">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="/resources/js/jquery-1.8.3.min.js"></script>
    <script src="/resources/js/swiper.js"></script>
    
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
        
        $(document).ready(function (){ 
        	
        	
        	
        	/*for(var vs = 0; vs < 5; vs++) {
        		 console.log(vs);
        		
        		console.log('#filmPoster'+vs);
        		console.log('#posterHover'+vs);
        
			  $('#filmPoster'+vs).hover(function(){
				 	console.log('#filmPoster'+vs);
	        		console.log('#posterHover'+vs);
			       $('#filmPoster'+vs).css('border','5px solid #00e054');
			       $('#posterHover'+vs).css("display", 'inline');
			   }, function() {
			   	$('#filmPoster'+vs).css('border','none');
			   	$('#posterHover'+vs).css("display", 'none');
			   });
			   
        	}  */
			   
		   $('#filmPoster0').hover(function(){
		        $(this).css('border','5px solid #00e054');
		        $('#posterHover0').css("display", 'inline');
		    }, function() {
		    	$(this).css('border','none');
		    	$('#posterHover0').css("display", 'none');
		    });
   		    
   		 $('#filmPoster1').hover(function(){
		        $(this).css('border','5px solid #00e054');
		        $('#posterHover1').css("display", 'inline');
		    }, function() {
		    	$(this).css('border','none');
		    	$('#posterHover1').css("display", 'none');
		    });
   		 
   		 $('#filmPoster2').hover(function(){
		        $(this).css('border','5px solid #00e054');
		        $('#posterHover2').css("display", 'inline');
		    }, function() {
		    	$(this).css('border','none');
		    	$('#posterHover2').css("display", 'none');
		    });
   		 
   		 $('#filmPoster3').hover(function(){
		        $(this).css('border','5px solid #00e054');
		        $('#posterHover3').css("display", 'inline');
		    }, function() {
		    	$(this).css('border','none');
		    	$('#posterHover3').css("display", 'none');
		    });
   		 
   		 $('#filmPoster4').hover(function(){
		        $(this).css('border','5px solid #00e054');
		        $('#posterHover4').css("display", 'inline');
		    }, function() {
		    	$(this).css('border','none');
		    	$('#posterHover4').css("display", 'none');
		    });
   		  
   		});


        
    </script>

    <style>
    
    	.hoverTest {
    		z-index: 8; 
    		position:absolute; 
    		top:40px; 
    		left:28px; 
    		width: 130px; 
    		height: 200px; 
    		background-color: #ffffff;
        	background-color: rgba( 255, 255, 255, 0.5 );
    		
    	}
    
     	.inner-star::before {
            color: pink;            
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
    
    	#container {
    		width: 998px;
    		margin: 0 auto;
    		
    		font-family: 'ELAND 초이스';
    	}
    	
    	#mainFilm {
    		position: relative;
    	}
    	
    	#mainPosterUl {
    		float: left;
    		
    		height: 300px;
    	}
    	
    	#hoverPost {
    		z-index: 8;
    		position:absolute; 
    		top:20px; 
    		left:22px;
    	}
    	
    	.hoverEventList {
    		width:160px; 
    		height:250px; 
    		border:1px solid black;
    		
    		float:left;
    	}
    	
    	.mainFilmTitle {
            letter-spacing: 2px;
            text-align: center;
            font-size: 17px;
            color: #525252;
            background-image: -webkit-linear-gradient(92deg, #626ca1, #515bb9);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            -webkit-animation: hue 3s infinite linear;
        }
    	
    	 @-webkit-keyframes hue {
            from {
                -webkit-filter: hue-rotate(0deg);
            }
            to {
                -webkit-filter: hue-rotate(-360deg);
            }
        }
        
        
    
    </style>

</head>    

<body>
    <%@include file="/resources/html/header.jsp"  %>

    <div id="container">
            
        
        <div id="mainback">
            <img class="img-fluid" src="/resources/img/common.jpg" alt="mainbackimg" width="998">
    
        </div>

        <div id="mainText">
            <p>
                Track films you’ve watched.<br> Save those you want to see.<br>Tell your friends what’s good.
            </p>
            <p></p>
            <p>
                The social network for film lovers.
            </p>
        </div>
        
        <h1 class="display-6">Popular Films</h1>
        
        <hr>
        
        <div id='mainFilm' style='height:300px;'>
        	<c:forEach items="${films}" var="films" varStatus="vs">
        	<ul id='mainPosterUl'>
        		<li class="filmPosterList" style='margin-left: 8px; position: relative;'>
	        		<a href='/film/${films.filmid}'>
	        		<img id='filmPoster${vs.index}' class='filmPoster' src='https://www.themoviedb.org/t/p/original${films.poster}' style='width:190px; ' >
	        		<div id='posterHover${vs.index}' class='hoverTest' style='display:none;'>
	        			<img src='/resources/img/heartTransparent.png' style='margin-top: 60px; margin-left: 5px; height:60px;'>
	        			<h6 style='font-weight: bold; font-size:28px;'>${vs.index}</h6>
	        		</div>
	        		</a>
        		</li>        		        			
        	</ul>
        	
        	</c:forEach>
        </div>
        
        <hr>
        
        <h1 class="display-6">Popular Reviews This Week</h1>
        
        <div id='mypage_reviews' class='container-sm'>

        <hr>
        
        <c:forEach items="${reviews}" var="reviews">
     
            <div class='row'>

                <div class='col-3'>
                    <a href='/film/${reviews.filmid}'><img src='https://www.themoviedb.org/t/p/original${reviews.poster}' id='film_poster' style='width:200px;'></a>
                </div>

                <div class='col-9' id='mypage_button'>
                
                   <a href='/film/${reviews.filmid}' class='mainFilmTitle' id='mypage_review_title' style='font-size: 25px; color: blue;'>${reviews.title}</a><br>
                   
                   <div class='RatingStar'>
                      <div class='RatingScore'>
                          <div class='outer-star'>	                                
                          	<div class='inner-star' style='width: ${reviews.width}%'></div>
                          </div>
                      </div>
                  </div>                                  
                                      
                    
                  <h6>${reviews.rate} / 5</h6>
                  
                  <div class='row' style='margin-top: 5px;'>
                  
                  	<div class='col-1'>
                  
                  	<h6><a href='/film/${reviews.filmid}/review/${reviews.rno}'><img src='/resources/img/fullheart.png' style='height:25px;'>${reviews.likeCnt}</a></h6>
                  
                    </div>
                    
                    <div class='col-1'>
                  	<h6><a href='/film/${reviews.filmid}/review/${reviews.rno}'><img src='/resources/img/reply.png' style='height:25px;'>${reviews.commentCnt}</a></h6>
                  	</div>
                  </div>
                  <hr>                          

                  <div class='mypage_review_content' id='mypage_review_content'>

                      <a href='/film/${reviews.filmid}/review/${reviews.rno}' style='font-size: 17px; color: black;'>${reviews.content}</a>

                  </div>
                    
                    
                    
                </div>

            </div>
         
            <hr>
         
         </c:forEach>                    

        </div>
        
        
    </div>  
    <%@include file="/resources/html/footer.jsp" %>
</body>
</html>