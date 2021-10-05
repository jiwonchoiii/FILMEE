<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device=width, initial-scale=1.0">
    <title>FILMEE | FILM MEETING</title>
    <link rel="icon" href="../../resources/img/favicon_noback.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>
        $(function(){
            console.clear();
            console.log("jq started");

            $('#searchBtn').click(function(e){
                console.log('onclick on #searchBtn clicked..');
                console.log('\t+ this :{} ', this);
                //Event에 의한 선택된 요소의 기본등작을 금지(무력화)
                e.preventDefault();

                // 아래 지역변수에는 Rvalue선택자에 의해서 선택된 요소
                // (즉, form 태그)가 저장됨
                var searchForm = $('#searchForm');

                searchForm.attr('action', '/complaint/listPerPage');
                searchForm.attr('method', 'GET');

                searchForm.find('input[name=currPage]').val($(this).attr('href'));
                //paginationForm에서 name 속성의 값이 currPage인 input태그를 찾아라
                //이벤트 타겟의 속성 중 href의 값을 해당 input 태그에 값으로 넣어준다.
                searchForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
                searchForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');



                searchForm.submit();

            })


              $("#modalSaveBtn").on('click',function(){
                
                var modalComplaintForm = $('#modalComplaintForm');
                modalComplaintForm.attr('action', '/complaint/temporary');

                modalComplaintForm.submit();

            })//modalSavenBtn

            $("#modalCompletionBtn").on('click',function(){
                
                var modalComplaintForm = $('#modalComplaintForm');
                modalComplaintForm.attr('action', '/complaint/completion');

                modalComplaintForm.submit();

            })//modalCompletionBtn
            
        })//jq
        function detail(compno, code, send, writer, content, content_re){
            var detail=$('#detailmodal');
            console.log("detail>> " + compno); 
            console.log("content>> " + content); 
            $('#complaintcompno').attr("value",compno);

            if(code==1){
                $('#complaintcode').attr("value", "서비스 개선요청");
            } else if (code==2){
                $('#complaintcode').attr("value", "영화정보 추가요청");
            } else if (code==3){
                $('#complaintcode').attr("value", "영화정보 수정요청");
            } else{
                $('#complaintcode').attr("value", "기타");
            }
            $('#complaintwriter').attr("value",writer);
            $('#complaintcontent').attr("value",content);


            $('#complaintcontent_re').attr("value",content_re);

            $(detail).modal("show");


          
        }//detail
            

            
        
    </script>


    <%@ include file="/resources/html/header.jsp" %>

    <style>
        body{
            -ms-user-select: none; 
            -moz-user-select: -moz-none;
            -khtml-user-select: none;
            -webkit-user-select: none;
            user-select: none; 
        }
        hr{
            width: 998px;
            margin: 0 auto;
        }

        #container{
        	margin-bottom: 50px;
            display: flexbox;
            flex-flow: column nowrap;
        }
                
        #menu{
        	font-size: 40px;
        	width: 998px;
        	margin: 0 auto;
        	text-align: center;
        }
		#adminboardlist {
			width: 998px;
			margin: 0 auto;
		    text-align: center;
		    font-size: 20px;
            font-family: 'ELAND 초이스';
  			border-collapse: collapse;
            border-bottom: 1px solid rgb(224, 224, 224);	

        }
        #adminselect{
            width: 998px;
			margin: 0 auto;
		    text-align: right;
		    font-size: 20px;
            font-family: 'ELAND 초이스';
        }
		#adminboardlist>tbody>tr>td{
		  	color: black;
		  	font-size:15px;
		  	padding: 15px;
        }
        #listline{ 
            background-color: #dddddd;
            color:rgb(0, 0, 0);
            font-weight: bold;
		  	border:10px;
		  	margin:10px;
		  	padding:15px;
            font-size: 18px;
  			border-bottom: 1px solid #ddd;
  			height: 50px;
  			line-height: 50px;
        }
        #adminmenuinfo{
            width: 100px;
            background-color: rgba(65, 105, 225, 0.185);
            border-radius: 10px;
            margin: 0 auto;
            text-align: center;
            margin-bottom: 10px;
        }
        #adminboardlist>tbody>tr:hover {
  		  	background-color: #dddddd60;
        }
        #beforeComplete{
            color: rgb(192, 192, 192)
        }
        #pageNumber{
		  	text-align: center;
            padding: 8px 16px;
        }
        #pageNumber>li{
		 	display:inline-table;
		    text-align: center;
		    padding: 10px;
			font-size: 15px;
        }
        #pageNumber>li:hover{
            background-color: rgb(224, 224, 224);
        }
        #detailbtn{
            border-radius: 5px; 
            margin-right:-4px;
            border: 1px solid skyblue; 
            background-color: rgba(0,0,0,0); 
            color: skyblue; 
            padding: 5px;
        }
        #detailbtn:hover{ 
            color:rgb(221, 250, 255);
            background-color: rgb(0, 0, 0); 
        }
        .forAdmin:hover{
            font-size: 17px;
            font-weight: bold;
            color: cornflowerblue;
        }
		.prev, .next{
			font-size: 20px;
		}
		.currPage{
            width: 15px;
        	background-color: #d8d8d88f;
        	color: rgb(45, 78, 139)!important;
            border-radius: 10%;
            font-size: 15px;
        }

        #searchimg{
            width: 20px;
        }
        #comModal{
                
                display: flex;
                flex-flow: column nowrap;
                align-items: center;
                justify-content: center;
                position: fixed;
                z-index: 1150;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                width: 200px;
                height: 60px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 5);
                background: #fff;
                border-radius: 5px;
                text-align: center;
                padding: 20px;
                box-sizing: border-box;
                text-decoration: none; 
                
                transition: all 0.5s;
                display: none;
                font-size: 18px;
                    
            }
        
    </style>
