<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css" type="text/css" rel="stylesheet" media="all">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

function c_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = data.address; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 기본 주소가 도로명 타입일때 조합한다.
            if(data.addressType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address').value = fullAddr;
            document.getElementById('address').focus();

             
            
        }
    }).open();

}

	function changeAddr(address){
			console.log(address);
			  $.ajax({		
					url: "https://api2.sktelecom.com/tmap/geo/fullAddrGeo",
					type: "GET",
					data: {	
						version : 1,
						fullAddr : address,
						addressFlag : "F00",
						format : "json",
						appKey : "3a8e2503-7364-4259-9624-81dfdd0cb5ff"
					},
					success : function(result)
					{
						
						if(result.coordinateInfo.coordinate.length == '1')
						{
							document.getElementById('lon').value = result.coordinateInfo.coordinate[0].newLon;
							document.getElementById('lat').value = result.coordinateInfo.coordinate[0].newLat;
							document.getElementById('gu').value = result.coordinateInfo.coordinate[0].gu_gun;
						}else
						{
							document.getElementById('lon').value = result.coordinateInfo.coordinate[0].newLon;
							document.getElementById('lat').value = result.coordinateInfo.coordinate[0].newLat;
							document.getElementById('gu').value = result.coordinateInfo.coordinate[0].gu_gun;
						}
						
							opener.$('#m_address').val($('#address').val());
							opener.$('#m_lon').val($('#lon').val());
							opener.$('#m_lat').val($('#lat').val());
							opener.$('#m_gu').val($('#gu').val());
							opener.$('#m_detail').attr("placeholder","나머지 주소를 입력해 주세요.");
							
							var msg1 = "<a class='btn btn-info' id='newAddress_btn' style='width: 70px; color:white'>수정 완료</a>"
							opener.$('#newAddr').next().html(msg1);
							opener.$('#newAddr').parent().next().html("");
							window.close();
					},
					
			  });
	}
	
</script>

</head>
<body>
	 <div class="form-group">
                    <div class="col-sm-10" style="padding-top:25%;">
                        <input type="text" name ="postcode" id="postcode" class="form-control" style="width:20%; float:left" onkeyup="checkpostcode()"/>
						&nbsp;&nbsp; 
						<input type="button" class="btn btn-info1" onclick="c_execDaumPostcode()" value="우편번호 찾기">
					</div>
					<label for="new_addresssub" class="col-sm-2 control-label" style="color:white;"></label>   						
						<div class="col-sm-10">
							<input type="text" id="address" name="address" class="form-control" onkeyup="checkpostcode()"/>					
						</div>
                        <input type="hidden" id="lon"/>
                        <input type="hidden" id="lat"/>
                        <input type="hidden" id="gu"/>
       </div>
       
       			<div style="padding-left:25%">
       				<a href="javascript:changeAddr($('#address').val());" class="pull-right abc">
						<input type="button" class="btn btn-default" value="변경">
                 	</a>
                  <input type="button" class="btn btn-default"  value="닫기" onclick="window.close()">
       			</div>
       
</body>
</html>