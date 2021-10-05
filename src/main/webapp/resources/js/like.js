console.log(" ** >> Like Module << **");
var likeService = (

    function(){
        
        function likeIt(bno, userid, callback, error){
            console.log(userid+"회원 좋아요 >>"+bno);
            $.ajax({
                type: 'post',
                url: '/board/like/'+bno+'/'+userid,
                success: function(result,status,xhr){
                    if(callback);
                },//success
                error:function(xhr,status,er){
                    if(error){
                        error(er);
                    }//if
                }//error
            })//ajax
        }//newHeart



        function unLike(bno,userid,callback,error){
            console.log(userid+"회원 좋아요 취소 >>"+bno);
            $.ajax({
                type: 'post',
                url: '/board/unlike/'+bno+'/'+userid,
                success: function(result,status,xhr){
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
        }//unLike


        function likeChecking(bno, callback, error){
            console.log("ajax_get");
                // $.get("/board/get")
            $.ajax({
                type:'post',
                url:'/board/like/check/'+bno,
                success: function(result,status, xhr){
                    if(callback){
                        callback(result);
                    }
                },
                error: function(xhr,status,er){
                    if(error){
                        error(er);
                    }//if
                }//error
            })//ajax
        }//likeCehck

        return{
            likeIt: likeIt,
            unLike: unLike,
            likeChecking: likeChecking
        }
    }//function

)();//likeService