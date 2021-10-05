<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> 

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html id="html" lang="ko" class="no-mobile no-js">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=1024" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>
      &lrm;${reviewFilmUserVO.title} review by ${reviewFilmUserVO.nickname} &bull; FILMEE
    </title>

	<%@ include file="/resources/html/header.jsp" %>
  
<!--     <link href="/resources/css/letterboxd.css" rel="stylesheet" media="screen, projection" /> -->
    <script src="https://s.ltrbxd.com/static/js/main.min.ed93f370.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
     <link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="/resources/js/reviewLike.js"></script>
    <script src="/resources/js/reviewReply.js"></script>
    <script src="/resources/js/reviewReport.js"></script>
    
    <!-- 이렇게 삽입하면 아래에서 변수처럼 쓸 수 있다.   -->
    
    
    <script>    
    	$(function(){
            console.log("========= COMMENT JS =======")
    		var rnoValue='<c:out value="${reviewFilmUserVO.rno}"/>';
            var nickname='<c:out value="${__LOGIN__.nickname}"/>' 
            var userId='<c:out value="${__LOGIN__.userId}"/>'
            var replyUL=$(".chat");    
            var writer='<c:out value="${reviewFilmUserVO.writer}"/>'
            var modal = $(".modal"); 
            var modalInputReply=modal.find("input[name='content']");
            var modalInputReplyer=modal.find("input[name='writer']");
            var modalinputReplyDate=modal.find("input[name='insert_ts']");
            var modalModifyBtn=$("#modalModBtn");
            var modalRemoveBtn=$("#modalRemoveBtn");
            var modalRegisterBtn=$("#modalRegisterBtn");
            
         
            console.log("userId:",userId);
            console.log("writer:",writer);
            if("${__LOGIN__.userId}"==writer){
                $("#delete").show();
                $("#modify").show();
            } else{
                $("#delete").hide();
                $("#modify").hide();
                if("${__LOGIN__}"==""){
                    $("#addReplyBtn").hide()
                    $("#reportBtn").hide()
                }//if
            }//if-else
            	
            var likecheck="${heart.likecheck}"
            console.log(">>>> LIKECHECK >>>> ",likecheck); 
            if(likecheck==1){
                $("#likeimg").attr("src", "/resources/img/fullheart.png");
                $("#likeBtn").on("click",function(e){
                    // likeService.likeChecking(rnoValue);
                    likeService.unLike(rnoValue, userid);
                    alert("좋아요를 취소했습니다.");
                    $("#likeimg").attr("src", "/resources/img/emptyheart.png");
                    
                    console.log(">>>>>>>like check", likecheck);
                    
                /*     location.href="/review/get?rno=${reviewFilmUserVO.rno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}"
                 */
                 location.href="/film/${reviewFilmUserVO.film_id}/review/${reviewFilmUserVO.rno}"
                })
            }
            if(likecheck==0){
                $("#likeimg").attr("src", "/resources/img/emptyheart.png");
                $("#likeBtn").on("click",function(e){
                    // likeService.likeChecking(rnoValue);
                    likeService.likeIt(rnoValue, userid);
                    alert("좋아요를 눌렀습니다.");
                    $("#likeimg").attr("src", "/resources/img/fullheart.png");
                    
                    likecheck=1;
                    console.log(">>>>>>>like check", likecheck);
                    /*     location.href="/review/get?rno=${reviewFilmUserVO.rno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}"
                     */
                     location.href="/film/${reviewFilmUserVO.film_id}/review/${reviewFilmUserVO.rno}"
                })
            }
             showList(1);
            function showList(page){
                console.log("showList ! : nick:",nickname)
                replyService.getList({rno:rnoValue,page:page||1},function(list){
                    if(page== -1){
                        pageNum=Math.ceil(replyCnt/10.0);
                        showList(pageNum);
                        return;
                    }
                    var str="";
                    if(list==null||list.length==0){
                        str+="<div>아직 댓글이 없습니다.</div>"
                        // return;
                    }//if
                    for(var i=0, len=list.length||0; i<len; i++){
                        str+="      <div class='header'>";
                        str+="          <a href='/mypage/main?userid="+list[i].writer+"'><img class='rounded-circle' src='/resources/img/common.jpg' width='30px' height='30px'></a>";
                        str+="          <strong class='primary-font'>"+list[i].nickname+"</strong>";
                        // str+="          <button type='button' id='reportBtn'> <img src='/resources/img/siren.jpg' width='20px' height='20px'>신고</button>";
                        str+="          <samll class='pull-right text-muted' id='commentTs'>등록 "+replyService.displayTime(list[i].insert_ts)+" <c:if test='"+list[i].update_ts+"'><br>수정 "+replyService.displayTime(list[i].update_ts)+"</c:if>"+"</small>";
                        str+="      </div>"
                        str+="<li class='left clearfix' data-rcno='"+list[i].rcno+"'>";
                        str+="  <div>";
                        str+="      <p id='replycontent'>"+list[i].content+"</p>";
                        str+="   </div>";
                        str+="</li>";
                        str+="<hr>";
                    }
                    replyUL.html(str);
                })//end function
            }//showList
            
            $("#addReplyBtn").on("click",function(e){
                console.log("addReplyBtn")
                modal.find("input").val("");
                modalinputReplyDate.closest("div").hide();
                modal.find("button[id!='modalCloseBtn']").hide();
                modalRegisterBtn.show();
                replyComment.readOnly=false;
                $("#createComment").modal("show");
            })//onclick addReplyBtn
            modalRegisterBtn.on("click",function(e){
                var reply={
                    content:modalInputReply.val(),
                    rno:rnoValue,
                    writer:"${__LOGIN__.userId}"
                };
                replyService.add(reply,function(result){
                    alert(result); 
                    modal.find("input").val("");
                    modal.modal("hide");
                    showList(1);
                })
            })//modalRegisterBtn
            
    	})//jq
        $(function(){
            console.debug('>>> jq started.');
            $("#listBtn").on('click',function(){
                console.log(" >>> listBtn button clicked");
                location.href="/review/list?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}"
            }) //on click
            $("#modalRegisterBtn").on('click',function(){
                console.log(" >>> modalRegisterBtn clicked");          
            	location.href="/film/${reviewFilmUserVO.film_id}/review/${reviewFilmUserVO.rno}" 
            })//onclick
            $("#delete").on('click',function(){
                console.log("delete clicked.");
                if(confirm("리뷰를 삭제하시겠습니까?")){
                    let formobj=$('form');
                    formobj.attr('action','/film/review/remove');
                    formobj.attr('method','post');
                    formobj.submit();
                } else{
                	return false;
                }//if-else
            })//delete
            
        })//js
    </script>

    <style>
        body,input,textarea,select,button,table{font-family:'ELAND 초이스';}
        body,div,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,p,form,fieldset,input,table,tr,th,td{margin:0;padding:0;}
        h1,h2,h3,h4,h5,h6{font-weight:normal;font-size:100%;}
        ul,ol{list-style:none;}
        fieldset,img{border:0; vertical-align:top;}
        address{font-style:normal;}
        p,li,dd{font-size:1em; line-height:1.5em; text-align:justify;}
        /* a-style */
        a{color:#333;text-decoration:none;text-align: center;}
        a:hover,a:active,a:focus,a:visited{color:#333;text-decoration:none;}
        body{
		    width: 998px;
		    margin: 0 auto;
		    font-size: 20px;
            font-family: 'ELAND 초이스';
            -ms-user-select: none; 
            -moz-user-select: -moz-none;
            -khtml-user-select: none;
            -webkit-user-select: none;
            user-select: none; 
		}
		#commentTs{
			float: right;
		}
        #thiscategory{
            width: 90%;
            height: 100px;
            font-size: 50px;
            font-family: 'ELAND 초이스';
            text-align: center;
            margin: 0 auto;
        }
        #userinfo{
            display: inline-table;
            margin-left: 20px;
            height: 160px;
        }
        #getinfo{
            float: right;
            margin-top: 40px;
            margin-right: 20px;
        }
        #title{
            width: 50%;
            height: 40px;
            font-size: 26px;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #fcfcfc00; 
            border-radius: 30px;
        }
        #content{
            width: 100%;
            height: 100%;
            font-size: 19px;
            padding: 20px;
            background-color: #ffffff00; 
            border-radius: 30px;
        }
        #replycontent{
            width: 90%;
            margin-left: 32px;
            margin-top: 10px;
        }
        button {
            margin-left: 20px;
            background-color: white;
            font-family: "ELAND 초이스";
            font-size: 20px;
            font-weight: 400;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            width: auto;
            border: none;
            border-radius: 4px;
            /* box-shadow: 0 4px 6px -1px rgba(169, 235, 255, 0.781), 0 2px 4px -1px rgba(125, 160, 212, 0.425); */
            cursor: pointer;
            transition: 0.5s;
        }
        #threeBtn, #reportBtn{
            float: right;
        }
        #emptyheart{
            width: 20px;
            height: 20px;
        }
        table {
			width:100px;
		    text-align: center;
		    margin-top: 10px ;
            float: right;
		    font-size: 30px;
            font-family: 'ELAND 초이스';
  			border-collapse: collapse;
		  }
		 td{
		  	color: black;
		  	font-size:15px;
		  	padding: 10px;
  		  }
		  th{
		  	font-weight: bold;
		  	border:10px;
		  	margin:10px;
		  	padding:15px;
  		  }
        #commentList{
            display: inline-block;
            font-size: 16px;
        }
        #addReplyBtn{
            display: inline-block;
            float: right;
            font-size: 16px;
        }
        #reportBtn{
            float: right;
        }
        #isDeleteTs{
            margin-top: 300px;
            margin-left: 400px;
            }
            
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
       
    </style>
	
  </head>

  <body class="view">
	
      <div class="site-header-bg"></div>
