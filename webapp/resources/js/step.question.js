/**
 * 정현
 */

	$(document).ready(function(){
		
		
		$('.qSubmit').click(function(){	
			
				if( ($("input[name='response[1]']:checked").val() != null) && ($('#question span').text() === "가장 싫어하는 해충을 선택해주세요!")){
					
					$.ajax({
						url : "/q2",
						type : "POST",
						data : {"ans1" : $('input:radio:checked').val()},
						
						success : q2Display,
					});
				} else if( ($("input[name='response[1]']:checked").val() != null) && ($('#question span').text() === "현재 살고 있는 거주지는 어디입니까?")){
					
					$.ajax({
						url : "/q3",
						type : "POST",
						data : {"ans2" : $('input:radio:checked').val()},
						
						success : q3Display,
					});
					
				} else if( ($("input[name='response[1]']:checked").val() != null) && ($('#question span').text() === "카펫, 천 소파, 쿠션 등 집안에 패브릭으로 된 가구와 장난감은 몇 개입니까?")){
					
					$.ajax({
						url : "/q4",
						type : "POST",
						data : {"ans3" : $('input:radio:checked').val()},
						
						success : q4Display,
					});
				} else if( ($("input[name='response[1]']:checked").val() != null) && ($('#question span').text() === "방충망 틈이 벌어지거나 손상된 곳이 있습니까?")){
					
					$.ajax({
						url : "/result",
						type : "POST",
						data : {"ans4" : $('input:radio:checked').val()},
						
						success : resultDisplay,
					});
				}
				
				
		})
		
		$('#manual').on('change', function(){
			var a = $('#manual').val();
			
			$('#radio-12').val(a); 
			console.log('radiovalue'+a+'sent.');
		})
		
		

	});
	
	
	
	function q2Display(data){
		
	
		var map = JSON.parse(data);
		var output='';
		var title=map.q.title;
		
		
		var options =map.q.options;
		output += "<span id='q2'><h5>";
		output += title;
		output += "</h5></span><br/>";
		output += "<p class='q'>";
		for(var i=0; i<options.length; i++){
			output+="<input type='radio' name='response[1]' value='";
			output+=i+1;
			output+="' id='";
			output+=options[i];
			output+="'><label for='";
			output+=options[i];
			output+="'>";
			output+=i+1;
			output+="번 ";
			output+=options[i];
			output+="</label><br/>";
		}
		output += "</p>";
		$('#question').html(output);

		
	}
	
	function q3Display(data){
		
	
		var map = JSON.parse(data);
		var output='';
		var title=map.q.title;
		
		
		var options =map.q.options;
		output += "<span id='q3'><h5>";
		output += title;
		output += "</h5></span><br/>";
		output += "<p class='q'>";
		
		for(var i=0; i<options.length; i++){
			output+="<input type='radio' name='response[1]' value='";
			output+=i+1;
			output+="' id='";
			output+=options[i];
			output+="'><label for='";
			output+=options[i];
			output+="'>";
			output+=i+1;
			output+="번 ";
			output+=options[i];
			output+="</label><br/>";
		}
		output += "</p>";
		$('#question').html(output);
	}
	
	function q4Display(data){
		
	
		var map = JSON.parse(data);
		var output='';
		var title=map.q.title;
		
		
		var options =map.q.options;
		output += "<span id='q4'><h5>";
		output += title;
		output += "</h5></span><br/>";
		output += "<p class='q'>";
		
		for(var i=0; i<options.length; i++){
			output+="<input type='radio' name='response[1]' value='";
			output+=i+1;
			output+="' id='";
			output+=options[i];
			output+="'><label for='";
			output+=options[i];
			output+="'>";
			output+=i+1;
			output+="번 ";
			output+=options[i];
			output+="</label><br/>";
		}
		output += "</p>";
		$('#question').html(output);
	}
	
	function resultDisplay(data){
		
		var result = JSON.parse(data);
		var output='';
		
		output += "<span>대답하신 항목은 ";
		output += result.ans2;
		output += "번, ";
		output += result.ans3;
		output += "번, ";
		output += result.ans4;
		output += "번 입니다.<br/>";
		output += "자가진단지표와 총 점수를 비교해보세요!<br/><br/>"
		
		var title = '1번-5점, 2번-4점, 3번-3점, 4번-2점';
		
		output += title;
		
		output += "<br><span>12~10점: 집 안 청결에 어느 정도 신경을 쓰고 있는 집.</span>";
		output += "<br>";
		output += "<span>10~8점: 자칫 방심했다가는 바퀴나 개미가 생길 수 있으므로 계속해서 주의한다.</span>";
		output += "<br>";
		output += "<span>8~6점: 집 안에 개미와 바퀴가 숨어 있을 확률이 높다. 약제를 놓아두어 차단할 필요가 있다!</span>";
		output += "<br>";
		
		
		hideElement();
		$("#q4").html(output);
		$('.qSubmit').text("방역서비스를 신청하세요!");
		$('.qSubmit').attr("data-toggle", "modal");
		$('.qSubmit').attr("data-target", "#myModal")
		
	}
	
	function hideElement(){
		var dummy = document.querySelectorAll(".q");
	  
		for(var i=0; i<dummy.length; i++){
			dummy[i].classList.add('hide');
	   
		}
	}
