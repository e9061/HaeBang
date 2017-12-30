<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin`s HaeBang - companyManagement </title>
<script>
function hcListGo(pageNum){
	  $.ajax({         
        url: "${ pageContext.request.contextPath }/admin/hbCompanyManage?pageNum=" + pageNum,
        type: "GET",
        success: function(data) {
        	 $("#cList").html(data); 
           $('#codeInsert').css('display','none');
        }
     });
	  
}
function nListGo(pageNum){
	  $.ajax({         
        url: "${ pageContext.request.contextPath }/admin/nCompanyManage?pageNum=" + pageNum,
        type: "GET",
        success: function(data) {
        	 $("#cList").html(data); 
           $('#codeInsert').css('display','block');
        }
     });
	  
}


   $(document).ready(function(){
		
	   $("#allCheck").change(function(){
		if(this.checked){
			$(".check").prop("checked",true);
		} else{
			$(".check").prop("checked",false);			
		}
	   });
	   
	   $("#comcom").click(function(){
		   
		   if(confirm("선택하신 업체에 코드를 부여하시겠습니까?")){
			   
			   $(this).parent().click();
		   } else {
				return false;			   
		   }
			   alert("선택하신 회사에 코드"+"${ list.c_no }${ list.c_phone }"+"를 부여하였습니다.");
		   
	   });
	   
	   
	   
	   
	   
	 
      
      
      
	  // 조건 검색 ajax
	  $("#searchBtn").click(function(){
		  if($("#searchContent").val().trim()==""){
		    	 alert("검색어를 입력해주세요.");
		    	 $("#searchContent").val("").focus();
			} else {
				
				 $.ajax({
					url:  "${ pageContext.request.contextPath }/admin/searchCompany",
					type: "POST",
					data: {
						type : $("#comType").val(),
						vo : $("#search").val(),
						content	: $("#searchContent").val()			
					},
					success: function(data){
						//getHbCompanyList(data);
						 $("#cList").html(data); 
				           $('#codeInsert').css('display','none');
					}  
				 });
				 
			}
	  });
	  
      
   });
   
   /* function confir(){
	   
	   window.onload = function(){
		   
		   var input_value = confirm("선택한 업체에 코드를 부여하시겠습니까?");
		   var input_type = typeof(input_value);
		   
		   document.body.innerHTML = input_type;
		   alert("부여하였습니다.");
		   
	   }
	   
   } */
   
  /*  function getHbCompanyList(data){
       var list = JSON.parse(data); 
       var output = "";
       
      output += " <table style='width:80%;'>";
      output +=   "<tr>";
         output +=   "<td width='5%'><h4> <strong> 업체명  </strong></h4></td>";
           output +=   "<td width='5%'><h4> <strong> 사업자명  </strong></h4></td>";
           output +=   "<td width='10%'><h4><strong> 주소  </strong></h4></td>";
           output +=   "<td width='5%'><h4> <strong> 전화번호  </strong></h4></td>";
           output +=   "<td width='5%'><h4> <strong> 사업자번호  </strong></h4></td>";
           output +=   "<td width='5%'><h4> <strong> 등록일  </strong></h4></td>";
           output +=   "<td width='5%'><h4> <strong> 업체코드  </strong></h4></td>";
           output +=   "<td width='5%'><h4> <strong> 직원 </strong></h4></td>";
           output +=   "<td width='5%'><h4> <strong> 평점  </strong></h4></td>";
   output +=   "</tr>";
      
   
    for (var i = 0; i < list.length; i++) { 
         
          output += "<tr>"
          output += "   <td>" +  list[i].c_name + "</td>" ;
       
         if(list[i].e_name == null){
               output += "   <td> - </td>";               
         }else{
               output += "   <td>" +  list[i].e_name+"</td>";               
         }
          output += "   <td>" +  list[i].c_address+"</td>";               
          output += "   <td>" +  list[i].c_phone+"</td>";               
          output += "   <td>" +  list[i].c_bizNo+"</td>";  
          
         if(list[i].c_regDate == null){
               output += "   <td>" +  list[i].c_signDate+"</td>";               
         }else{
               output += "   <td>" +  list[i].c_regDate+"</td>";               
         }
         
         if(list[i].c_code == null){
               output += "   <td> - </td>";               
         }else{
               output += "   <td>" +  list[i].c_code+"</td>";               
         }
         
         if(list[i].c_empCnt == 0){
            output += "   <td> - </td>";               
         }else{
            output += "   <td>" +  list[i].c_empCnt+"</td>";               
         }
          output += "</tr>"
          
    }
   
          output += "</table>";
           $("#cList").html(output); 
 } */

   

</script>


</head>
<body>
	<header>
		<jsp:include page="../admin_include/topmenu.jsp"/>
	</header>
	
	<section>
	<div align="center" style="padding-right: 4px;">
	<form action="${ pageContext.request.contextPath }/admin/updateCode" method=post>
		<h1> <span>업체 관리</span></h1>
		<br/>
		<br/>
      	<select id='comType' class="btn btn-theme">
      		<option value="h" selected> 해방 업체 </option>
      		<option value="n"> 일반 업체</option>
      	</select>
      	<span style="margin-right: 5px"></span>
      	<select id='search' class="btn btn-theme">
      		<option value="c_name" selected> 업체명 </option>
      		<option value="c_code"> 업체코드 </option>
      		<option value="c_address"> 주소 </option>
      		<option value="c_bizNo"> 사업자등록번호 </option>
      	</select>
      	<span style="margin-right: 10px"></span>
      	<input type="text" id="searchContent" placeholder="검색어를 입력해주세요." style="width:15%;"/>
      	<input type="button" id="searchBtn" value="조건 검색" class="btn btn-theme"/>
      	
      	<span style="margin-right: 40px;"></span>
      	<input type="button" id="hcList_btn" onclick="hcListGo(0)" value="해방업체 조회" class="btn btn-theme"/>
      	<span style="margin-right: 5px"></span>
      	<input type="button" id="cList_btn" onclick="nListGo(0)"value="일반업체 조회" class="btn btn-theme"/>
      	
		<br/>
		<br/>
		<br/>
		<br/>
		
			<div id="cList"  style="width:80%">
			</div>
			
			
			<br/>
						<div align="center" id = "codeInsert">
				<input type="submit" class="btn btn-theme" id="comcom" value="code 생성">
			</div>
			</form>
		<br/>
		<br/>
		<br/>
		<br/>
      </div>
		
		
	</section>	
	
	<footer>
		<jsp:include page="../admin_include/bottom.jsp"/>
	</footer>
	
</body>
<script>
$(document).ready(function(){
	$.ajax({         
        url: "${ pageContext.request.contextPath }/admin/hbCompanyManage?pageNum=0",
        type: "GET",
        success: function(data) {
        	   $("#cList").html(data);  
           $('#codeInsert').css('display','none');
        }
     });

	
	
})


</script>
</html>