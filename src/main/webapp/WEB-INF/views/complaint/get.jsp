<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>get.jsp</title>

    <style>
        body,input,textarea,select,button,table{font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size:12px; color:#333;}
        body,div,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,p,form,fieldset,input,table,tr,th,td{margin:0;padding:0;}
        h1,h2,h3,h4,h5,h6{font-weight:normal;font-size:100%;}
        ul,ol{list-style:none;}
        fieldset,img{border:0; vertical-align:top;}
        address{font-style:normal;}
        p,li,dd{font-size:1em; line-height:1.5em; text-align:justify;}
        a:hover,a:active,a:focus,a:visited{color:#333;text-decoration:none;}

        a, a:link, a:visited{
            cursor : pointer;
        }
		
	
        #container{

            display: flex;
            flex-flow: column nowrap;
            align-items: center;
			
            background: #fff;
            
            text-align: left;    
        }
        #com_head{
            font-size: 20px;
            
        }
        #com_info{
            display: flex;
            justify-content: space-between;
            width: 400px;
        }

        #com_back_a{
			text-decoration:none;
            
            
            color: rgb(129, 117, 117);
            font-size: 13px;
        }

        .com_info_item{
            
        }
        #listBtn{
            
        }
        #com_code{
            align-items: center;
            border: black 1px solid;
            height: 30px;
            font-size: 22px;
            text-align: center;
        }
        #com_time{
            display: flex;
            flex-flow: row nowrap;
            justify-content: space-between
            
        }
        #com_cont{
            width: 400px;
            height: 180px;
            border: 1px solid black;
            font-size: 20px;
        }
        #botBtn{
            display: flex;
            flex-flow: row nowrap;
            justify-content: space-between
        }
        .botBtn{
            width: 165px;
            border: none;
            background-color: rgba(97, 93, 88, 0.945);
            color: white;
        }
        .com_textarea{
        width: 400px;
        font-size: 20px;
        }
        
        #com_content{
        	word-wrap : initial
        }
        
        
    </style>

    <script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js></script>
    <script src=https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js></script>

    <script>
        $(function(){
            
            console.debug('jq started..');

       

            $("#temporaryBtn").click(function(){
                console.log('#temporaryBtn button clicked..');

                
                $("#com_form").attr("action","/complaint/temporary");
               //$("comform").attr("method","POST");
                //$("#completeBtn").attr("type","submit");
               // $("form").action="/complaint/complete";
                
                //location.href = "/complaint/comList";
                //location.href = "/complaint/complete?compno=${complaint.compno}
                // location.href = "/complaint/complete?compno=${complaint.compno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
                	
                
                
           });
            $("#completeBtn").click(function(){
                console.log('#completeBtn button clicked..');

                $("#com_form").attr("action","/complaint/completion");
              
            });
        })
    </script>


</head>
<body>
	
    <div id="container">
        <div id="com_head">
            <b>요청관리</b>
        </div>

        
       <br>
       <div id="com_info">
            <a class="com_info_item" id="com_back_a" href="javascript:history.back();">닫기</a>
            <div><p>요청번호: ${complaint.compno}</p></div>
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

       </div>
        


        <form id="com_form" name="comform" action="#" method="POST">
	        <!-- <form name="from">  -->
	        <input type="hidden" name="currPage" value="${cri.currPage}">
	      	<input type="hidden" name="amount" value="${cri.amount}">
	        <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
			<input type="hidden" name="writer" value="${complaint.writer}">
			<input type="hidden" name="compno" value="${complaint.compno}">
	
	
			
	        <div id="com_code">
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
	        </div>
	
	
	        <div id="com_time">
	            <div>
	               <Br>
	            </div>
	            <div>
	                <fmt:formatDate pattern="yyyy/MM/dd " value="${complaint.insert_ts}"/>
	            </div>
	        </div>
	
	        <div id="com_cont">
	        	<textarea class="com_textarea" cols="28" rows="6" readonly><c:out value="${complaint.content}"/></textarea>
	        </div>
	
	        <br>
	        
	        <div>
	            <textarea name="content_re" class="com_textarea" cols="28" rows="8" placeholder="요청사항에 대한 답변을 입력하세요."><c:out value="${complaint.content_re}"/></textarea>
	        </div>
	
	        <div id="botBtn">
	            <div>
	                <button type="submit" id="temporaryBtn" class="botBtn">임시저장</button>
	            
	            </div>
	            <div>
	                <button type="submit" id="completeBtn" class="botBtn">처리완료</button>
	            
	            </div>
	        </div>
        </form>
        

    </div>

    
</body>
</html>