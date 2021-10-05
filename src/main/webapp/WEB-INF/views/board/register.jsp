<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FILMEE | FILM MEETING</title>
    <link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    
    <script>
        $(function(){
            console.log("jq started");
            $("#listBtn").click(function(){
            	console.log(this)
                console.log("listBtn Clicked");
				if(confirm("작성 중이던 글이 있습니다. 정말 취소하시겠습니까?")){
	                location.href="/board/list?category=&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}"					
				} else{
					false;
				}
            })//listbtn
           
        })//jq
        function fn_addtoBoard(){
            var title=$("#title")
            var content=$("#content")
            if(title==""){
                console.log("title:",title)
                alert("제목을 입력하세요.")
                return false
            } 
            if(content==""){
                alert("내용을 입력하세요.")
                return false
            }
            var form = document.getElementById("writeForm");
            
            form.action = "register";
            // form.submit();
            return true;
            
        }//fn_addtoBoard
    </script>

    
   
    <style>
    #container{
        width: 998px;
        margin: 0 auto;
        font-size: 20px;
    }
    form{
        margin: 0 auto;
    }
    select {
    		float: left;
            font-size: 16px;
            font-weight: 400;
            font-family: 'ELAND 초이스';
            line-height: 1;
            color: #444;
            background-color: #fff;
            padding: 0.3em 0.4em;
            margin: 0;
            border: 1px solid rgb(255, 255, 255);
            border-radius: 0.5em;
            box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
        }
    .boardModifyButtons{
        margin : 10px 0px 5px 880px;
    }
    </style>
</head>
<body>
    <%@ include file="/resources/html/header.jsp" %>

    <div id="container">
        <form name="writeForm" method="post" id= "writeForm" enctype="multipart/form-data">
            <input type="hidden" name="currPage" value="${cri.currPage}">
            <input type="hidden" name="amount" value="${cri.amount}">
            <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
            <input type="hidden" name="writer" value="${__LOGIN__.userId}">
            <input type="hidden" name="files">
            <div>
                <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                    <thead>
                        <tr>
                            <th colspan="2" style="background-color: #eeeeee; text-align: center;">글쓰기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <select name="category" class="select">
                                    <option value='F'>자유</option>
                                    <option value='N'>소식</option>
                                    <option value='B'>자랑</option>
                                    <option value='R'>추천</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><input id="title" type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>
                        </tr>
                        <tr>
                            <td><textarea id="content"  class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height: 350px;"></textarea></td>
                        </tr>
                        <tr>
                            <td><input type="file" class="form-control" name="files"></td>
                        </tr>
                    </tbody>
                </table>             
            </div>
            <div class="boardModifyButtons">
                <button type="submit" id="submitBtn" onclick="fn_addtoBoard()" class="btn btn-primary pull-right">완료</button>
                <button type="button" id="listBtn"  class="btn btn-primary pull-right" >취소</button>
            </div>
        </form>
	</div>	
	<%@ include file="/resources/html/footer.jsp" %>
</body>
</html>