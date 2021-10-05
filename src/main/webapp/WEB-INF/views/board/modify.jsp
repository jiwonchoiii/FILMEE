<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FILMEE | FILM MEETING</title>
    <link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">

    <!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script>
        $(function(){
            console.log("jq started");
            $("#listBtn").on('click',function(){
            	console.log(this)
                console.log("listBtn Clicked");
				if(confirm("작성 중이던 글이 있습니다. 정말 취소하시겠습니까?")){
	                location.href="/board/list?category=&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}"					
				} else{
					false;
				}	
            })	
        })
    </script>
    <style>
        #boardModifyWrapper{
            width: 998px;
            margin: 0 auto;
            font-size: 20px;
        }
        #writeapost{
            margin: 20px;
            text-align: center;
            font-size: 40px;
        }
        form{
            margin: 0 auto;
        }
        table{
        	font-family: 'ELAND 초이스';
        }
        select {
            width: 250px;
            float: left;
            font-size: 16px;
            font-weight: 400 bold;
            font-family: 'ELAND 초이스';
            line-height: 1;
            color: #444;
            background-color: #fff;
            padding: 0.3em 0.4em;
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

    <div id="boardModifyWrapper">
        <form action="/board/modify" method="POST">
            <input type="hidden" name="currPage" value="${cri.currPage}">
            <input type="hidden" name="amount" value="${cri.amount}">
            <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
            <input type="hidden" name="bno" value="${board.bno}">

            <div>
                <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
                            <td><label for="bno">글번호</label></td>
							<td><input type="text" class="form-control" name="bno" value="${board.bno}" readonly></td>
						</tr>
                        <tr>
                        	<td><label for="category">카테고리</label></td>
                            <td>
                                <select name="category" id="category">
                                    <option value="F" selected>자유</option>
                                    <option value="N" selected>소식</option>
                                    <option value="B" selected>자랑</option>
                                    <option value="R" selected>추천</option>

                                </select>
                            </td>
                        </tr>
						<tr>
							<td><label for="title">제목</label></td>
                            <td><input type="text"  class="form-control" name="title" value="${board.title}" maxlength="50"></td>
						</tr>
                        <tr>
                            <td><label for="content">내용</label></td>
                            <td><textarea class="form-control" name="content"  maxlength="2048" style="height: 350px">${board.content}</textarea></td>
                        </tr>
                        <tr>
                            <td><label for="writer">작성자</label></td>
                            <td>
                                <input type="text" class="form-control" value="${board.nickname}">
                                <input type="hidden"  class="form-control" name="writer" value="${board.writer}" readonly>
                            </td>
                        </tr>

					</tbody>
				</table>
                <div class="boardModifyButtons">
                    <button type="submit" class="btn btn-primary" onclick="goWrite(this.form)">완료</button>
                    <button type="button" id="listBtn" class="btn btn-primary" >취소</button>
                </div>
            </div>
        </form>
    </div>

    <%@ include file="/resources/html/footer.jsp" %>

</body>
</html>