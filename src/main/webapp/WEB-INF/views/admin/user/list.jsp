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

        function open_admin_modal(userId, isAdmin){
            console.debug("open_modal_a clicked");
            console.log("userId : ", userId);
            console.log("isAdmin : ", isAdmin);

            
            var userIdInput = document.createElement("input");
            userIdInput.setAttribute("type", "hidden");
            userIdInput.setAttribute("name", "userId");
            userIdInput.setAttribute("value", userId);
            
            var isAdminInput = document.createElement("input");
            isAdminInput.setAttribute("type", "hidden");
            isAdminInput.setAttribute("name", "isAdmin");
            isAdminInput.setAttribute("value", isAdmin);
            
            var changeIsAdmiForm = document.getElementById("change_isAdmin_form");
            changeIsAdmiForm.appendChild(userIdInput);
            changeIsAdmiForm.appendChild(isAdminInput);
            
            changeIsAdmiForm = $('#change_isAdmin_form');
            changeIsAdmiForm.find('input[name=currPage]').val('${pageMaker.cri.currPage}' );
            changeIsAdmiForm.find('input[name=amount]').val( '${pageMaker.cri.amount}' );
            changeIsAdmiForm.find('input[name=pagesPerPage]').val( '${pageMaker.cri.pagesPerPage}' );
            changeIsAdmiForm.find('input[name=type]').val( '${pageMaker.cri.type}' );
            changeIsAdmiForm.find('input[name=keyword]').val( '${pageMaker.cri.keyword}' );
            changeIsAdmiForm.find('input[name=category]').val( '${pageMaker.cri.category}' );

            $("#change_isAdmin_form p").text(userId+"번 회원의 관리자 설정을 변경하시겠습니까?");
            
            $("#admin_modal").modal("show");
        }//open_admin_modal

        $(function(){
            console.clear();
            console.log("jq started");

            $('a.prev, a.next').on('click', function(e) {
                console.debug("onclicked for a.next or a.prev");
                console.log('\t+ this : ', this);

                e.preventDefault();

                var paginationForm = $('#paginationForm');

                paginationForm.attr('action', '/admin/user');
                paginationForm.attr('method', 'GET');

                paginationForm.find('input[name=currPage]').val($(this).attr('href') );
                paginationForm.find('input[name=amount]').val( '${pageMaker.cri.amount}' );
                paginationForm.find('input[name=pagesPerPage]').val( '${pageMaker.cri.pagesPerPage}' );

                paginationForm.submit();
            });//onclick a.prev, a.next


            $('#admin_user_search_submit').on('click',function(e){
                e.preventDefault();

                var adminUserSearchForm = $('#admin_user_search_form');

                adminUserSearchForm.find('input[name=amount]').val( '${pageMaker.cri.amount}' );
                adminUserSearchForm.find('input[name=pagesPerPage]').val( '${pageMaker.cri.pagesPerPage}' );

                adminUserSearchForm.submit();
            });//onclick admin_user_search_submit
   
        })//jq
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
        	width:998px;
        	margin: 0 auto;
        }
        #userStatus{
            margin: 0 auto;
            text-align: center;
            margin-bottom: 10px;
        }
   		#userStatus>ul>li{
   			display: inline;
            font-size: 18px;
            text-align: center;
   		}   		               
        #menu{
        	font-size: 40px;
        	width: 998px;
        	margin: 0 auto;
        	text-align: center;
        }
		#adminuserlist {
			width: 998px;
			margin: 0 auto;
		    text-align: center;
		    font-size: 20px;
            font-family: 'ELAND 초이스';
  			border-collapse: collapse;
            border-bottom: 1px solid rgb(224, 224, 224);	

        }
		#adminuserlist>tbody>tr>td{
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
        #adminuserlist>tbody>tr:hover {
  		  	background-color: #dddddd60;
        }
        td{
        	overflow: hidden;
        	text-overflow: ellipsis;
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
        /* #detailbtn{
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
        } */
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
        #div_ausf{
            margin: 30px 0 70px 315px;
        }

    </style>
</head>

