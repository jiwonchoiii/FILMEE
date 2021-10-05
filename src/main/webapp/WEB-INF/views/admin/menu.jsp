<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title></title>

        <style>
            #allMenu {
                font: bold 20px;
                display: inline-block;
                text-align: center;
                width: 998px;
                height: 10%;
                margin-top: 15px;
                margin-bottom: 35px;
            }
            #menus>li{
                display: inline-block;
                font-size: 20px;
                width: 18%;
                text-align: center;
            }
            #menus>li:hover{
                font-weight: bold;
                font-size: 24px;
            }
        </style>
    </head>

    <body>
        <div id="allMenu">
            <div>
                <ul id="menus">
                    <li><a href="/admin/main">전체</a></li>
                    <li><a href="/admin/user">회원현황</a></li>
                    <li><a href="/admin/report/list">신고현황</a></li>
                    <li><a href="/complaint/listPerPage?currPage=1&amount=10&pagesPerPage=10">요청현황</a></li>
                </ul>
            </div>
        </div>

    </body>

    </html>