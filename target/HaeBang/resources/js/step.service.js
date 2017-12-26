

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
						
						
						if($("input[name='selecttype']:checked").val() == null)
	                        $(".modal-footer").find('.js-btn-step[data-orientation=next]').attr("disabled", "disabled");
	                     
	                     $("input[name='selecttype']").on('change', function(){
	                        $(".modal-footer").find('.js-btn-step[data-orientation=next]').removeAttr("disabled");
	                     })
						
						
					},
					'3' : function(){ 
						$('.modal-footer').show();
						
						barDisplay();
						
						
						if($("input[name='selectinsect']:checked").val() == null)
	                        $(".modal-footer").find('.js-btn-step[data-orientation=next]').attr("disabled", "disabled");
	                     
	                     $("input[name='selectinsect']").on('change', function(){
	                        $(".modal-footer").find('.js-btn-step[data-orientation=next]').removeAttr("disabled");
	                     })
						
						
						
					},
					'4' : function(){ 
						$('.modal-footer').show();
					
						barDisplay();
						
						
						if($("input[name='selectplace']:checked").val() == null)
	                        $(".modal-footer").find('.js-btn-step[data-orientation=next]').attr("disabled", "disabled");
	                     
	                     $("input[name='selectplace']").on('change', function(){
	                        $(".modal-footer").find('.js-btn-step[data-orientation=next]').removeAttr("disabled");
	                     })
						
						
					},
					'5' : function(){
						$('.modal-footer').show();
						
						barDisplay();
						
						
						if($("input[name='selectsize']:checked").val() == null)
	                        $(".modal-footer").find('.js-btn-step[data-orientation=next]').attr("disabled", "disabled");
	                     
	                     $("input[name='selectsize']").on('change', function(){
	                        $(".modal-footer").find('.js-btn-step[data-orientation=next]').removeAttr("disabled");
	                     })
						
						
					},
			
					'6' : function(){
										$('.modal-footer').hide();

										barDisplay();
										
										var insects = new Array();
										$('input[name="selectinsect"]:checked').each(function() {
										   insects.push($(this).next().children().text());
										});
										
										console.log(insects);
										
										jQuery.ajaxSettings.traditional = true;

										
										$.ajax({
											url : "/abc",
											type : "POST",
											data : {
												"selecttype" : $('input[name="selecttype"]:checked').val(),												
												"selectinsect" : insects,
												"selectplace" : $('input[name="selectplace"]:checked').val(),
												"selectsize" : $('input[name="selectsize"]:checked').val()											
											},
										});
									},
					'7' : function(){
						$('.modal-footer').show();
							
						barDisplay();
					},
					
					'8' : function(){
						$('.modal-footer').show();
						
						barDisplay();
						
						$.ajax({
							url : "/bcd",
							type : "POST",
							success : srvDisplay,
						})
						
						
						
						
					},
					'9' : function(){
						$(".modal-footer").show();
						
						barDisplay();
						
					},
					'10' : function(){
						$('.modal-footer').show();
					
						barDisplay();
				
					},					
					'11' : function(){
						$('.modal-footer').hide();
					
						barDisplay();
						
						
						var type=$("input[type='radio'][name='selecttype']:checked").next().text();
						$('#final_type').text(type);
						
						var insect=[];
						$("input[type='checkbox'][name='selectinsect']:checked").each(function(index, item){
					         insect[index] = $(item).next().text();
				        });
						
						$('#final_insect').text(insect);
						
						var place=$("input[type='radio'][name='selectplace']:checked").next().text();
						$('#final_place').text(place);
						
						
						var size=$("input[type='radio'][name='selectsize']:checked").next().text();
						
						if(size=="기타"){
							
							size=$("input[type='radio'][name='selectsize']:checked").next().next().val();
							$('#final_size').text(size+"평");
							
							
						}else{
							
							$('#final_size').text(size);
							
						}
						
						
						
						
						
						
						var name=document.getElementById("name").value;
						$('#final_name').text(name);
						
						var postcode=document.getElementById("postcode").value;
						$('#final_postcode').text(postcode);
						
						var address=document.getElementById("address").value;
						$('#final_address').text(address);
						
						var detailAddress=document.getElementById("detailAddress").value;
						$('#final_detailAddress').text(detailAddress);
						
						var phone1=$("#phone1 option:selected").val();
						$('#final_phone1').text(phone1);
						
						var phone2=document.getElementById("phone2").value;
						$('#final_phone2').text(phone2);
						
						var phone3=document.getElementById("phone3").value;
						$('#final_phone3').text(phone3);
						
						
						
						var service=$("input[type='radio'][name='service1']:checked").parent().next().children().text();
						$('#final_service').text(service);
						
						var explanation=$("input[type='radio'][name='service1']:checked").parent().next().next().children().text();
						$('#final_explanation').text(explanation);
						
						var price=$("input[type='radio'][name='service1']:checked").parent().next().next().next().children().text();
						$('#final_price').text(price);
						
						var date=document.getElementById("date1").value;
						$('#final_date').text(date);
						
						var timeHour=$("#startTimeHour1 option:selected").val();
						$('#final_timeHour').text(timeHour);
						
						var timeMinute=$("#startTimeMinute1 option:selected").val();
						$('#final_timeMinute').text(timeMinute);
						
						var memo=document.getElementById("comments").value;
						$('#final_memo').text(memo);
						
						
						
						var cardCo=$("#card-company-list option:selected").text();
						$('#final_cardCo').text(cardCo);
						
						var cardNo1=document.getElementById("cardNo1").value;
						$('#final_cardNo1').text(cardNo1);
						
						var cardNo2=document.getElementById("cardNo2").value;
						$('#final_cardNo2').text(cardNo2);
						
						var cardNo3=document.getElementById("cardNo3").value;
						$('#final_cardNo3').text(cardNo3);
						
						var cardNo4=document.getElementById("cardNo4").value;
						$('#final_cardNo4').text(cardNo4);
						
						var cardName=document.getElementById("card-holder").value;
						$('#final_cardName').text(cardName);
						
						var expMonth=$("#card-expiration-month option:selected").val();
						$('#final_expMonth').text(expMonth);
						
						var expYear=$("#card-expiration-year option:selected").val();
						$('#final_expYear').text(expYear);
						
						var cvc=document.getElementById("card-ccv").value;
						$('#final_cvc').text(cvc);
						
					}
					}
			});
			
			
			


	
			
	
	
	$('#insertMOrder').submit(function(){
		
		if(!confirm("해방하시겠습니까?")){
			return false;					
		}
		
			      
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
				            	url : "/member/orderAddSchedule",
								type : "POST",
								success : function(){
									alert("해방 신청이 완료되었습니다. 상세 내역은 마이페이지에서 확인하실 수 있습니다.");
									$('#myModal').modal('toggle');
									window.location.href="/";
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
							
								if(data==""){
									alert("회원 정보가 존재하지 않습니다");	
									window.location.href="#myModal";
									
								}else{
														
													var result = JSON.parse(data);
													var phone = result.m_phone;
													var name = result.m_name;
													console.log(phone);
													var first = phone.substr(0,3);
													console.log(first);
													var second = "";
													if(phone.length == 10){
														second = phone.substr(3,3);
														console.log(second);
														third = phone.substr(6,4);
														console.log(third);
													} else {
														second = phone.substr(3,4);
														console.log(second);
														third = phone.substr(7,4);
														console.log(third);
													}
													$('input#name').val(name);
													$('select option[value="'+first+'"]').selected();
													$('#phone2').val(second);
													$('#phone3').val(third);	
													
													alert(name+"님 환영합니다");
													
													$('button[data-step="6"]').click();
													$('.modal-footer').show();
												}
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
			
			
		
});





function srvDisplay(data){
	
		var result = JSON.parse(data);
		//console.log(result);
		var reg = [];
		var any = [];
		var one = [];
		//console.log(result[0].s_style);
		result.forEach(function(item){
			if(item.s_style == "J"){
				reg.push(item);
			}else if(item.s_style == "B"){
				any.push(item);
			}else{
				one.push(item);
			}
				
		});
	
	
		console.log(reg);
		console.log(any);
		console.log(one);
		
		
		
		var output="";
		
		if(one.length!=0){
		
			
			
			
			output += "<br/><div align='center'><h3>[해방 1회성 서비스]</h3></div><br/>"
				output += "<table class='type09'><thead><tr><th style='width:5%;'></th><th style='width:30%;'>서비스</th><th>내용</th><th style='width:15%;'>총가격</th></tr></thead><tbody>"
						
				for (var i = 0; i < one.length; i++) {
					
					if(one[i].s_price==1){
						
					output += "<tr>"
			        output += "<td><input type='radio' name='service1' value='"+one[i].s_no+"' id='"+one[i].s_no+"'></td>" ;
			        output += "<td class='center'><label for='"+one[i].s_no+"'>"+one[i].s_name+"</label></td>" ;
			        output += "<td><label for='"+one[i].s_no+"'>"+one[i].s_detail+"</label></td>";                                   
			        output += "<td class='center'><label for='"+one[i].s_no+"'>"+"해방맞춤견적"+"</label></td></tr>";
						
						
						
					}else{
					
					output += "<tr>"
	                output += "<td><input type='radio' name='service1' value='"+one[i].s_no+"' id='"+one[i].s_no+"'></td>" ;
	                output += "<td class='center'><label for='"+one[i].s_no+"'>"+one[i].s_name+"</label></td>" ;
	                output += "<td><label for='"+one[i].s_no+"'>"+one[i].s_detail+"</label></td>";                                   
	                output += "<td class='center'><label for='"+one[i].s_no+"'>"+numberWithCommas(one[i].s_price)+"원"+"</label></td></tr>";                               
					
					}
	            }
			output += "</tbody></table><br/><br/>"
			}
		
		
		if(any.length!=0){
			
			output += "<br/><div align='center'><h3>[해방 보장형 서비스]</h3></div><br/>"
				output += "<table class='type09'><thead><tr><th style='width:5%;'></th><th style='width:30%;'>서비스</th><th>내용</th><th style='width:15%;'>총가격</th></tr></thead><tbody>"
							
				for (var i = 0; i < any.length; i++) {
					output += "<tr>"
	                output += "<td><input type='radio' name='service1' value='"+any[i].s_no+"' id='"+any[i].s_no+"'></td>" ;
	                output += "<td class='center'><label for='"+any[i].s_no+"'>"+any[i].s_name+"</label></td>" ;
	                output += "<td><label for='"+any[i].s_no+"'>"+any[i].s_detail+"</label></td>";                                   
	                output += "<td class='center'><label for='"+any[i].s_no+"'>"+numberWithCommas(any[i].s_price)+"원"+"</label></td></tr>";                               
	      
	            }
			output += "</tbody></table><br/><br/>"

		}		
		
		
		
		if(reg.length!=0){
			
			output += "<br/><div align='center'><h3>[해방 정기형 서비스]</h3></div><br/>"
				output += "<table class='type09'><thead><tr><th style='width:5%;'></th><th style='width:30%;'>서비스</th><th>내용</th><th style='width:15%;'>가격(회당)</th></tr></thead><tbody>"
							
				for (var i = 0; i < reg.length; i++) {
					output += "<tr>"
	                output += "<td><input type='radio' name='service1' value='"+reg[i].s_no+"' id='"+reg[i].s_no+"'></td>" ;
	                output += "<td class='center'><label for='"+reg[i].s_no+"'>"+reg[i].s_name+"</label></td>" ;
	                output += "<td><label for='"+reg[i].s_no+"'>"+reg[i].s_detail+"</label></td>";                                   
	                output += "<td class='center'><label for='"+reg[i].s_no+"'>"+numberWithCommas(reg[i].s_price)+"원"+"</label></td></tr>";                               
	      
	            }
			output += "</tbody></table>"
			output += "<div align='right'><span style='color:red;'>*정기형은 1회 무료방문 서비스가 포함됩니다.</span></div>"

		}		
			
		
		$('#recomendedService').html(output);
		
	
}


function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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




