<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin`s HaeBang - memeberManagement </title>
<script>
   $(document).ready(function(){
	   
	  // 비회원 ajax
      $("#nMember_btn").click(function(){
         
          $.ajax({         
               url: "/admin/nMbList",
               type: "GET",
               success: function(data) {
                  getNonMbList(data); 
               }         
            });
      });
      
	  // 회원 ajax
      $("#member_btn").click(function(){
         
          $.ajax({         
               url: "/admin/mbList",
               type: "GET",
               success: function(data) {
                  getMbList(data); 
               }         
            });
      });
	  
	  
	  
	  // 전체 조검 검색
	  $("#search_btn").click(function(){
		if($("#search_content").val().trim()==""){
	    	 alert("검색어를 입력해주세요.");
	    	 $("#search_content").val("").focus();
		} else {
			
		  $.ajax({
				url: "/admin/mbSearched",
				type: "POST",
				data: {
					type : $("#selectType").val(),
					option : $("#selectBox").val(),
	            	content : $("#search_content").val()	
	            }, 
				success: function(data) {
					getMbList(data);
				}
		  });
		}
	  });
      
       function getNonMbList(data){
             var list = JSON.parse(data);         
             var output = "";
             
 			output += " <table style='border:1px soild red; width:80%'>";
 	            output +=	"<tr>";
 	           		output +=	"<td width='10%'><h4><strong> 번호  </strong></h4></td>";
 	           		output +=	"<td width='10%'><h4><strong> 이름   </strong></h4></td>";
 	           		output +=	"<td width='10%'><h4><strong> 업체명  </strong></h4> </td>";
 	           		output +=	"<td width='35%'><h4><strong> 주소   </strong></h4></td>";
 	           		output +=	"<td width='20%'><h4><strong> 전화번호  </strong></h4></td>";
				output +=	"</tr>";
				
             for (var i = 0; i < list.length; i++) {                            
                    output += "<tr>";
                   for (var key in list[i]) {                      
                       if(key == 'm_no'){
                    	   output += "<td width='10%'>" + list[i].m_no + "</td>" ;          
                       }else if(key == 'm_name'){
                          	output += "<td width='10%'>" + list[i].m_name + "</td>" ;
                   	   }else if(key == 'm_owner'){
	                   		if(list[i].m_owner == 'null'){
		                          output += "<td width='10%'>" + "-" + "</td>" ;
	                  	   	 }else {
	                          output += "<td width='10%'>" + list[i].m_owner + "</td>" ;
                   	  		 }
                       }else if(key == 'm_address'){                          
                         output += "<td width='35%'>" + list[i].m_address+"</td>";                                    
                       }else if(key == 'm_phone'){                          
                         output += "<td width='20%'>" + list[i].m_phone+"</td>";                                    
                       }
                   }
                    output += "</td></tr>";
                    output += "</table>";
             }
                 $("#mList").html(output); 
       }
       
       
       
 	/////////////////////////////////////////////
       
       
       
       function getMbList(data){
             var list = JSON.parse(data); 
             var output = "";
             
             
			output += " <table style='width:80%; border:1px soild red' text-align='center'>";
            output +=	"<tr>";
           		output +=	"<td width='5%'><h4> <strong> 회원 번호  </strong></h4> </td>";
         		output +=	"<td width='10%'><h4>  <strong> 아이디  </strong></h4></td>";
           		output +=	"<td width='10%'><h4>  <strong> 이름  </strong></h4></td>";
           		output +=	"<td width='20%'><h4>  <strong> 주소  </strong></h4></td>";
           		output +=	"<td width='15%'><h4>  <strong> 전화번호  </strong></h4></td>";
           		output +=	"<td width='15%'><h4>  <strong> 가입 날짜  </strong></h4></td>";
			output +=	"</tr>";
				
             for (var i = 0; i < list.length; i++) {                            
                    output += "<tr>";
                   for (var key in list[i]) {                      
                       if(key == 'm_no'){
                    	   output += "<td width='5%'>" + list[i].m_no + "</td>" ;          
                   	   }else if(key == 'm_id'){
                   		   if(list[i].m_id == 'null'){ 
                   			output += "<td width='10%'> 비회원</td>" ;
                   		   } else {
	                          output += "<td width='10%'>" + list[i].m_id + "</td>" ;
                   		   }
                       }else if(key == 'm_name'){
                          output += "<td width='10%'>" + list[i].m_name + "</td>";
                       }else if(key == 'm_phone'){                          
                         output += "<td width='15%'>" + list[i].m_phone+"</td>";                                   
                       }else if(key == 'm_address'){                          
                         output += "<td width='20%'>" + list[i].m_address+"</td>";                                    
                       }else if(key == 'm_joinDate'){                          
                         output += "<td width='15%'>" + list[i].m_joinDate+"</td>";                                    
                       }
                   }
                    output += "</tr>";
             }
                    output += "<br/>";
                    output += "<br/>";
               output += "</table>";
                    
                 $("#mList").html(output); 
       }
  
	  
	  
	  
});
   
   
   
/*    
   // 회원 조건 검색
   $("#search_btn").click(function(){
	  alert("넘어감");
           if($("#search_content").val().trim()==""){
    	  alert("검색어를 입력해주세요.");
    	  $("#search_content").val("").focus();
      }else{ 
	          $.ajax({         
	               url: "/HaeBang/admin/mbSearched",
	               type: "GET",
	               data: {
	            	   m_id : $("#search_content").val();			
	               },
	               success: function(data) {
	            	   getMbList(data); 
	               }         
	            });
      }
  }); 
	 */  

</script>

<style type="text/css">

table {
	board:1px solid red;
	height:50px;
	magin:auto;
	text-align: center;
}

</style>

</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/view/admin_include/topmenu.jsp"/>
	</header>

	<section>
		<h1> <span>회원 관리 페이지</span> </h1>
		<div>
			
	      	<input type="button" id="member_btn" value="해방회원 조회"/>
	      	<input type="button" id="nMember_btn" value="비회원 조회"/>
	      	
	      	<select id='selectType'>
				<option value='m' selected> 정회원  </option>
				<option value='b'> 비회원 </option>
				<option value='x'> 탈퇴회원 </option>
			</select>
			
			<if>
				<select id='selectBox'>
					<option value='m_id' selected> 아이디  </option>
					<option value='m_no'> 회원번호  </option>
					<option value='m_name'> 이름 </option>
					<option value='m_phone'> 전화번호 </option>
				</select>
			</if>
			
            <input type='text' id='search_content' />
            <input type='button' id='search_btn' value='조건 검색' />
            
			<br/>
			<br/>
			<br/>
			<br/>
				<table id="mList" style="width:80%">
				</table>
			<br/>
			<br/>
			<br/>
			<br/>
		</div>
		
		
		
	</section>	
	
	<footer>
		<jsp:include page="/WEB-INF/view/admin_include/bottom.jsp"/>
	</footer>
	
</body>
</html>