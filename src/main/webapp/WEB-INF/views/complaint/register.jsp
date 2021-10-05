<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
     

<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>

 
        <style>
            #popup{

                
                position: fixed;
                z-index: 1100;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                width: 500px;
                
                box-shadow: 0 0 10px rgba(0, 0, 0, 5);
                background: #fff;
                border-radius: 5px;
                text-align: right;

                box-sizing: border-box;
                text-decoration: none; 
                
                transition: all 0.5s;
                display: none;
            }

            #com_register_btn{
                
                display:  block; 
                height: 38px;
                
                border: 1px solid #212529;;;
                
                text-decoration: none;
                text-align: center;
                line-height: 10px;
                color: #212529;;
                border-radius: 100px;
                
                display: none;
            }
            hr{
               width: 100%;
            }
            #com_register_btn:hover{
               color: white;
                background-color: #212529;;
            }

            #com_popup_header{
                display: flex;
                flex-flow: row nowrap;
                justify-content: space-between;
                
            }
            
            .com_popup_all{
                margin: 20px;
            }

            #compl_title{
                font-size: 25px;
            }
            #compl_close{
                margin-top: 10px;
                
                text-decoration: none;
                font-size: 20px;
            }
            #compl_close:hover{
                
                border: 2px solid #0f0f0fcc;
            }
            #compl_close:active{
                color: #ffffffed;;
                background-color: #f0adceed;;
            }
            #com_popup_body{
                display: flex;
                flex-direction: column;
                justify-items: left;
                text-align: left;
            }
            
            #comp_select{
                display: flex;
                flex-flow: row;
                width: 100%;
                height: 40px;
                border: 2px solid #0f0f0fcc;
                
            }

            #comp_text{
                border: 2px solid #f0adce96 ;
                font-size: 20px;
                width: 455px;
                
                
                margin-top: 5px;
                height: 340px;
                border: 2px solid #cecdcd96;
            }
            #chackbox{
                text-align: left;
            }

            #comp_submit{
                width: 460px;
                margin-top: 5px;
                color: rgb(0, 0, 0);
                background-color: white;
                border: 2px solid #000000;
            }
            #comp_submit:hover{

                background-color: rgb(93, 93, 93);
                color: white;
                border: 2px solid rgb(93, 93, 93);
            }
            #comp_submit:active{
                background-color: #f0adce96;
                color: white;
                border: 2px solid #f0adce96;3);
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
            .com_popup_text{
                justify-self: left;
            }
            #comp_code{
                justify-self: left;
               
            }
            #comp_cont{
                justify-self: left;
            }
            #comp_send{
                justify-self: left;
            }
        </style>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

        <script>
     
            $(function(){               
                 var comResult = "<c:out value='${comResult}'/>";
               console.log("comResult:"+comResult);
               
               if(comResult.length > 0){


               if(comResult==true){  
                       
                       $("#comModal").show("slow");
                       $("#comModal").add("z-index=1100")
                  }//if
                  
                  jQuery(document).ready(function() {
                       $('#comModal').show();
                  });                  
                        
                  //모달을 시간이 지나면 자동으로 숨김 1000초가 1초
                  setTimeout(function() { $('#comModal').hide();}, 2000);                                                                                    
                }//if
               
                
                $("#compl_close").click(function(){
                    $("#popup").hide("com_register_btn");
                });//#hide

                $("#com_register_btn").click(function(){
                    $("#popup").show("slow");
                    $("#popup").add("z-index=1100")
                });
           
            
                var login="${__LOGIN__.userId}";
                 
            if(login.length>0){
                   
                   $(document).ready(function(){
                        $("#com_register_btn").show("slow");
                      })
                }
            });
         
            
        </script>


    </head>
    <body>
        <div id="popup"> 
            <form action="/complaint/register" method="POST">
                <input type="hidden" name="writer" value="${__LOGIN__.userId}">

                <div id="com_popup_header" class="com_popup_all">
                    <div id="compl_title">요청하기</div>
                    <button type="button" id="compl_close">X</button>
                </div>    
                <hr>
                <div id="com_popup_body" class="com_popup_all">
                    <div id="com_popup_select">
                        <label for="code" class="com_popup_text" id="comp_code">요청유형</label>
                        <select name="code" id="comp_select">
                            <option value="1">버그리포트</option>
                            <option value="2">영화 수정</option>
                            <option value="3">영화 추가</option>
                            <option value="4">기타</option>
                        </select>
                    </div>
                    <div id="comp_cont">
                        <label for="content" class="com_popup_text">내용</label>
                        <textarea name="content" id="comp_text" cols="54" rows="15"placeholder="요청사항을 입력하세요." ></textarea>
                        
                    </div>
                    <div id="comp_send" class="com_popup_text">
                        <input type="checkbox" id="checkbox" name="send" value="1" checked>답변 받기
                    </div>

                </div>

                <hr>
                <div id="com_popup_footer" class="com_popup_all">

                    <button id="comp_submit" type="submit" value="results">보내기</button>
                </div>
            </form>
        </div>
      
        <div id="comModal">
            <div id="comModalClo" >${comResult}</div>
        </div>
    </body>
</html>