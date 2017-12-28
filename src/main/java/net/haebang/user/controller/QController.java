package net.haebang.user.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.user.bug.AnsweredData;
import net.haebang.user.bug.Question;
import net.haebang.user.service.SrvService;
import net.haebang.vo.ServiceVo;


@Controller
public class QController {
	
	
	@Autowired
	SrvService srvService;
	
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String submitQ1(Model model) {
		Question q1 = createQuestion();
		model.addAttribute("q1", q1);
		return "index";
	}
	
	
	private Question createQuestion(){
		Question q1 = new Question("가장 싫어하는 해충을 선택해주세요!", Arrays.asList("바퀴", "개미", "파리", "곰팡이", "전부 싫어요."));
		return q1;
	}
	

	
	@RequestMapping(value="/q2", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> submitQ2(HttpServletRequest request, HttpSession session) {
		String ans1 = request.getParameter("ans1");
		AnsweredData ans = new AnsweredData();
		ans.setAns1(ans1);
		session.setAttribute("ansStd", ans);
		Question q2 = new Question("현재 살고 있는 거주지는 어디입니까?", Arrays.asList("오피스텔", "다세대", "아파트", "주택"));
		HashMap<String, Object> hMap = new HashMap<>();
		hMap.put("q", q2);
		hMap.put("ans", ans);
		
		return hMap;
	}
	
	@RequestMapping(value="/q3", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> submitQ3(HttpServletRequest request, HttpSession session) {
		String ans2 = request.getParameter("ans2");
//		AnsweredData ans = new AnsweredData();
		AnsweredData ans = (AnsweredData)session.getAttribute("ansStd");
		ans.setAns2(ans2);
		session.setAttribute("ansStd", ans);
		Question q3 = new Question("카펫, 천 소파, 쿠션 등 집안에 패브릭으로 된 가구와 장난감은 몇 개입니까?", Arrays.asList("1개 이하", "3개 이하", "5개 이하", "6개 이상"));
		HashMap<String, Object> hMap = new HashMap<>();
		hMap.put("q", q3);
		hMap.put("ans", ans);
		
		return hMap;
	}
	
	@RequestMapping(value="/q4", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> submitQ4(HttpServletRequest request, HttpSession session) {
		String ans3 = request.getParameter("ans3");
//		AnsweredData ans = new AnsweredData();
		AnsweredData ans = (AnsweredData)session.getAttribute("ansStd");
		ans.setAns3(ans3);
		session.setAttribute("ansStd", ans);
		Question q4 = new Question("방충망 틈이 벌어지거나 손상된 곳이 있습니까?", Arrays.asList("없다", "1군데 이하", "3군데 이하", "4군데 이상"));
		HashMap<String, Object> hMap = new HashMap<>();
		hMap.put("q", q4);
		hMap.put("ans", ans);
		
		return hMap;
	}
	
	@RequestMapping(value="/result", method=RequestMethod.POST)
	public @ResponseBody AnsweredData submitResult(HttpServletRequest request, HttpSession session) {
		String ans4 = request.getParameter("ans4");
		AnsweredData ans = (AnsweredData)session.getAttribute("ansStd");
		ans.setAns4(ans4);
		System.out.println(ans.toString());
		return ans;
	}
	
	@RequestMapping(value="/abc", method=RequestMethod.POST)
	public @ResponseBody List<ServiceVo> collect
						(@RequestParam(value = "selecttype", defaultValue = "null", required = false) String type,
						@RequestParam(value = "selectinsect", defaultValue = "null", required = false) String[] insect,
						@RequestParam(value = "selectplace", defaultValue = "null", required = false) String place,
						@RequestParam(value = "selectsize", defaultValue = "null", required = false) int size,
				HttpSession session) {
		
	
		if(type.equals("H")) {//해방일때
						
			if(place.equals("K")) {//가정일때
							
				if(size==31) {//40-50평대 더미 50평대로 넣기
					
					size = 41;			
					
				}else if(size > 50 && size <= 100) {//50평대이상 100평대이하 더미넣기
					
					size=91;
										
				}else if(size > 100){//100평이상-따로전화
					size=101;
					
				}
				
				
			}else {//영업장일때

				if(size==1) {
					size= 11;
					
				}else if(size > 50) {//50평이상-따로전화
					size=51;
					
				}
				
			}
			
					
		}else {//소독일때 (S)
			
			place="A";
			
			if(size < 50) {
				size=41;
				
			}else if(size <= 70) {
				size=61;
				
			}else if(size <=100) {
				size=91;
				
			}else if(size <= 200) {
				size=191;
				
			}else if(size <= 500) {
				size=491;
				
			}else if(size > 500){//500이상 사이즈
				size=501;
			}
				
			
		}
		
		List<ServiceVo> result = srvService.selectList(type, place, size);

		ListIterator<ServiceVo> itr = result.listIterator();
		if(!itr.hasNext())
			System.out.println("has no element..");
		else {
			while(itr.hasNext()) {
				System.out.println(itr.next().toString());
			}
		}
		
		for(int i = 0; i< insect.length; i++) {
			System.out.println(insect[i]);
		}
		
		
		session.setAttribute("bugs", insect);
		session.setAttribute("srvDisplay", result);
		return result;
	}
	
	@RequestMapping(value="/bcd", method=RequestMethod.POST)
	public @ResponseBody List<ServiceVo> serviceDisplay(HttpSession session){
		System.out.println("/bcd 입성");
		List<ServiceVo> list = (List<ServiceVo>)session.getAttribute("srvDisplay");
		
		System.out.println(list);
		return list;
	}
	
	@RequestMapping(value = "/member/orderAddSchedule", method = RequestMethod.POST)
	public ModelAndView addschedule(
			@RequestParam("name") String name, 
			@RequestParam("postcode") String postcode,
			@RequestParam("address") String address, 
			@RequestParam("detailAddress") String detailAddress,
			@RequestParam("phone1") String phone1, 
			@RequestParam("phone2") String phone2,
			@RequestParam("phone3") String phone3, 
			@RequestParam(value = "service1") String service,
			@RequestParam(value = "date1") String date1,
			@RequestParam(value = "startTimeHour1") String startTimeHour1,
			@RequestParam(value = "startTimeMinute1") String startTimeMinute1,
			@RequestParam(value = "comments", defaultValue = "null", required = false) String comment,
			@RequestParam(value = "lon", defaultValue = "null", required = false) String m_lon,
			@RequestParam(value = "lat", defaultValue = "null", required = false) String m_lat, 
			@RequestParam(value = "m_gu", defaultValue = "null", required = false) String m_gu, 
			@RequestParam(value = "card-company-list", defaultValue = "null", required = false) String cardCompany, 
			@RequestParam(value = "cardNo1", defaultValue = "null", required = false) String cardNo1, 
			@RequestParam(value = "cardNo2", defaultValue = "null", required = false) String cardNo2, 
			@RequestParam(value = "cardNo3", defaultValue = "null", required = false) String cardNo3, 
			@RequestParam(value = "cardNo4", defaultValue = "null", required = false) String cardNo4, 
			@RequestParam(value = "card-holder", defaultValue = "null", required = false) String cardHolder, 
			@RequestParam(value = "card-expiration-month", defaultValue = "null", required = false) String expMonth, 
			@RequestParam(value = "card-expiration-year", defaultValue = "null", required = false) String expYear, 
			@RequestParam(value = "cardCVC", defaultValue = "null", required = false) String cardCVC,
			ModelAndView mav,
			HttpServletRequest request, HttpSession session) {
		
		
		
		System.out.println(m_lon);
		System.out.println(m_lat);
		System.out.println(m_gu);

		String[] insect= (String[]) session.getAttribute("bugs");

		String fullAddress = address + detailAddress;
		String phone = phone1 + phone2 + phone3;
		String cardNo=cardNo1+cardNo2+cardNo3+cardNo4;
		String cardExp=expMonth+expYear;
		String comments = "고객기피해충 :"+Arrays.toString(insect) +"\n고객메모 :"+ comment;
		
		int s_no = Integer.parseInt(service);
		
		ServiceVo selectedService = srvService.getServiceInfo(s_no);
		int cycle = selectedService.getS_freqCycle();
		int totalCnt = selectedService.getS_total();
		String freqType = selectedService.getS_freqType();

		
		
		 ////////////////////////////////창대 수정/////////////////////////////////////////////////
	      String years = date1.substring(0, 4);
	      String months = date1.substring(5, 7);
	      String days = date1.substring(8, 10);
	      String dateForNoOneEmployee = years+months+days;
	      String dateHourForNoOneEmployee = dateForNoOneEmployee+startTimeHour1;
	      String dateHourMinuteForNoOneEmployee = date1 + " " + startTimeHour1 + ":" + startTimeMinute1 + ":00";
	      System.out.println(dateForNoOneEmployee);
	      System.out.println(dateHourForNoOneEmployee);
	      System.out.println(dateHourMinuteForNoOneEmployee);
	      System.out.println("창대검사중");
	      /////////////////////////////////////////////////////////////////////////////////
		
		
		
		
		
		
		if (selectedService.getS_freqType().equals("I") || selectedService.getS_freqType().equals("i")) {
	
			Calendar cal = Calendar.getInstance();
			int a = Integer.parseInt(startTimeHour1);
			int b = Integer.parseInt(startTimeMinute1);
			cal.set(Calendar.HOUR_OF_DAY, a);
			cal.set(Calendar.MINUTE, b+selectedService.getS_duration());

			int hour = cal.get(Calendar.HOUR);
			int hourLength = (int)(Math.log10(hour)+1);
			String endTimeHour1 = "";
			
			if(hourLength<2) {
				
				endTimeHour1 = "0"+String.valueOf(hour);
				
			}else {
				
				endTimeHour1 = String.valueOf(hour);
				
			}
			
			String endTimeMinute1 = String.valueOf(cal.get(Calendar.MINUTE));
			
			String startTime1 = date1 + "T" + startTimeHour1 + ":" + startTimeMinute1 + ":00.000";
			String endTime1 = date1 + "T" + endTimeHour1 + ":" + endTimeMinute1 + ":00.000";			
			
			System.out.println(endTime1);
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			
			 //////////////////////////////////창대 수정//////////////////////////////////////////
	         paramMap.put("dateForNoOneEmployee", dateForNoOneEmployee);
	         paramMap.put("dateHourForNoOneEmployee", dateHourForNoOneEmployee);
	         paramMap.put("dateHourMinuteForNoOneEmployee", dateHourMinuteForNoOneEmployee);
	         //////////////////////////////////////////////////////////////////////////////////
	         
			paramMap.put("name", name);
			paramMap.put("address", fullAddress);
			paramMap.put("phone", phone);
			paramMap.put("service", s_no);
			paramMap.put("orderNo_date", date1);
			paramMap.put("orderNo_startHour", startTimeHour1);
			paramMap.put("orderNo_startMinute", startTimeMinute1);
			paramMap.put("startTime", startTime1);
			paramMap.put("endTime", endTime1);				
			paramMap.put("unit", freqType);
			paramMap.put("cnt", 1);
			paramMap.put("cycle", cycle);
			paramMap.put("total", totalCnt);
			paramMap.put("comments", comments);
			paramMap.put("lon", m_lon);
			paramMap.put("lat", m_lat);
			paramMap.put("gu", m_gu);
			paramMap.put("cardCo", cardCompany);
			paramMap.put("cardNo", cardNo);
			paramMap.put("cardHolder", cardHolder);
			paramMap.put("cardExp", cardExp);
			paramMap.put("cardCVC", cardCVC);

			srvService.insertScheduleByOnetime(paramMap);

		}

		else { //정기성

			
			Calendar cal = Calendar.getInstance();
			int a = Integer.parseInt(startTimeHour1);
			int b = Integer.parseInt(startTimeMinute1);
			cal.set(Calendar.HOUR_OF_DAY, a);
			cal.set(Calendar.MINUTE, b+selectedService.getS_duration());

			int hour = cal.get(Calendar.HOUR);
			int hourLength = (int)(Math.log10(hour)+1);
			String endTimeHour1 = "";
			
			if(hourLength<2) {
				
				endTimeHour1 = "0"+String.valueOf(hour);
				
			}else {
				
				endTimeHour1 = String.valueOf(hour);
				
			}
			
			String endTimeMinute1 = String.valueOf(cal.get(Calendar.MINUTE));
			
			String startTime1 = date1 + "T" + startTimeHour1 + ":" + startTimeMinute1 + ":00.000";
			String endTime1 = date1 + "T" + endTimeHour1 + ":" + endTimeMinute1 + ":00.000";			
			
			System.out.println(endTime1);
			
			
	
			Map<String, Object> paramMap = new HashMap<String, Object>();
			
			 //////////////////////////////////창대 수정//////////////////////////////////////////
	         paramMap.put("dateForNoOneEmployee", dateForNoOneEmployee);
	         paramMap.put("dateHourForNoOneEmployee", dateHourForNoOneEmployee);
	         paramMap.put("dateHourMinuteForNoOneEmployee", dateHourMinuteForNoOneEmployee);
	         //////////////////////////////////////////////////////////////////////////////////
	         
			paramMap.put("name", name);
			paramMap.put("address", fullAddress);
			paramMap.put("phone", phone);
			paramMap.put("service", s_no);			
			paramMap.put("comments", comments);
			paramMap.put("cycle", cycle);
			paramMap.put("total", totalCnt);
			paramMap.put("orderNo_date", date1);
			paramMap.put("orderNo_startHour", startTimeHour1);
			paramMap.put("orderNo_startMinute", startTimeMinute1);
			paramMap.put("lon", m_lon);
			paramMap.put("lat", m_lat);
			paramMap.put("gu", m_gu);
			paramMap.put("cardCo", cardCompany);
			paramMap.put("cardNo", cardNo);
			paramMap.put("cardHolder", cardHolder);
			paramMap.put("cardExp", cardExp);
			paramMap.put("cardCVC", cardCVC);


			Map<String, Object> scheduleMap;
			List<Map<String, Object>> scheduleList = new ArrayList<Map<String, Object>>();

			String year = date1.substring(0, 4);
			String month = date1.substring(5, 7);
			String day = date1.substring(8, 10);

			Calendar c = Calendar.getInstance();
			c.set(Calendar.YEAR, Integer.parseInt(year));
			c.set(Calendar.MONTH, Integer.parseInt(month) - 1);
			c.set(Calendar.DATE, Integer.parseInt(day));


			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (selectedService.getS_freqType().equals("W") || selectedService.getS_freqType().equals("w")) {

				paramMap.put("unit", freqType);

				for (int i = 0; i < totalCnt; i++) {

					if (i == 0) {
						System.out.println(i);

						scheduleMap = new HashMap<String, Object>();

						scheduleMap.put("cnt", i + 1);
						scheduleMap.put("startTime", startTime1);
						scheduleMap.put("endTime", endTime1);

						scheduleList.add(scheduleMap);
						System.out.println("1일때:" + scheduleList);

					} else {
						
						System.out.println(i);
						scheduleMap = new HashMap<String, Object>();
						scheduleMap.put("cnt", i + 1);
						c.add(Calendar.DATE, cycle * 7);

						String startTimeCycle = sdf.format(c.getTime()) + "T" + startTimeHour1 + ":" + startTimeMinute1
								+ ":000";
						String endTimeCycle = sdf.format(c.getTime()) + "T" + endTimeHour1 + ":" + endTimeMinute1
								+ ":000";

						scheduleMap.put("startTime", startTimeCycle);
						scheduleMap.put("endTime", endTimeCycle);

						scheduleList.add(scheduleMap);
						System.out.println(scheduleList);

					}

				}


				paramMap.put("scheduleList", scheduleList);

				Set<String> keys = paramMap.keySet();
				for (String key : keys) {
					System.out.println(key + " : " + paramMap.get(key));
				}

			}

			if (selectedService.getS_freqType().equals("M") || selectedService.getS_freqType().equals("m")) {
			

				paramMap.put("unit", freqType);

				for (int i = 0; i < totalCnt; i++) {

					if (i == 0) {
						System.out.println(i);

						scheduleMap = new HashMap<String, Object>();

						scheduleMap.put("cnt", i + 1);
						scheduleMap.put("startTime", startTime1);
						scheduleMap.put("endTime", endTime1);

						scheduleList.add(scheduleMap);
						System.out.println("1일때:" + scheduleList);

					} else {
						System.out.println(i);
						scheduleMap = new HashMap<String, Object>();
						scheduleMap.put("cnt", i + 1);
						c.add(Calendar.MONTH, cycle);

						String startTimeCycle = sdf.format(c.getTime()) + "T" + startTimeHour1 + ":" + startTimeMinute1
								+ ":000";
						String endTimeCycle = sdf.format(c.getTime()) + "T" + endTimeHour1 + ":" + endTimeMinute1
								+ ":000";

						scheduleMap.put("startTime", startTimeCycle);
						scheduleMap.put("endTime", endTimeCycle);

						scheduleList.add(scheduleMap);
						System.out.println(scheduleList);

					}

				}


				paramMap.put("scheduleList", scheduleList);

				Set<String> keys = paramMap.keySet();
				for (String key : keys) {
					System.out.println(key + " : " + paramMap.get(key));
				}

			}

			srvService.insertSchedule(paramMap);
			System.out.println(paramMap);
		}

		mav.setViewName("index");

		return mav;
	}

}
