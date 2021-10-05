console.log(" >> BoardReport Module <<")

var reportService=(

    function(){
        
        function send(reportinfo,callback,error){
            console.log("== reportService.send invoked ==");
            $.ajax({
                type:'post',
                url:'/board/report',
                data: JSON.stringify(reportinfo),
                contentType: 'application/json; charset=utf-8',
                success: function(result, status, xhr){
                    if(callback){
                        callback(result);
                    }//if
                },//success
                error: function(xhr,status,er){
                    if(error){
                        error(er);
                    }//if
                }//error
            })//ajax
        }//send

        return{
            send:send
        }//return
    }//function
)();