<body>
    <div id="container">
        <div>
            <div id="adminmenuinfo">관리자 전용</div>
            <div id=menu>
            	<h2>회원 현황</h2>
                <%@include file="../menu.jsp"%>
            </div>
        </div>
        <div id="admincontainer">
            
            <div>
                <div id='userStatus'>
                    <ul>
                        <li><a href="/admin/user?category=T&currPage=1&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
                            총 회원 수 : ${count.total}명</a> | </li>
                        <li><a href="/admin/user?category=A&currPage=1&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
                            총 활동 회원 수 : ${count.acc}명</a> | </li>
                        <li><a href="/admin/user?category=S&currPage=1&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
                            총 정지 회원 수 : ${count.acc_suspended}명</a> | </li>
                        <li><a href="/admin/user?category=D&currPage=1&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
                            총 탈퇴 회원 수 : ${count.acc_deleted}명</a></li>
                    </ul>
                </div>
                

                <div>
                    <table id="adminuserlist">
                        <thead>
                            <tr id='listline'>
                                <th>No.</th>
                                <th>이메일</th>
                                <th>닉네임</th>
                                <th>가입일</th>
                                <th>정지기간</th>
                                <th>탈퇴일</th>
                                <th>관리자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="user" varStatus="vs">
                                    <tr><td>${user.userId}</td> 
                                        <td>${user.email}</td>
                                        <td><a href="/mypage/main?userid=${user.userId}">${user.nickname}</a></td>
                                        <td><fmt:formatDate pattern="yyyy/MM/dd" value="${user.joinTs}"/></td>
                                        <td>
                                            <c:if test="${user.susFrom==null}">
												-
											</c:if>                                           
                                            <c:if test="${user.susFrom!=null}">
                                            	<fmt:formatDate pattern="yyyy/MM/dd" value="${user.susFrom}"/> ~ <fmt:formatDate pattern="yyyy/MM/dd" value="${user.susTo}"/>
                                            </c:if>                                  
										</td>
                                        <td>
                                            <c:if test="${user.deleteTs==null}">
												-
											</c:if>                                           
                                            <c:if test="${user.deleteTs!=null}">
                                        		<fmt:formatDate pattern="yyyy/MM/dd" value="${user.deleteTs}"/>
											</c:if>
										</td>                                     
                                        <td><a href="#" onclick="javascript:open_admin_modal('${user.userId}', '${user.isAdmin}')">${user.isAdmin}</a></td>                      
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
        
                        <ul id="pageNumber">
                            <c:if test="${pageMaker.prev}">
                                <li class="prev"><a class="prev" href="${pageMaker.startPage-1}"></a></li>
                            </c:if>    
        
                            <c:forEach 
                                begin="${pageMaker.startPage}" 
                                end="${pageMaker.endPage}" 
                                var="pageNum">
                                <li class="${pageMaker.cri.currPage==pageNum?'currPage':''}">
                                    <a
                                        class="${pageMaker.cri.currPage==pageNum?'currPage':''}"
                                        href="/admin/user?category=${pageMaker.cri.category}&currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
                                        ${pageNum}
                                    </a>    
                                </li>
                            </c:forEach>
                            <c:if test="${pageMaker.next}">
                                <li class="next"><a class="next" href="${pageMaker.endPage+1}"> > </a></li>
                            </c:if>   
                        </ul>
                    </form>
                </div>
                <div id="div_ausf">
                    <form id="admin_user_search_form" class="d-flex" action="/admin/user" method="GET">
                      <input type='hidden' name='category' value="T">
                      <input type='hidden' name='currPage' value='1' >
                      <input type='hidden' name='amount'>
                      <input type='hidden' name='pagesPerPage'>
                          <select class="form-select" name="type" aria-label="Default select example" style="width: 130px">                            
                              <option value="N" selected>Nickname</option>
                              <option value="E">Email</option>                            
                          </select>
                            <input class="form-control me-2" type="search" name='keyword' placeholder="Search" aria-label="Search" style='width: 150px'>                                                                        
                            <button id='admin_user_search_submit' class="btn btn-secondary" type="submit" style='width: 80px; font-size: 13px;'>Search</button>
                      </form>
                  </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="admin_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content"> 
                <form id="change_isAdmin_form" action="/admin/user/changeIsAdmin" method="POST">
                    <div class="modal-body">
                        <p style="font-size: 16px; text-align: center;"></p>
                        <input type="hidden" name="currPage">
                        <input type="hidden" name="amount">
                        <input type="hidden" name="pagesPerPage">
                        <input type="hidden" name="type">
                        <input type="hidden" name="keyword">
                        <input type="hidden" name="category">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary submit_form" data-bs-dismiss="modal">Change</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    

    <%@ include file="/resources/html/footer.jsp" %>

</body>
</html>