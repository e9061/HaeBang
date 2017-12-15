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
import net.haebang.user.service.SrvServiceImpl;
import net.haebang.vo.ServiceVo;


@Controller
public class QController {
	
	
	@Autowired
	SrvServiceImpl srvService;
	
	
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
	public @ResponseBody List<ServiceVo> collect(HttpServletRequest request, HttpSession session) {
		
		String ans1 = request.getParameter("ans1");
		String[] ans2 = request.getParameterValues("ans2"); 
		String ans3 = request.getParameter("ans3");
		String ans5 = request.getParameter("ans5");
		System.out.println(ans1+ans2.toString()+ans3+ans5);
		List<ServiceVo> result = srvService.selectList(ans1, ans3, ans5);
		ListIterator<ServiceVo> itr = result.listIterator();
		if(!itr.hasNext())
			System.out.println("has no element..");
		else {
			while(itr.hasNext()) {
				System.out.println(itr.next().toString());
			}
		}
		session.setAttribute("bugs", ans2);
		session.setAttribute("srvDisplay", result);
		return result;
	}
	
	@RequestMapping(value="/bcd", method=RequestMethod.POST)
	public @ResponseBody List<ServiceVo> serviceDisplay(HttpSession session){
		List<ServiceVo> list = (List<ServiceVo>)session.getAttribute("srvDisplay");
		
		return list;
	}
	
