package net.haebang.employee.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.employee.service.EmployeeService;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.MemberVo;
import net.haebang.vo.OrderEmployeeVo;
import net.haebang.vo.OrderMemberVo;
import net.haebang.vo.ScheduleVo;
import net.haebang.vo.ServiceVo;

@Controller
public class ScheduleController {

	@Autowired
	@Qualifier("employeeService")
	private EmployeeService employeeService;

	@RequestMapping(value="/ceo/scheduleList", method=RequestMethod.POST)
	public @ResponseBody List<ScheduleVo> calendar(HttpSession session) throws Exception{
		
		EmployeeVo userVo = (EmployeeVo)session.getAttribute("userVo");
		
		userVo.getC_no();
		
		OrderEmployeeVo oeVo = new OrderEmployeeVo();
		OrderMemberVo omVo = new OrderMemberVo();
		EmployeeVo emVo = new EmployeeVo();
		MemberVo mVo = new MemberVo();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("oeVo", oeVo);
		map.put("omVo", omVo);
		map.put("emVo", emVo);
		map.put("mVo", mVo);
		List<HashMap<String, Object>> scheduleList = new ArrayList<HashMap<String, Object>>();
		scheduleList.add(map);
		
		scheduleList = employeeService.getScheduleList(userVo.getC_no());
		
		List<ScheduleVo> scVo = new ArrayList<>();
		
		for(int i=0; i<scheduleList.size(); i++) {
			ScheduleVo sc = new ScheduleVo((int) scheduleList.get(i).get("mo_no") ,(String) scheduleList.get(i).get("e_name") + "/" + (String) scheduleList.get(i).get("m_address"), (scheduleList.get(i).get("mo_startTime")).toString(), (scheduleList.get(i).get("mo_endTime")).toString() );
			scVo.add(sc);
		}
		
		return scVo;
		
	}
	
