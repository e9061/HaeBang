/**
 * 정현
 */

$(document).ready(function(){
$('#myModal').modalSteps({
		
		
		callbacks: {
					'1' : function(){ 
						$('.modal-footer').show();
						barDisplay();
					},
					'2' : function(){
						$('.modal-footer').show();
						
						barDisplay();
					},
					'3' : function(){ 
						$('.modal-footer').show();
						
						barDisplay();
					},
					'4' : function(){ 
						$('.modal-footer').show();
					
						barDisplay();
					},
					'5' : function(){
						$('.modal-footer').show();
						
						barDisplay();
					},
			
					'6' : function(){
										$('.modal-footer').hide();

										barDisplay();
										
										$.ajax({
											url : "/abc",
											type : "POST",
											data : {
												"ans1" : $('input[name="radio-1"]:checked').val(),
												"ans2" : $('input[name="check-1"]:checked').val(),
												"ans3" : $('input[name="radio-2"]:checked').val(),
												"ans5" : $('input[name="radio-4"]:checked').val(),
											},
										});
									},
					'7' : function(){
						$('.modal-footer').show();
						
						barDisplay();
					},
					'8' : function(){
						$(".modal-footer").hide();
						
						barDisplay();
						$.ajax({
							url : "/bcd",
							type : "POST",
							success : srvDisplay,
						})
					},
					'9' : function(){
						$('.modal-footer').show();
					
						barDisplay();
					},
					}
			})
	
	
	$('#insertMOrder').submit(function(){
	      
		var s = document.sform;

		if (isNull(s.name, '고객 이름을 입력해 주세요')) {
			return false;
		}

		if (isNull(s.address, '고객 주소를 입력해 주세요')) {
			return false;
		}

		if (isNull(s.detailAddress, '고객 상세주소를 입력해 주세요')) {
			return false;
		}

		if (isNull(s.phone1, '전화번호 앞자리를 선택해 주세요.')) {
			return false;
		}

		if (isNull(s.phone2, '전화번호 가운데 자리를 입력하세요.')) {
			return false;
		}

		if (s.phone2.value.length < 3) {
			alert('전화번호 가운데 자리는 최소 3자리 이상, 4자리 이하로 입력하셔야 합니다.');
			s.phone2.focus();
			return false;
		}

		if (isNull(s.phone3, '전화번호 뒷자리를 입력하세요.')) {
			return false;
		}

		if (s.phone3.value.length < 4) {
			alert('전화번호 뒷자리는 4자리로 입력하셔야 합니다.');
			s.phone3.focus();
			return false;
		}

		if (isNaN(s.phone2.value)) {
			alert("전화번호는 숫자 형식으로 입력하세요.");
			s.phone2.focus();
			return false;
		}

		if (isNaN(s.phone3.value)) {
			alert("전화번호는 숫자 형식으로 입력하세요.");
			s.phone3.focus();
			return false;
		}

		if (s.phone2.value == "0000" && s.phone3.value == "0000") {
			alert("휴대폰 정보가 올바르지 않습니다.");
			s.phone2.focus();
			return false;
		}


		var chk_radio = document.getElementsByName('period-type');
		for (var i = 0; i < chk_radio.length; i++) {

			if (chk_radio[0].checked == true) {
				
				if (isNull(s.date1, '날짜를 선택해 주세요')) {
					return false;
				}

				if (isNull(s.startTimeHour1, '서비스 시작시간을 입력해 주세요')) {
					return false;
				}

				if (isNull(s.startTimeMinute1, '서비스 시작시간(분)을 입력해 주세요')) {
					return false;
				}

				if (isNull(s.endTimeHour1, '서비스 예상 종료시간을 입력해 주세요')) {
					return false;
				}

				if (isNull(s.endTimeMinute1, '서비스 예상 종료시간(분)을 입력해 주세요')) {
					return false;
				}

			} else {

				if (isNull(s.unit, '정기 서비스 반복 단위를 선택해 주세요')) {
					return false;
				}

				if (isNull(s.cycle, '반복주기를 선택해 주세요')) {
					return false;
				}

				if (isNull(s.totalCnt, '제공하는 서비스의 총 횟수를 입력해 주세요')) {
					return false;
				}

				if (isNull(s.date2, '날짜를 선택해 주세요')) {
					return false;
				}

				if (isNull(s.startTimeHour2, '서비스 시작시간을 입력해 주세요')) {
					return false;
				}

				if (isNull(s.startTimeMinute2, '서비스 시작시간(분)을 입력해 주세요')) {
					return false;
				}

				if (isNull(s.endTimeHour2, '서비스 예상 종료시간을 입력해 주세요')) {
					return false;
				}

				if (isNull(s.endTimeMinute2, '서비스 예상 종료시간(분)을 입력해 주세요')) {
					return false;
				}

			}
		}
		
		
		
		
		
		
		
	      $(this).ajaxSubmit({
				            	url : "/member/addSchedule",
								type : "POST",
								success : function(){
									console.log('m_order 저장하러가기');
									$('button[data-step="8"]').click();
								}
	            			});
	      
	      	return false;
		  });

	
		$('#cd-form').submit(function(){
			
			if($('#signin-email').val()==""){
				alert('이메일을 입력해주십시오');
				return false;
			}
			
			if($('#signin-password').val()==""){
				alert('비밀번호를 입력해주십시오');
				return false;
			}
			
			$(this).ajaxSubmit({
						url : "/member/modalLogin",
						type : "POST",
						data : {
									"signin-email" : $('#signin-email').val(),
									"signin-password" : $('#signin-password').val()
							   },
						success : function(data){
													var result = JSON.parse(data);
													var phone = result.m_phone;
													var name = result.m_name;
													console.log(phone);
													var first = phone.substr(0,3);
													console.log(first);
													if(phone.length == 10){
														var second = phone.substr(3,3);
														console.log(second);
														var third = phone.substr(6,4);
														console.log(third);
													} else {
														second = phone.substr(3,4);
														console.log(second);
														third = phone.substr(7,4);
														console.log(third);
													}
													$('input#name').val(name);
													$('select option[value="'+first+'"]').selected();
													$('input#phone2').val(second);
													$('input#phone3').val(third);
													
													alert("success");
													
													$('button[data-step="6"]').click();
													$('.modal-footer').show();
												},	
							  });
			return false;
		});
			
			
		
			
			$('#bLogin').click(function(){
				$('button[data-step="6"]').click();
				$('.modal-footer').show();
			});
			
			$('div.modal-backdrop.fade.in').click(function(){
				console.log('is it disappeared?');
				location.reload();
			});
})

