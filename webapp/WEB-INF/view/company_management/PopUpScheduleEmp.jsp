<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">

	/* 팝업창이 켜질때 직원 NO를 받아와 해당 직원 업체의 모든 직원 list를 받아온다.  */

	$(document).ready(function(){
		$('#temp_e_no').val(opener.$('#mod_e_no').val());
		
		var e_no = $('#temp_e_no').val();
		
		$.ajax({
			type : "GET",
			url : "${ pageContext.request.contextPath }/ceo/getEmployeeList",
			data : {
				e_no : e_no
			},
			dataType: "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    	error : function(request, status, error){
	    		alert("code : "+request.status + "\r\nmessage : " + request.reponseText);	    		
	    	},
	    	success : function(data){
	    		console.log(data);
	    		console.log(data[0].e_name);
	    		
	    		var output="";
	    		
	    		for(var i=0; i<data.length; i++) {
	    		output += "		<tr class='tr1'>			";
	    			output += "	<td><input type='radio' name='checked' value='" + data[i].e_no + "&" + data[i].e_name + "&" + data[i].e_phone + "'" + "/> " + data[i].e_name + "</td>";
	    			output += "	<td>"+ data[i].e_phone +"</td>";
	    		output += "		</tr>	";
	    		}
	    		
	    		$('#mod_e_name').html(output);
				console.log($('#temp_e_no').val());
			
				/* 
				if($('#temp_e_no').val() == $("input[name=checked]").val() ){
					console.log('여기까지온다능');
					console.log($(this).val());
					$(this).attr("checked",checked);
				}
				 */
	    	}
			
		});
		
		
	});
	
	
	function changeEmp(){
		var tempInfo = $('input:radio[name=checked]:checked').val().split('&');
		var e_no = tempInfo[0];
		var e_name = tempInfo[1];
		var e_phone = tempInfo[2];
		console.log(e_no,e_name,e_phone);
		opener.$('#mod_e_no').val(e_no);
		opener.$('#mod_e_name').val(e_name);
		opener.$('#mod_e_phone').val(e_phone);
		window.close();
	}
	
</script>

<style>
table {
   border: 1px solid #000;
}
</style>

</head>
<body>
	<div class="container">
		<div align="center">
			<hr>
				<h2>
					<strong>
								직원 변경
					</strong>
				</h2>
			<hr>
		</div>
	</div>

	<div class="container" style="margin: auto;">
		<input type="hidden" id="temp_e_no">
		<table class="table">
			<thead>
				<tr>
					<th class="header" width="20%">직원 명</th>
					<th class="header" width="40%">전화번호</th>
				</tr>
			</thead>
			<tbody	id="mod_e_name">
			</tbody>
		</table>
	</div>	
	<div style="padding-left:25%">
		<input type="button" class="btn btn-default" value="변경" onclick="changeEmp()">
		<input type="button" class="btn btn-default"  value="닫기" onclick="window.close()">
	</div> 
	
</body>
</html>