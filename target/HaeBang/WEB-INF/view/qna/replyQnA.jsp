<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script>
//댓글 목록 
var q_no = '${ QnA.q_no }'; //게시글 번호
 
function commentList() {
	$.ajax({
		url : '${ pageContext.request.contextPath }/reply/list',
		type : 'get',
		data : {'q_no':q_no},
		success : function(data) {
			var a = '';
			data = JSON.parse(data);
			if (data.length > 0) {
				$.each(data,function(key, value) {
					a += '<div class="commentArea"  margin-bottom: 15px;">';
					a += '<hr style="color:lightgray"/>';
					a += '<div class="commentInfo'+value.r_no+'">'+ ' 작성자 : ' + value.r_writer;
					a += '<div class="commentContent'+value.r_no+'"> <p> 내용 : ' + value.r_content + '</p>';
					a += '<hr style="color:lightgray"/>';
					a += '</div></div>';
				});
			}

			$(".commentList").html(a);
		},
		error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
$(document).ready(function() {
	commentList(); //페이지 로딩시 댓글 목록 출력 
	
}); 

</script>