	@RequestMapping(value="/ceo/scheduleDetail", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> scheduleDetail(HttpServletRequest request){
		int mo_no = Integer.parseInt(request.getParameter("mo_no"));
		
		OrderEmployeeVo oeVo = new OrderEmployeeVo();
		OrderMemberVo omVo = new OrderMemberVo();
		EmployeeVo emVo = new EmployeeVo();
		MemberVo mVo = new MemberVo();
		ServiceVo sVo = new ServiceVo();
		
		HashMap<String, Object> scheduleByMONo = new HashMap<String, Object>();
		
		scheduleByMONo = employeeService.getScheduleByMONo(mo_no);
			
		return scheduleByMONo;
	}
	
	
	@RequestMapping(value="/ceo/scheduleDelete")
	public void scheduleDelete(HttpServletRequest request) {
		System.out.println(request.getParameter("mo_orderNo"));
	    String mo_orderNo = request.getParameter("mo_orderNo");
	    System.out.println(mo_orderNo);
	    employeeService.deleteSchedule(mo_orderNo);
	}
	
	
	
	public String mkOrderNo(String orderType, String orderDate, String orderStartHour, String orderStartMinute, String orderPhone3) {
		
		String year = orderDate.substring(0, 4);
		String month= orderDate.substring(5, 7);
		String day = orderDate.substring(8, 10);
		
		orderDate = year+month+day;		
		
		String orderNo=orderType+orderDate+orderStartHour+orderStartMinute+orderPhone3;
		return orderNo;
	}
	
	
	
	
	@RequestMapping(value="/ceo/addSchedule", method=RequestMethod.POST)
	public ModelAndView addschedule (
			@RequestParam("name") String name,
			@RequestParam("postcode") String postcode,
			@RequestParam("address") String address,
			@RequestParam("detailAddress") String detailAddress,
			@RequestParam("phone1") String phone1,
			@RequestParam("phone2") String phone2,
			@RequestParam("phone3") String phone3,
			@RequestParam("service1") String service,			
			@RequestParam("period-type") String periodType,
			@RequestParam(value="date1", defaultValue="null", required=false) String date1,
			@RequestParam(value="startTimeHour1", defaultValue="null", required=false) String startTimeHour1,
			@RequestParam(value="startTimeMinute1", defaultValue="null", required=false) String startTimeMinute1, 
			@RequestParam(value="endTimeHour1", defaultValue="null", required=false) String endTimeHour1,
			@RequestParam(value="endTimeMinute1", defaultValue="null", required=false) String endTimeMinute1,
			@RequestParam(value="unit", defaultValue="null", required=false) String unit,
			@RequestParam(value="cycle", defaultValue="null", required=false) String cycle1,
			@RequestParam(value="totalCnt", defaultValue="null", required=false) String totalCnt1,
			@RequestParam(value="date2", defaultValue="null", required=false) String date2,
			@RequestParam(value="startTimeHour2", defaultValue="null", required=false) String startTimeHour2,
			@RequestParam(value="startTimeMinute2", defaultValue="null", required=false) String startTimeMinute2, 
			@RequestParam(value="endTimeHour2", defaultValue="null", required=false) String endTimeHour2,
			@RequestParam(value="endTimeMinute2", defaultValue="null", required=false) String endTimeMinute2,
			@RequestParam(value="comments", defaultValue="null", required=false) String comments,
			@RequestParam(value="lon", defaultValue="null", required=false) String lon,
			@RequestParam(value="lat", defaultValue="null", required=false) String lat,			
			ModelAndView mav, HttpServletRequest request, HttpSession session) {
		
		EmployeeVo userVo = (EmployeeVo)session.getAttribute("userVo");
		System.out.println(userVo);
		System.out.println(userVo.getE_no());
		String fullAddress = address+detailAddress;
		String phone = phone1+phone2+phone3;
		
		System.out.println(name);
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
		
		
		
			if(periodType.equals("onetime")) {
			
				System.out.println("***********************컨트롤러:1회성*******************************");
				String startTime1 = date1+"T"+startTimeHour1+":"+startTimeMinute1+":00.000";
				String endTime1 = date1+"T"+endTimeHour1+":"+endTimeMinute1+":00.000";
				String orderNo = mkOrderNo("N", date1, startTimeHour1, startTimeMinute1, phone3);
				
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("name", name);
				paramMap.put("address", fullAddress);
				paramMap.put("phone", phone);
				paramMap.put("service", service);
				paramMap.put("startTime", startTime1);
				paramMap.put("endTime", endTime1);
				paramMap.put("e_no", userVo.getE_no());
				paramMap.put("type", "N");
				paramMap.put("orderNo", orderNo);
				paramMap.put("unit", "i");							
				paramMap.put("cnt", 1);				
				paramMap.put("comments", comments);		
				paramMap.put("lon", lon);
				paramMap.put("lat", lat);
				
				System.out.println("************************컨트롤러:1회성 paramMap잘들어감******************************");
				
				employeeService.insertScheduleByOnetime(paramMap);
				
			}
		
		
			if(periodType.equals("regular")) {

				System.out.println("***********************컨트롤러:정기성*******************************");
				String startTime2 = date2+"T"+startTimeHour2+":"+startTimeMinute2+":00.000";
				String endTime2 = date2+"T"+endTimeHour2+":"+endTimeMinute2+":00.000";
				String orderNo = mkOrderNo("N", date2, startTimeHour2, startTimeMinute2, phone3);
						
				int cycle = Integer.parseInt(cycle1);
				int totalCnt = Integer.parseInt(totalCnt1);
				
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("name", name);
				paramMap.put("address", fullAddress);
				paramMap.put("phone", phone);
				paramMap.put("service", service);				
				paramMap.put("e_no", userVo.getE_no());
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
				String month= date2.substring(5, 7);
				String day = date2.substring(8, 10);
						
			
				Calendar c = Calendar.getInstance();
				c.set(Calendar.YEAR, Integer.parseInt(year));
				c.set(Calendar.MONTH, Integer.parseInt(month)-1);
				c.set(Calendar.DATE, Integer.parseInt(day));				
				
							
				System.out.println("***********************컨트롤러:정기성 캘린더에 년/월/일쪼개서 넣음완료*******************************");
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
				if(unit.equals("week")) {						
					
					paramMap.put("unit", "W");			
					
					for(int i=0; i<totalCnt; i++) {	
						
						if(i==0) {
							System.out.println(i);
							
							scheduleMap =  new HashMap<String, Object>();
							
							scheduleMap.put("cnt", i+1);
							scheduleMap.put("startTime", startTime2);
							scheduleMap.put("endTime", endTime2);
												
							scheduleList.add(scheduleMap);	
							System.out.println("1일때:"+scheduleList);
							
							
						}else {
							System.out.println(i);
							scheduleMap =  new HashMap<String, Object>();
							scheduleMap.put("cnt", i+1);
							c.add(Calendar.DATE, cycle*7);
						
							
							String startTimeCycle = sdf.format(c.getTime())+"T"+startTimeHour2+":"+startTimeMinute2+":000";
							String endTimeCycle = sdf.format(c.getTime())+"T"+endTimeHour2+":"+endTimeMinute2+":000";

							
							scheduleMap.put("startTime", startTimeCycle);
							scheduleMap.put("endTime", endTimeCycle);	
						
								
							scheduleList.add(scheduleMap);
							System.out.println(scheduleList);
							
						}
					
										
					}					
					
					System.out.println("***********************컨트롤러:정기성 week for문잘들어감*******************************");
				
					paramMap.put("scheduleList", scheduleList);
				
					Set<String> keys = paramMap.keySet();
					for(String key : keys) {
						System.out.println(key + " : "+ paramMap.get(key));				
					}
					
				
				}
			
				if(unit.equals("month")) {
				
					paramMap.put("unit", "M");	
				
					for(int i=0; i<totalCnt; i++) {	
						
						if(i==0) {
							System.out.println(i);
							
							scheduleMap =  new HashMap<String, Object>();
							
							scheduleMap.put("cnt", i+1);
							scheduleMap.put("startTime", startTime2);
							scheduleMap.put("endTime", endTime2);
												
							scheduleList.add(scheduleMap);	
							System.out.println("1일때:"+scheduleList);
							
							
						}else {
							System.out.println(i);
							scheduleMap =  new HashMap<String, Object>();
							scheduleMap.put("cnt", i+1);
							c.add(Calendar.MONTH, cycle);						
							
							String startTimeCycle = sdf.format(c.getTime())+"T"+startTimeHour2+":"+startTimeMinute2+":000";
							String endTimeCycle = sdf.format(c.getTime())+"T"+endTimeHour2+":"+endTimeMinute2+":000";

							
							scheduleMap.put("startTime", startTimeCycle);
							scheduleMap.put("endTime", endTimeCycle);	
						
								
							scheduleList.add(scheduleMap);
							System.out.println(scheduleList);
							
						}
					
										
					}			
				
					System.out.println("***********************컨트롤러:정기성 month for문잘들어감*******************************");
					
					paramMap.put("scheduleList", scheduleList);
					
					Set<String> keys = paramMap.keySet();
					for(String key : keys) {
						System.out.println(key + " : "+ paramMap.get(key));				
					}
								
				
				}
				
			
				employeeService.insertSchedule(paramMap);
				System.out.println(paramMap);
			}
		
			mav.setViewName("company_management/scheduleManagement");
		
			return mav;
		}
		
	
	
}
