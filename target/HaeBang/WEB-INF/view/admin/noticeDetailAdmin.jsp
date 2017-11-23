<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>해방 사장님 사이트 </title>
</head>
 <body>
    	<header> 
    		<jsp:include page="../admin_include/topmenu.jsp"/>
		</header>

		<section>
			<jsp:include page="../common_include/noticeDetail.jsp">
				<jsp:param value="/admin" name="path"/>
			</jsp:include>
		</section>
    
     

		<footer> 
			<jsp:include page="../admin_include/bottom.jsp" />
		</footer>

  </body>

</html>