<!--       <section>
        <div
          class="react-component"
          data-component-class="globals.comps.NavComponent"></div> -->

 
    <div id="content" class="site-body">
      <div class="content-wrap">
        <div class="cols-2">
          <section class="section col-17 col-main overflow">
            <div class="col-4 gutter-right-1">
              <section class="poster-list -p150 el col">
                <div
                  class="
                    really-lazy-load
                    poster
                    film-poster film-poster-506032
                    linked-film-poster
                  "
                  data-image-width="150"
                  data-image-height="225"
                >
                  <img
                    src="https://www.themoviedb.org/t/p/original${reviewFilmUserVO.poster_path}"
                    width="150"
                    height="225"
                    class="image"
                    itemprop="image"
                  />
                  <span class="frame"><span class="frame-title"></span></span>
                </div>
              </section>

              <div
                class="js-csi"
                data-on-load="csi-availability"
              ></div>
            </div>
 
            <section class="col-12 review">
              <section class="film-viewing-info-wrapper">
                <header class="page-header overflow person-header">
                  <div class="person-summary -inline">
                    <a class="avatar -a24" href="/mypage/main?userid=${reviewFilmUserVO.writer}">
                      <%-- <img src="https://younghoon.s3.ap-northeast-2.amazonaws.com/${reviewFilmUserVO.profile_photo_path}"
                        alt="${reviewFilmUserVO.writer}"
                        width="24"
                        height="24"
                      /> --%>
                    </a>  
                    <h1
                      class="title-4"
                      itemprop="author"> 
              
                      <a href="/mypage/main?userid=${reviewFilmUserVO.writer}" itemprop="sameAs" class="name">
                        <span itemprop="name">${reviewFilmUserVO.nickname}님의 리뷰 </span>
                      </a>
                    </h1>
                  </div>

                  <div class="clear"></div>
                </header>

                <h2 class="headline-2 prettify">
                  <span class="film-title-wrapper">
                    <a href="/film/${reviewFilmUserVO.film_id}/">${reviewFilmUserVO.title}</a>
                   <%--  <small class="metadata"> <fmt:formatDate value="${reviewFilmUserVO.release_date}" pattern="yyyy" /></small> --%>
                  </span>
                  <span class="rating rating-large rated-large-10">
                    <%-- ${reviewFilmUserVO.rate} --%>  ★★★★
                  </span>
                </h2>
        
              </section>

             
                <div>
                  <div>
                    <p>${reviewFilmUserVO.content}</p>
                  </div>
                </div>

              </div>
        </div>
      </div>
   
		
		<form method="POST" action="/film/${reviewFilmUserVO.film_id}/review/${reviewFilmUserVO.rno}">
            <input type="hidden" name="rno" value="${reviewFilmUserVO.rno}">
            <input type="hidden" name="userId" value="${__LOGIN__.userId}">
            <input type="hidden" name="likecheck" value="${reviewVO.likecheck}">
		<!-- 신고 / 좋아요 -->
            <div id="count">
                <table>
                    <tr>
                        <td>
                            <c:if test="${__LOGIN__==null}">
                                <img src="/resources/img/emptyheart.png" alt="좋아요" width="30px" height="30px">
                            </c:if>
                            <c:if test="${__LOGIN__.userId != null}">
                                <button id="likeBtn"><img id="likeimg" src="/resources/img/emptyheart.png" alt="좋아요" width="30px" height="30px"></button>
                            </c:if>

                        </td>
                    </tr>
                    <tr>
                        
                        <td>${heartCnt}</td>
                    </tr>
                </table>
            </div>

            <hr>
            <div id="content">
                       <div class="review body-text -prose -hero -loose">
       
              </div>
            </div>
            <hr>
            <div id="threeBtn">
                 <button type="button" id="modify" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifyModal">
                  수정 
                  </button>
				 <button type="button" id="delete" class="btn btn-outline-dark">삭제</button>
                <button type="button" id="listBtn" class="btn btn-outline-dark">목록</button>
            </div>                  

  		         <!-- Modal -->
            <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">${reviewFilmUserVO.original_title} 리뷰 수정하기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                    
                    <% 
                    
            	Integer writer = (Integer) session.getAttribute("userId");                   
            
                    %> 
        
<!--         <section class="col col-13 overflow expanded"> -->
             <form method="POST" action="/film/${reviewFilmUserVO.film_id}/review/m/${reviewFilmUserVO.rno}">
                
                <input type="hidden" name="film_id" value="${reviewFilmUserVO.film_id}" id="frm-film-id">
                <input type="hidden" name="writer" value="${__LOGIN__.userId}">
                <input type="hidden" name="rno" value="${reviewFilmUserVO.rno}">
                
                

                <fieldset>
                    
                    <div class="form-row">
                        <textarea name="content" id="frm-review" class="field">${reviewFilmUserVO.content}</textarea>
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
                 
                  </fieldset>

                    </div>
                    <div class="modal-footer">
                      <button id='modalRegisterBtn' type="button" class="btn btn-primary" data-bs-dismiss="modal">작성완료</button>
                   
                    </div>
                  
                  </div>
                   
                </div>
               
              </div>
              
	
  </body>
</html>