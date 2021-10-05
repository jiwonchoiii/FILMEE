<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    <!DOCTYPE html>

    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <style>
        body,input,textarea,select,button,table{font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size:12px; color:#333;}
        body,div,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,p,form,fieldset,input,table,tr,th,td{margin:0;padding:0;}
        h1,h2,h3,h4,h5,h6{font-weight:normal;font-size:100%;}
        ul,ol{list-style:none;}
        fieldset,img{border:0; vertical-align:top;}
        address{font-style:normal;}
        p,li,dd{font-size:1em; line-height:1.5em; text-align:justify;}
        a:hover,a:active,a:focus,a:visited{color:#333;text-decoration-line:none;}

           
            
    
            #nav{
                font-size: 20px;
                color:  #5f2944fd;
    
                border-right-sttle: black solid 2px 90%;
                background-color: #ffffff;
                width: 200px;
                
                padding: 10px;
                margin-top: 50px;
                margin-left: 50px;
                border: black solid 2px;
                border-radius: 5px;
    
                display: flex;
                flex-flow: column nowrap;
                align-items: center;
                
            }
            #title{
                height: 30px;
                
                margin-bottom: 20px;
            }
            .nav{

                padding-top: 10px;
                height: 40px;
                border-radius: 5px;

            }

            .nav_a{
                text-decoration-line:none;
            }
            #all:focus,#member:focus,#review:focus,#complaint:focus,#report:focus,#move:focus{
                border: 2px solid black;
                text-decoration-line:none;
            }
            
            #all:active,#member:active,#review:active,#complaint:active,#report:active,#move:active{
                background-color: rgba(156, 150, 141, 0.829);
                text-decoration-line:none;
            }

         
    

    

    


            
            
        </style>
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    
        <script>
        $(function(){
    
           
            
           
           
    
        });
    
        </script>
    
    </head>
    <body>
        
        <div id="nav">
                <div id="title">관리자메뉴</div>
                
                <div class="nav" id="all">
                    <a class="nav_a" href="http://desktop-mpqhsj5:8090/complaint/listPerPage?currPage=1&amount=10&pagesPerPage=10">전체관리</a>
                </div>
                <div class="nav" id="member">
                    <a class="nav_a" href="http://desktop-mpqhsj5:8090/complaint/listPerPage?currPage=1&amount=10&pagesPerPage=10">회원관리</a>
                </div>
                <div class="nav" id="review">
                    <a class="nav_a" href="http://desktop-mpqhsj5:8090/complaint/listPerPage?currPage=1&amount=10&pagesPerPage=10">리뷰관리</a>
                </div>
                <div class="nav" id="complaint">
                   <a class="nav_a" href="http://desktop-mpqhsj5:8090/complaint/listPerPage?currPage=1&amount=10&pagesPerPage=10">요청관리</a>
                </div>
                <div class="nav" id="report">
                    <a class="nav_a" href="http://desktop-mpqhsj5:8090/complaint/listPerPage?currPage=1&amount=10&pagesPerPage=10">신고관리</a>
                </div>
                <div class="nav" id="move">
                    <a class="nav_a" href="http://desktop-mpqhsj5:8090/complaint/listPerPage?currPage=1&amount=10&pagesPerPage=10">영화관리</a>
                </div>
        </div>
        

           
    </body>
    </html>