function srvDisplay(data){
	
		var result = JSON.parse(data);
		console.log(result);
		var reg = [];
		var any = [];
		console.log(result[0].s_style);
		result.forEach(function(item){
			if(item.s_style == "j")
				reg.push(item);
			else
				any.push(item);
		});
		
		console.log(reg);
		console.log(any);
		$("input[type='radio'][name='period-type']").change(function(){
			
			
			
			if(this.value == "onetime") {
				
				var output="";
				$('#type1').show();
				any.forEach(function(item){
					output += "<li class='item-list'><input type='radio'" +
					"name='service1' value='";
					output += item.s_no;
					output +="' id='";
					output += item.s_no;
					output += "'><span class='radio-body'><label for='";
					output += item.s_no;
					output += "'>";
					output += item.s_name;
					output += "</label></span></li>"
				});
				$('div#type1 div div ul').html(output);
				$('#type2').hide();
				
				
			} else if (this.value == "regular") {
				var output="";
				$('#type2').show();
				reg.forEach(function(item){
					output += "<li class='item-list'><input type='radio'" +
					"name='service1' value='";
					output += item.s_no;
					output +="' id='";
					output += item.s_no;
					output += "'><span class='radio-body'><label for='";
					output += item.s_no;
					output += "'>";
					output += item.s_name;
					output += "</label></span></li>"
				});
				$('div#type2 div div ul').html(output);
				$('#type1').hide();
			}
		});
	
}

function barDisplay(){
	var elem = document.getElementById("myBar");
	var cur = $('#myModal').find('#actual-step').val();
	var length = $('#myModal').find('div[data-step]').length;
	var curWidth = (cur-1)/length*100;
	elem.style.width = curWidth+'%';
	var myId = setInterval(barProgress, 10);
	
	function barProgress(){
		
		if(curWidth = cur/length*100){
			clearInterval(myId);
		}else{
			curWidth++;
			elem.style.width = curWidth+'%';
			
		}
		
		
	}
}