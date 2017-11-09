<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin`s HaeBang - memeberManagement </title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

$(document).ready(function() {
			  var httpRequest;
			  document.getElementById("ajaxButton").onclick = function() { makeRequest('test.html'); };
		
			  function makeRequest(url) {
			    if (window.XMLHttpRequest) {
			      httpRequest = new XMLHttpRequest();
			    } else if (window.ActiveXObject) {
			      try {
			        httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
			      } 
			      catch (e) {
			        try {
			          httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			        } 
			        catch (e) {}
			      }
			    }
		
			    if (!httpRequest) {
			      alert('Giving up :( Cannot create an XMLHTTP instance');
			      return false;
			    }
			    httpRequest.onreadystatechange = alertContents;
			    httpRequest.open('GET', url);
			    httpRequest.send();
			  }
		
			  function alertContents() {
			    if (httpRequest.readyState === 4) {
			      if (httpRequest.status === 200) {
			        alert(httpRequest.responseText);
			      } else {
			        alert('There was a problem with the request.');
			      }
			    }
			  }
			})();
		)	      
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/view/admin_include/topmenu.jsp"/>
	</header>

	<section>
	<h1> 회원 관리 페이지 </h1>
	
	<input type="button" value="해방회원" onclick="makeRequest(url)">
	
	<p>
	<table style="border:1px; margin:auto; text-align:center;">
		<tr> 
			<td> 회원 번호 <td> 
			<td> 아이디 <td>
			<td> 전화번호 <td>
			<td> 이름 <td>
			<td> 주소 <td>
			<td> 가입날짜 <td>
		</tr>
		<tr> 
			<td> <input name="no" id="no" > <td> 
			<td> <input name="id" id="id"> <td>
			<td> <input name="phone" id="phone"> <td>
			<td> <input name="name" id="name"> <td>
			<td> <input name="address" id="address"> <td>
			<td> <input name="regDate" id="regDate"> <td>
		</tr>
		<tr> 
			<td> <input name="no" id="no"> <td> 
			<td> <input name="id" id="id"> <td>
			<td> <input name="phone" id="phone"> <td>
			<td> <input name="name" id="name"> <td>
			<td> <input name="address" id="address"> <td>
			<td> <input name="regDate" id="regDate"> <td>
		</tr>
		<tr> 
			<td> <input name="no" id="no"> <td> 
			<td> <input name="id" id="id"> <td>
			<td> <input name="phone" id="phone"> <td>
			<td> <input name="name" id="name"> <td>
			<td> <input name="address" id="address"> <td>
			<td> <input name="regDate" id="regDate"> <td>
		</tr>
		<tr> 
			<td> <input name="no" id="no"> <td> 
			<td> <input name="id" id="id"> <td>
			<td> <input name="phone" id="phone"> <td>
			<td> <input name="name" id="name"> <td>
			<td> <input name="address" id="address"> <td>
			<td> <input name="regDate" id="regDate"> <td>
		</tr>
		<tr> 
			<td> <input name="no" id="no"> <td> 
			<td> <input name="id" id="id"> <td>
			<td> <input name="phone" id="phone"> <td>
			<td> <input name="name" id="name"> <td>
			<td> <input name="address" id="address"> <td>
			<td> <input name="regDate" id="regDate"> <td>
		</tr>
		<tr> 
			<td> <input name="no" id="no"> <td> 
			<td> <input name="id" id="id"> <td>
			<td> <input name="phone" id="phone"> <td>
			<td> <input name="name" id="name"> <td>
			<td> <input name="address" id="address"> <td>
			<td> <input name="regDate" id="regDate"> <td>
		</tr>
		<tr> 
			<td> <input name="no" id="no"> <td> 
			<td> <input name="id" id="id"> <td>
			<td> <input name="phone" id="phone"> <td>
			<td> <input name="name" id="name"> <td>
			<td> <input name="address" id="address"> <td>
			<td> <input name="regDate" id="regDate"> <td>
		</tr>
		<tr> 
			<td> <input name="no" id="no"> <td> 
			<td> <input name="id" id="id"> <td>
			<td> <input name="phone" id="phone"> <td>
			<td> <input name="name" id="name"> <td>
			<td> <input name="address" id="address"> <td>
			<td> <input name="regDate" id="regDate"> <td>
		</tr>
		<tr> 
			<td> <input name="no" id="no"> <td> 
			<td> <input name="id" id="id"> <td>
			<td> <input name="phone" id="phone"> <td>
			<td> <input name="name" id="name"> <td>
			<td> <input name="address" id="address"> <td>
			<td> <input name="regDate" id="regDate"> <td>
		</tr>
		<tr> 
			<td> <input name="no" id="no"> <td> 
			<td> <input name="id" id="id"> <td>
			<td> <input name="phone" id="phone"> <td>
			<td> <input name="name" id="name"> <td>
			<td> <input name="address" id="address"> <td>
			<td> <input name="regDate" id="regDate"> <td>
		</tr>
	</table>
		
	</p>
	
	</section>
	
	<footer>
		<jsp:include page="/WEB-INF/view/admin_include/bottom.jsp"/>
	</<footer>
</body>
</html>