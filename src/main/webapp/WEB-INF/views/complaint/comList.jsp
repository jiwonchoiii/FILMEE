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
        <link rel="stylesheet" href="/resources/css/complaint.css">
        <style>
        
            
            
        </style>
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    
        <script>
        $(function(){
    
            console.clear();
    
           
    
        });
    
        </script>
    
    </head>
    <body>
        
        <header>
           <%@include file="/resources/html/header.jsp" %>
        </header>
 
        <session  id="session">
            
            <div id="mgr_nav">

                <jsp:include page="mgrNav.jsp"/>
            </div>
    
            <div id="main">
                <jsp:include page="list.jsp"/>

			</div>
         

        </session>
    
    <footer>
   
    </footer>
     
    </body>
    </html>