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
        a:hover,a:active,a:focus,a:visited{color:#333;text-decoration:none;}
			
			bady{
	        	width: 998px;
	        }
            #header{
                background-color: #55072ef1;
                
                height: 200px;
            }
    
            
    
            #session{
                background-color:  #f1c0d900;;
                padding: 10px;
    
                
                
                display: flex;
                
                flex-flow: row nowrap;


            }
    
            

         	#mgr_nav{
         		border-radius: 5px;
         		padding: 30px;
                background-color: #ffffff3d;
                height: 400px;
                white: 50px;
         	}
    
            #main{
                border-radius: 5px;
                padding: 30px;
                margin-left: 100px;
                background-color: #ffffff3d;
                height: 400px;
                white: 300px;
            }
    
            #aside{
                flex-basis: 15%;
            }
    
            #footer{
    
                background-color: #0f0108c5;

                height: 200px;
            }

            
            
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
            <div id="header">header</div>
        </header>
    
    
    
        <session  id="session">
            
            <div id="mgr_nav">
            
                <jsp:include page="mgrNav.jsp"/>
            </div>
    
            <div id="main">
                <jsp:include page="list.jsp"/>


            </div>
    
            <div id="aside"></div>
            
    
        </session>
    
    <footer>
    	<div id="footer">footer</div>
    </footer>
        

           
    </body>
    </html>