</head>

<body>
    <div id="container">
        <div>
            <div id="adminmenuinfo">관리자 전용</div>
            <div id=menu>
            	<h2>요청 현황</h2>
                <%@include file="/WEB-INF/views/admin/menu.jsp"%>
                
            </div>
            
        </div>
        
        <div id="admincontainer">
            
            <div>
                <div id="adminselect">
                    <form id="searchForm">
	                    <input type="hidden" name="currPage" value="1">
	                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	                    <input type="hidden" name="pagesPerPage" value="${pageMaker.cri.pagesPerPage}">
	                    <input type="hidden" name="totalAmount" value="${pageMaker.totalAmount}">
	                    
	                    <select name="code" class="search">
	                    
	                        <option value="" ${ ( "" eq pageMaker.cri.code) ? "selected" : ""}>전체</option>
	                        <option value="1" ${ ( "1" eq pageMaker.cri.code) ? "selected" : ""}>서비스 개선요청</option>
	                        <option value="2" ${ ( "3" eq pageMaker.cri.code) ? "selected" : ""}>영화정보 추가요청</option>
	                        <option value="3" ${ ( "2" eq pageMaker.cri.code) ? "selected" : ""}>영화정보 수정요청</option>
	                        <option value="4" ${ ( "4" eq pageMaker.cri.code) ? "selected" : ""}>기타</option>
	                    </select>
	                    
	                    <button><img id="searchimg" src="/resources/img/search.png"></button>
	            
	                </form>
                </div>
                <div>
                	
	                
            	
                    <table id="adminboardlist">
                        <colgroup>
                            <col width="8%"/>
                            <col width="22%"/>
                            <col width="12%"/>
                            <col width="18%"/>
                            <col width="18%"/>
                            <col width="12%"/>
                            <col width="10%"/>
                        </colgroup>
                        <thead>
                            <tr id=listline>
                                <th>No.</th>
                                <th>유형</th>
                                <th>요청회원</th>
                                <th>접수일</th>
                                <th>처리일</th>
                                <th>처리자</th>
                                <th>확인</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="complaint" varStatus="vs">
                                    <tr>
                                        <td>${complaint.compno}</td>
                                        <td>
                                            <c:choose>
                                                
                                                <c:when test="${complaint.code == 1}">
                                                    서비스 개선요청
                                                </c:when>
                                                <c:when test="${complaint.code == 2}">
                                                    영화정보 추가요청
                                                </c:when>
                                                <c:when test="${complaint.code == 3}">
                                                    영화정보 수정요청
                                                </c:when>
                                                <c:otherwise>
                                                    기타
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${complaint.writer}</td>
                                        <td><fmt:formatDate pattern="yyyy/MM/dd" value="${complaint.insert_ts}"/></td>
                                        <td>
                                            <c:choose>
                                            <c:when test="${complaint.complete_ts != null}">
                                                <fmt:formatDate pattern="yyyy/MM/dd " value="${complaint.complete_ts}"/>
                                            </c:when>
                                            <c:when test="${complaint.check_ts != null}">
                                                <beforeCom id="beforeComplete">처리중</beforeCom>
                                            </c:when>
                                            <c:otherwise>
                                                 <beforeCom id="beforeComplete">처리전</beforeCom>
                                            </c:otherwise>
                                        </c:choose>
                                        </td>
                                        <td>${complaint.mgr_id}</td>
                                        <td>
                                            <button type="button" id='detailbtn' onclick="detail('${complaint.compno}', '${complaint.code}', '${complaint.send}', '${complaint.writer}', '${complaint.content}', '${complaint.content_re}','${complaint.mgr_id}')">상세확인</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                    </table>
                </div>

                <div>
                    <form id="paginationForm">
                        <input type="hidden" name="currPage">
                        <input type="hidden" name="amount">
                        <input type="hidden" name="pagesPerPage">
                        <input type="hidden" name="code">
    
                        <ul id="pageNumber">
                            <c:if test="${pageMaker.prev}">
                                <li class="prev"><a class="prev" href="/complaint/listPerPage?currPage=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&totalAmount=${pageMaker.totalAmount}&code=${pageMaker.cri.code}"> < </a></li>
                                
                            </c:if>
    
                            <!-- begin~end까지 반복하고, 현재의 번호값은 var 속성에 넣어준다 -->
                            <c:forEach 
                                begin="${pageMaker.startPage}" 
                                end="${pageMaker.endPage}" 
                                var="pageNum">
    
                                <li class="${pageMaker.cri.currPage == pageNum ? 'currPage' : ''}">
                                    <a 
                                        class="${pageMaker.cri.currPage == pageNum ? 'currPage' : ''}"
                                        href="/complaint/listPerPage?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&totalAmount=${pageMaker.totalAmount}&code=${pageMaker.cri.code}">
                                        ${pageNum}
                                    </a>
                                </li>
                    
                            </c:forEach>
    
                            <c:if test="${pageMaker.next}">
                                <li class="next"><a class="next" href="/complaint/listPerPage?currPage=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&totalAmount=${pageMaker.totalAmount}&code=${pageMaker.cri.code}"> > </a></li>
                            </c:if>
                        </ul>
    
                    </form>
                </div>

            </div>
        </div>
    </div>
    <%@ include file="/resources/html/footer.jsp" %>

    <!-- Detail Modal -->
    <div class="modal fade" id="detailmodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><img src="/resources/img/siren.jpg" alt="" width="20px" height="20px"> 요청사항 상세 및 처리</h5>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                </div>

                <form id="modalComplaintForm" action="#" method="POST">
                    <input type="hidden" name="currPage" value="${cri.currPage}">
                    <input type="hidden" name="amount" value="${cri.amount}">
                    <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
                    <input type="hidden" name="mgr_id" value="${__LOGIN__.userId}">
					
                    
                    <div class="modal-body">
                    <input type="hidden" name="compno" id="complaintcompno">
                    
                        <div class="form-group">
                            <label for="complaintcode">요청유형</label>
                            <input class="form-control" name="code_code" id="complaintcode" readonly>
                        </div>
                        <div class="form-group">
                            <label for="complaintwriter">요청회원</label>
                            <input class="form-control" name="writer_writer" id="complaintwriter" value="" readonly>
                        </div>
                        <div class="form-group">
                            <label >내용</label>
                            <input type="text" name="content" class="form-control" cols="44" rows="5" id="complaintcontent" value="" readonly>
                        </div>      
                        <div class="form-group">
                            <label for="complaintcontent_re">처리사항</label>
                        	<input type="text" name="content_re" class="form-control" cols="44" rows="5" id="complaintcontent_re" value="" placeholder="요청사항에 대한 답변을 입력하세요.">
                        </div>
                        <div>
                            <label for="mgrid">현재 처리할 관리자</label>
                            <input class="form-control" type="text" id="mgrid" name="mar_nickname" value="${__LOGIN__.nickname}" readonly>
                        </div>
                        <div>
                            <c:choose>
                                <c:when test="${complaint.send == 1 }">
                                    mail:o
                                </c:when>
                                <c:when test="${complaint.send == 2 }">
                                    mail:x
                                </c:when>
                            </c:choose>
                        
                        </div>
                    <div class="modal-footer">
                        <button id='modalCloseBtn' type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button id='modalSaveBtn' type="button" class="btn btn-secondary" data-bs-dismiss="modal">임시저장</button>
                        <button id='modalCompletionBtn' type="button" class="btn btn-danger" data-bs-dismiss="modal">처리완료</button>
                    </div> 
                </form>

            </div>
        </div>
    </div>
</body>
</html>