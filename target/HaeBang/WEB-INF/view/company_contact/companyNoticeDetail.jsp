<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
   function doAction(type) {
      
      switch(type){
      
      case 'U':
            location.href="/ceo/notice?no=${param.no}";
         break;
         
      case 'D':
         if(confirm("삭제하시겠습니까?")){
            location.href = "/ceo/notice?no=${param.no}"; 
         }
         break;
         
      case 'L': 
         location.href = "${pageContext.request.contextPath}/ceo/notice";
         break;
      
      }
      
   }  
      
      
      
</script>
<style>

table {
	border: 1px solid black;
	height: 500px;	
	width: 80%;
}

th { 

	text-align: center;	

}

tr {
	border: 1px solid black;	
}

td {
	border: 1px solid black;
}

strong {
	vertical-align: middle;
}

</style>


    <meta charset="utf-8">
<title>해방 사장님 사이트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<!-- css -->
<link
	href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link
	href="${ pageContext.request.contextPath }/resources/css/jcarousel.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/flexslider.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/style.css"
	rel="stylesheet" />

<!-- Theme skin -->
<link
	href="${ pageContext.request.contextPath }/resources/skins/default.css"
	rel="stylesheet" />

  <body>

   
    		<header> <jsp:include page="../employee_include/topmenu.jsp" />
		</header>


    <div class="container">
    <div class="bg-faded p-4 my-4">
   <div align="center">
     	<div align="center">
			<hr>
			<h2>
				<strong>공지사항</strong>
			</h2>
			<hr>
		</div>		
       
      
   <table>         
         <tr>
            <th style="width:10%; height:10%; text-align:center;">제목</th>
            <td><c:out value="${ noticedetail.n_title }"/></td>
         </tr>
         <tr>
            <th style="width:10%; height:10%; text-align:center;">작성자</th>
            <td><c:out value="${ noticedetail.n_writer }"/></td>
         </tr>
         
         <tr>
            <th style="text-align:center;">내용</th>
            <td><c:out value="${ noticedetail.n_content }"/></td>
         </tr>  

         <tr>
            <th style="width:10%; height:10%; text-align:center;">등록일</th>
            <td>${ noticedetail.n_regDate }</td>
         </tr>
         <tr>
            <th style="width:10%; height:10%; text-align:center;">첨부파일</th>
            <td>
            <%-- <c:forEach items="${ fileList }" var="file">
               <a href="${ pageContext.request.contextPath }/upload/${ file.fileSaveName }" target="_blank"> 
               ${ file.fileOriName }
               </a>
               (${ file.fileSize } byte(s)) <br/> <!-- 파일이 여러개(0~2개) 이므로.. -->
               <img style="width:500px;"src="<%= request.getContextPath() %>/upload/${ file.fileSaveName }" />
               <br/>
            </c:forEach>           --%>  
            </td>
         </tr>
   
      </table>
      
      <br/><br/>

      <button class="btn btn-secondary" onclick="doAction('L')">목록</button>
      <br/>
      <br/>
          
   </div>
   </div>
   </div>

     <!-- /.container -->
     

		<footer> <jsp:include page="../employee_include/bottom.jsp" />
		</footer>

	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.fancybox.pack.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.fancybox-media.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/google-code-prettify/prettify.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/portfolio/jquery.quicksand.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/portfolio/setting.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.flexslider.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/animate.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/custom.js"></script>
		

  </body>

</html>