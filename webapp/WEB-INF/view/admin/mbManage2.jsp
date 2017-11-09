<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin`s HaeBang - memeberManagement </title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

$(document).ready(function(){
    $("#member").click(function(){
          $.ajax({         
             url	: 	"/admin/mbManage",
             type	: 	"json",
             cache	: 	false,
             data	: {
            	 
                no: $("#no").val(),
                id: "${ sessionScope.userVO.nickname }",
                reply_content: $("#reply_content").val()
                
             },
             
             success : function(data) {
                alert("해방회원 조회.");
                $("#con").html(""); 
                
                var key = Object.keys(data["list"][0]);

             }   
          })
    })   
});
    
</script>
<body>
	<header>
		<jsp:include page="/WEB-INF/view/admin_include/topmenu.jsp"/>
	</header>

	<section>
	<h1> 회원 관리 페이지 </h1>
	
	<input type="button" id="member" value="해방회원">
	<div id="con"></div>
	
	</section>
	
	<footer>
		<jsp:include page="/WEB-INF/view/admin_include/bottom.jsp"/>
	</<footer>
</body>
</html>