	@RequestMapping(value = "/member/addSchedule", method = RequestMethod.POST)
	public ModelAndView addschedule(@RequestParam("name") String name, 
			@RequestParam("postcode") String postcode,
			@RequestParam("address") String address, @RequestParam("detailAddress") String detailAddress,
			@RequestParam("phone1") String phone1, @RequestParam("phone2") String phone2,
			@RequestParam("phone3") String phone3, @RequestParam("service1") String service,
			@RequestParam("period-type") String periodType,
			@RequestParam(value = "date1", defaultValue = "null", required = false) String date1,
			@RequestParam(value = "startTimeHour1", defaultValue = "null", required = false) String startTimeHour1,
			@RequestParam(value = "startTimeMinute1", defaultValue = "null", required = false) String startTimeMinute1,
			@RequestParam(value = "endTimeHour1", defaultValue = "null", required = false) String endTimeHour1,
			@RequestParam(value = "endTimeMinute1", defaultValue = "null", required = false) String endTimeMinute1,
			@RequestParam(value = "unit", defaultValue = "null", required = false) String unit,
			@RequestParam(value = "cycle", defaultValue = "null", required = false) String cycle1,
			@RequestParam(value = "totalCnt", defaultValue = "null", required = false) String totalCnt1,
			@RequestParam(value = "date2", defaultValue = "null", required = false) String date2,
			@RequestParam(value = "startTimeHour2", defaultValue = "null", required = false) String startTimeHour2,
			@RequestParam(value = "startTimeMinute2", defaultValue = "null", required = false) String startTimeMinute2,
			@RequestParam(value = "endTimeHour2", defaultValue = "null", required = false) String endTimeHour2,
			@RequestParam(value = "endTimeMinute2", defaultValue = "null", required = false) String endTimeMinute2,
			@RequestParam(value = "comments", defaultValue = "null", required = false) String comments,
			@RequestParam(value = "lon", defaultValue = "null", required = false) String lon,
			@RequestParam(value = "lat", defaultValue = "null", required = false) String lat, ModelAndView mav,
			HttpServletRequest request, HttpSession session) {

		// EmployeeVo userVo = (EmployeeVo)session.getAttribute("userVo");
		// System.out.println(userVo);
		// System.out.println(userVo.getE_no());
		String fullAddress = address + detailAddress;
		String phone = phone1 + phone2 + phone3;

		System.out.println(name+"뭐냐");
		System.out.println("dd");
		System.out.println(address);
		System.out.println(detailAddress);
		System.out.println(phone1);
		System.out.println(phone2);
		System.out.println(phone3);
		System.out.println(service);
		System.out.println(periodType);
		System.out.println(date1);
		System.out.println(startTimeHour1);
		System.out.println(startTimeMinute1);
		System.out.println(endTimeHour1);
		System.out.println(endTimeMinute1);
		System.out.println(unit);
		System.out.println(cycle1);
		System.out.println(totalCnt1);
		System.out.println(date2);
		System.out.println(startTimeHour2);
		System.out.println(startTimeMinute2);
		System.out.println(endTimeHour2);
		System.out.println(endTimeMinute2);
		System.out.println(comments);
		System.out.println(lon);
		System.out.println(lat);

		if (periodType.equals("onetime")) {

			System.out.println("***********************컨트롤러:1회성*******************************");
			String startTime1 = date1 + "T" + startTimeHour1 + ":" + startTimeMinute1 + ":00.000";
			String endTime1 = date1 + "T" + endTimeHour1 + ":" + endTimeMinute1 + ":00.000";
			String orderNo = mkOrderNo("N", date1, startTimeHour1, startTimeMinute1, phone3);

			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("name", name);
			paramMap.put("address", fullAddress);
			paramMap.put("phone", phone);
			paramMap.put("service", service);
			paramMap.put("startTime", startTime1);
			paramMap.put("endTime", endTime1);
			// paramMap.put("e_no", 90);
			paramMap.put("type", "N");
			paramMap.put("orderNo", orderNo);
			paramMap.put("unit", "i");
			paramMap.put("cnt", 1);
			paramMap.put("comments", comments);
			paramMap.put("lon", lon);
			paramMap.put("lat", lat);

			System.out.println("************************컨트롤러:1회성 paramMap잘들어감******************************");

			srvService.insertScheduleByOnetime(paramMap);

		}

		if (periodType.equals("regular")) {

			System.out.println("***********************컨트롤러:정기성*******************************");
			String startTime2 = date2 + "T" + startTimeHour2 + ":" + startTimeMinute2 + ":00.000";
			String endTime2 = date2 + "T" + endTimeHour2 + ":" + endTimeMinute2 + ":00.000";
			String orderNo = mkOrderNo("N", date2, startTimeHour2, startTimeMinute2, phone3);

			int cycle = Integer.parseInt(cycle1);
			int totalCnt = Integer.parseInt(totalCnt1);

			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("name", name);
			paramMap.put("address", fullAddress);
			paramMap.put("phone", phone);
			paramMap.put("service", service);
			paramMap.put("type", "N");
			paramMap.put("orderNo", orderNo);
			paramMap.put("comments", comments);
			paramMap.put("cycle", cycle);
			paramMap.put("total", totalCnt);
			paramMap.put("lon", lon);
			paramMap.put("lat", lat);

			System.out.println("***********************컨트롤러:정기성 ParamMap잘들어감*******************************");

			Map<String, Object> scheduleMap;
			List<Map<String, Object>> scheduleList = new ArrayList<Map<String, Object>>();

			String year = date2.substring(0, 4);
			String month = date2.substring(5, 7);
			String day = date2.substring(8, 10);

			Calendar c = Calendar.getInstance();
			c.set(Calendar.YEAR, Integer.parseInt(year));
			c.set(Calendar.MONTH, Integer.parseInt(month) - 1);
			c.set(Calendar.DATE, Integer.parseInt(day));

			System.out.println("***********************컨트롤러:정기성 캘린더에 년/월/일쪼개서 넣음완료*******************************");

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (unit.equals("week")) {

				paramMap.put("unit", "W");

				for (int i = 0; i < totalCnt; i++) {

					if (i == 0) {
						System.out.println(i);

						scheduleMap = new HashMap<String, Object>();

						scheduleMap.put("cnt", i + 1);
						scheduleMap.put("startTime", startTime2);
						scheduleMap.put("endTime", endTime2);

						scheduleList.add(scheduleMap);
						System.out.println("1일때:" + scheduleList);

					} else {
						System.out.println(i);
						scheduleMap = new HashMap<String, Object>();
						scheduleMap.put("cnt", i + 1);
						c.add(Calendar.DATE, cycle * 7);

						String startTimeCycle = sdf.format(c.getTime()) + "T" + startTimeHour2 + ":" + startTimeMinute2
								+ ":000";
						String endTimeCycle = sdf.format(c.getTime()) + "T" + endTimeHour2 + ":" + endTimeMinute2
								+ ":000";

						scheduleMap.put("startTime", startTimeCycle);
						scheduleMap.put("endTime", endTimeCycle);

						scheduleList.add(scheduleMap);
						System.out.println(scheduleList);

					}

				}

				System.out.println("***********************컨트롤러:정기성 week for문잘들어감*******************************");

				paramMap.put("scheduleList", scheduleList);

				Set<String> keys = paramMap.keySet();
				for (String key : keys) {
					System.out.println(key + " : " + paramMap.get(key));
				}

			}

			if (unit.equals("month")) {

				paramMap.put("unit", "M");

				for (int i = 0; i < totalCnt; i++) {

					if (i == 0) {
						System.out.println(i);

						scheduleMap = new HashMap<String, Object>();

						scheduleMap.put("cnt", i + 1);
						scheduleMap.put("startTime", startTime2);
						scheduleMap.put("endTime", endTime2);

						scheduleList.add(scheduleMap);
						System.out.println("1일때:" + scheduleList);

					} else {
						System.out.println(i);
						scheduleMap = new HashMap<String, Object>();
						scheduleMap.put("cnt", i + 1);
						c.add(Calendar.MONTH, cycle);

						String startTimeCycle = sdf.format(c.getTime()) + "T" + startTimeHour2 + ":" + startTimeMinute2
								+ ":000";
						String endTimeCycle = sdf.format(c.getTime()) + "T" + endTimeHour2 + ":" + endTimeMinute2
								+ ":000";

						scheduleMap.put("startTime", startTimeCycle);
						scheduleMap.put("endTime", endTimeCycle);

						scheduleList.add(scheduleMap);
						System.out.println(scheduleList);

					}

				}

				System.out.println("***********************컨트롤러:정기성 month for문잘들어감*******************************");

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

	public String mkOrderNo(String orderType, String orderDate, String orderStartHour, String orderStartMinute,
			String orderPhone3) {

		String year = orderDate.substring(0, 4);
		String month = orderDate.substring(5, 7);
		String day = orderDate.substring(8, 10);

		orderDate = year + month + day;

		String orderNo = orderType + orderDate + orderStartHour + orderStartMinute + orderPhone3;
		return orderNo;
	}


}
