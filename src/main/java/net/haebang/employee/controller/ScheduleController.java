package net.haebang.employee.controller;

import java.awt.Color;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.annotation.SynthesizedAnnotation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ch.qos.logback.core.util.SystemInfo;
import net.haebang.employee.service.EmployeeService;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.MemberVo;
import net.haebang.vo.OrderEmployeeVo;
import net.haebang.vo.OrderMemberVo;
import net.haebang.vo.ScheduleModifyVo;
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
		
	//	EmployeeVo userVo = new EmployeeVo();
	//	userVo.setC_no(1);		// 임시
	//	userVo.setE_no(1);		// 임시
		

		// 로그인 상태의 직원또는 사장의 e_no로 해당 업체의 직원 수 알아내기
		List<HashMap<String, Object>> getEmployeeList = employeeService.getEmployeeList(userVo.getE_no());
		int empCnt = getEmployeeList.size();
		
		// 랜덤 색상 만들기
/*
		final float hue = r.nextFloat();
		final float saturation = 0.9f;//1.0 for brilliant, 0.0 for dull
		final float luminance = 1.0f; //1.0 for brighter, 0.0 for black
		color = Color.getHSBColor(hue, saturation, luminance);
		System.out.println(rgb(color.getRed(),color.getGreen(),color.getBlue()));		// 파스텔 톤으로 색 만들기 나중에 참고 할 것.
*/
		Random r = new Random();
		HashMap<Integer, String> cMap = new HashMap<Integer, String>();
		for(int i=0; i<empCnt; i++) {
			int empNo = (int) getEmployeeList.get(i).get("e_no");
			System.out.println(empNo);
			Color c = new Color(r.nextInt(256),r.nextInt(256),r.nextInt(256));
			String colorToString = rgb(c.getRed(),c.getGreen(),c.getBlue());
			cMap.put(empNo, colorToString);
		}
		
		
		// 로그인 한 유저(사장) 스케쥴(사장+직원들) 가져오기 
		List<HashMap<String, Object>> scheduleList = employeeService.getScheduleList(userVo.getC_no());
		
		List<ScheduleVo> scVo = new ArrayList<>();
		
		for(int i=0; i<scheduleList.size(); i++) {
			
			int e_no = (int) scheduleList.get(i).get("e_no");
			ScheduleVo sc = new ScheduleVo((int) scheduleList.get(i).get("mo_no") ,(String) scheduleList.get(i).get("e_name") + " / " + (String) scheduleList.get(i).get("m_address"), (scheduleList.get(i).get("mo_startTime")).toString(), (scheduleList.get(i).get("mo_endTime")).toString());
			
			sc.setColor(cMap.get(e_no));
			scVo.add(sc);
		}
		
		return scVo;
		
	}

	@RequestMapping(value="/ceo/myScheduleList", method=RequestMethod.POST)
	public @ResponseBody List<ScheduleVo> myCalendar(HttpSession session) throws Exception{
		
		EmployeeVo userVo = (EmployeeVo)session.getAttribute("userVo");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("c_no", userVo.getC_no());
		map.put("e_no", userVo.getE_no());
		
		List<HashMap<String, Object>> scheduleList = employeeService.getmyScheduleList(map);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(scheduleList);		// mo_startTime=2017-12-21T15:28:10			// 2017-12-22
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		
		
		List<ScheduleVo> scVo1 = new ArrayList<>();
		
		for(int i=0; i<scheduleList.size(); i++) {
			
			int mo_no = (int) scheduleList.get(i).get("mo_no");
			
			ScheduleVo sc = new ScheduleVo((int) scheduleList.get(i).get("mo_no") , (String) scheduleList.get(i).get("m_address"), (scheduleList.get(i).get("mo_startTime")).toString(), (scheduleList.get(i).get("mo_endTime")).toString());
			
			if(scheduleList.get(i).get("eo_status").equals("대기중")) {			// 대기중 	- 에메랄드색
				sc.setColor("rgb(68,193,195)");
			}else if(scheduleList.get(i).get("eo_status").equals("출동중")) {	// 출동중 	- 핑크색
				sc.setColor("rgb(255,153,153)");
			}else if(scheduleList.get(i).get("eo_status").equals("해방중")) {	// 해방중 	- 녹색
				sc.setColor("rgb(178,255,102)");
			}else {																// 해방 완료	- 회색
				sc.setColor("rgb(224,224,224)");									
			}
			
			sc.setM_lon( (String) scheduleList.get(i).get("m_lon"));
			sc.setM_lat( (String) scheduleList.get(i).get("m_lat"));
			sc.setM_name( (String) scheduleList.get(i).get("m_name"));
			sc.setE_name( (String) scheduleList.get(i).get("e_name"));
			sc.setMo_no(mo_no);
			
			String startDay = (String)scheduleList.get(i).get("mo_startTime");			// 스케쥴 년/월/일 
			startDay = startDay.substring(0,10);
			sc.setStartDay(startDay);
			
			
			scVo1.add(sc);
			
		}
										// 고객 m_lon,m_lat, m_name  정보가 같이 넘어가야함
		
		return scVo1;
		
	}
	

	
	// 색만드는 메서드
	private String rgb(int red, int green, int blue) {
		System.out.println(red + "/" + green +"/" + blue);
		String a = "rgb("+red+","+green+","+blue+")";
		return a;
	}



	/**************************************** 스케쥴 수정 *********************************************/
	
	@RequestMapping(value="/ceo/sceduleModify", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> sceduleModify(HttpServletRequest request){
		int mo_no = Integer.parseInt(request.getParameter("mo_no"));
		String m_type = request.getParameter("m_type");
		
		HashMap<String, Object> scheduleByOdNo = new HashMap<String, Object>();
		
		System.out.println("**************************************** 스케쥴 수정 *********************************************");
		System.out.println(scheduleByOdNo);
		if(m_type.equals("n") || m_type.equals("N")) {
			scheduleByOdNo = employeeService.getScheduleByOdNoTypeN(mo_no);
		} else {
			scheduleByOdNo = employeeService.getScheduleByOdNo(mo_no);
		}

		//mo_startTime 날짜 / 시간으로 (띄어쓰기 기준)subString 후  mod_date, mod_startTime 에 나눠 넣는다.
		
		String tempDate = (String) scheduleByOdNo.get("mo_startTime");
		String tempDate2 = (String) scheduleByOdNo.get("mo_endTime");
		
		String tempDateTime[] = tempDate.split(" ");
		
		String mod_date = tempDateTime[0];
		String mod_startTime = tempDateTime[1];
		
		tempDateTime = tempDate2.split(" ");
		
		String mod_endTime = tempDateTime[1];
		
		scheduleByOdNo.put("mod_date", mod_date);
		scheduleByOdNo.put("mod_startTime", mod_startTime);
		scheduleByOdNo.put("mod_endTime", mod_endTime);
		
		return scheduleByOdNo;
		
	}
	
	// 직원 리스트 받아오기
	@RequestMapping(value="/ceo/getEmployeeList", method=RequestMethod.GET)
	public @ResponseBody List<HashMap<String, Object>> getEmployeeList(HttpServletRequest request){
		int e_no = Integer.parseInt(request.getParameter("e_no"));
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> getEmployeeList = new ArrayList<HashMap<String, Object>>();
		getEmployeeList.add(map);
		getEmployeeList = employeeService.getEmployeeList(e_no);
		
		return getEmployeeList;
	}
		
	
	
	@RequestMapping(value="/ceo/sceduleModify", method=RequestMethod.POST)
	public String sceduleModifyUpdate(@ModelAttribute ScheduleModifyVo sm){
		
		
		String temp = sm.getMo_cnt().replaceAll(",", "");			// 왜 mo_cnt 에 "," 가 들어가는지 의문임...
		sm.setMo_cnt(temp);
		
		sm.setMo_startTime(sm.getMod_date()+ " " +sm.getMod_startTime());
		sm.setMo_endTime(sm.getMod_date()+ " " +sm.getMod_endTime());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
	        Field[] fields = sm.getClass().getDeclaredFields();
	        for(int i=0; i <fields.length; i++){
	            fields[i].setAccessible(true);
	            try{
	            	if(fields[i].get(sm) != null & fields[i].get(sm) !="") {
	            		map.put(fields[i].getName(), fields[i].get(sm));
	            	}else {
	            	}
	            }catch(Exception e){
	                e.printStackTrace();
	            }
	        }        
	        
	        map.remove("mod_date");
	        map.remove("mod_startTime");
	        map.remove("mod_endTime");
	        map.remove("periodType");
	
		if(sm.getM_type().equals("n") || sm.getM_type().equals("N")) {		// 스케쥴 case
			
			map.remove("s_no");
			map.remove("s_name");
			map.remove("s_s_style");
			
			
			
			if(sm.getPeriodType().equals("1회형")){
				map.remove("mo_cnt");
			}
			
			employeeService.updateNoHaebangSch(map);
			
		} else {																// 해방 case
		
			
			
			if(sm.getS_style().equals("j")) {
				
			} else {
				map.remove("mo_cnt");
			}
			
			
			employeeService.updateHaebangSch(map);
		}
		
		
		
		return "redirect:schedule";
//		return "redirect:/ceo/scheduleDetail?mo_no="+mo_no;		// 스케쥴 디테일 페이지로 보여줌
	}
	
		
	
	
	
	
	// 스케쥴 삭제
	@RequestMapping(value="/ceo/scheduleDelete")
	public void scheduleDelete(HttpServletRequest request) {
		int mo_no = Integer.parseInt(request.getParameter("mo_no"));
	    employeeService.deleteSchedule(mo_no);
	}
	
	/**************************************** 스케쥴 수정 *********************************************/	
	
	
	// 스케쥴 디테일
	@RequestMapping(value="/ceo/scheduleDetail", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> scheduleDetail(HttpServletRequest request){
		int mo_no = Integer.parseInt(request.getParameter("mo_no"));
		
		//mo_no로 m_type을 가져온다!
		String m_type=employeeService.getMtypebyMONo(mo_no);
		
		
		if(m_type.equals("N")) {
			
			HashMap<String, Object> scheduleByMONo = new HashMap<String, Object>();
			
			scheduleByMONo = employeeService.getScheduleByMONo(mo_no);
				
				String phone = (String)scheduleByMONo.get("m_phone");
				
				if(phone.length()==10) {
					
					
					
					String m_phone1 = phone.substring(0, 3);
					String m_phone2 = phone.substring(3, 6);
					String m_phone3 = phone.substring(6, 10);
					
					scheduleByMONo.put("m_phone1", m_phone1);
					scheduleByMONo.put("m_phone2", m_phone2);
					scheduleByMONo.put("m_phone3", m_phone3);
					
				} else {
					
					
					
					String m_phone1 = phone.substring(0, 3);
					String m_phone2 = phone.substring(3, 7);
					String m_phone3 = phone.substring(7, 11);	
					
					scheduleByMONo.put("m_phone1", m_phone1);
					scheduleByMONo.put("m_phone2", m_phone2);
					scheduleByMONo.put("m_phone3", m_phone3);
				}
					
				
				String startDateTime = (String)scheduleByMONo.get("mo_startTime");
				String startDate = startDateTime.substring(0, 10);
				String startTime = startDateTime.substring(11, 16);
				
				scheduleByMONo.put("startDate", startDate);
				scheduleByMONo.put("startTime", startTime);
				
				String endDateTime = (String)scheduleByMONo.get("mo_endTime");
				String endDate = startDateTime.substring(0, 10);
				String endTime = startDateTime.substring(11, 16);
				
				scheduleByMONo.put("endDate", endDate);
				scheduleByMONo.put("endTime", endTime);
				
				
				String mo_freqType=(String)scheduleByMONo.get("mo_freqType");
				
				if(mo_freqType.equals("W") || mo_freqType.equals("w")) {//주
					
					
					scheduleByMONo.put("mo_freqType", "주단위 반복");
					int mo_freqCycle1=(int)scheduleByMONo.get("mo_freqCycle");
					String mo_freqCycle2=Integer.toString(mo_freqCycle1)+"주마다";					
					scheduleByMONo.put("mo_freqCycle", mo_freqCycle2);
					scheduleByMONo.put("periodType", "정기형");
					
				}else if(mo_freqType.equals("M") || mo_freqType.equals("m")) {//월
					
					
					scheduleByMONo.put("mo_freqType", "월단위 반복");
					int mo_freqCycle1=(int)scheduleByMONo.get("mo_freqCycle");
					String mo_freqCycle2=Integer.toString(mo_freqCycle1)+"개월마다";
					scheduleByMONo.put("mo_freqCycle", mo_freqCycle2);
					scheduleByMONo.put("periodType", "정기형");
					
				}else {
					
					scheduleByMONo.put("periodType", "1회성");
					
				}
				
				
				String e_phone = (String)scheduleByMONo.get("e_phone");
				
				if(e_phone.length()==10) {
					
					String e_phone1 = e_phone.substring(0, 3);
					String e_phone2 = e_phone.substring(3, 6);
					String e_phone3 = e_phone.substring(6, 10);
					
					scheduleByMONo.put("e_phone1", e_phone1);
					scheduleByMONo.put("e_phone2", e_phone2);
					scheduleByMONo.put("e_phone3", e_phone3);
					
				} else {
					
					String e_phone1 = e_phone.substring(0, 3);
					String e_phone2 = e_phone.substring(3, 7);
					String e_phone3 = e_phone.substring(7, 11);	
					
					scheduleByMONo.put("e_phone1", e_phone1);
					scheduleByMONo.put("e_phone2", e_phone2);
					scheduleByMONo.put("e_phone3", e_phone3);
				}	
				
				return scheduleByMONo;
					
			
		}else {//해방통해서 한사람들
			
			HashMap<String, Object> scheduleByMONo = new HashMap<String, Object>();
			
			scheduleByMONo = employeeService.getScheduleByMONoByHB(mo_no);
			
			
			String phone = (String)scheduleByMONo.get("m_phone");
			
			if(phone.length()==10) {
				
				String m_phone1 = phone.substring(0, 3);
				String m_phone2 = phone.substring(3, 6);
				String m_phone3 = phone.substring(6, 10);
				
				scheduleByMONo.put("m_phone1", m_phone1);
				scheduleByMONo.put("m_phone2", m_phone2);
				scheduleByMONo.put("m_phone3", m_phone3);
				
								
			} else {
				
				String m_phone1 = phone.substring(0, 3);
				String m_phone2 = phone.substring(3, 7);
				String m_phone3 = phone.substring(7, 11);	
		
				scheduleByMONo.put("m_phone1", m_phone1);
				scheduleByMONo.put("m_phone2", m_phone2);
				scheduleByMONo.put("m_phone3", m_phone3);
				
			}
				
			
			String startDateTime = (String)scheduleByMONo.get("mo_startTime");
			
			
			String startDate = startDateTime.substring(0, 10);
			String startTime = startDateTime.substring(11, 16);
			
			scheduleByMONo.put("startDate", startDate);
			scheduleByMONo.put("startTime", startTime);
			
			String endDateTime = (String)scheduleByMONo.get("mo_endTime");
			String endDate = startDateTime.substring(0, 10);
			String endTime = startDateTime.substring(11, 16);
			
			scheduleByMONo.put("endDate", endDate);
			scheduleByMONo.put("endTime", endTime);
			
			
			
			String e_phone = (String)scheduleByMONo.get("e_phone");
			
			if(e_phone.length()==10) {
				
				
				String e_phone1 = e_phone.substring(0, 3);
				String e_phone2 = e_phone.substring(3, 6);
				String e_phone3 = e_phone.substring(6, 10);
				
				scheduleByMONo.put("e_phone1", e_phone1);
				scheduleByMONo.put("e_phone2", e_phone2);
				scheduleByMONo.put("e_phone3", e_phone3);
				
			} else {			
				
				String e_phone1 = e_phone.substring(0, 3);
				String e_phone2 = e_phone.substring(3, 7);
				String e_phone3 = e_phone.substring(7, 11);	
				
				scheduleByMONo.put("e_phone1", e_phone1);
				scheduleByMONo.put("e_phone2", e_phone2);
				scheduleByMONo.put("e_phone3", e_phone3);
			}
			
			
			
			
			String s_style = (String)scheduleByMONo.get("s_style");
			
			if(s_style.equals("j")) {//정기형
												
							
				scheduleByMONo.put("periodType", "정기형");
		
				String mo_freqType=(String)scheduleByMONo.get("mo_freqType");
				
				if(mo_freqType.equals("W") || mo_freqType.equals("w")) {//주
					
					scheduleByMONo.put("mo_freqType", "주단위 반복");
					int mo_freqCycle1=(int)scheduleByMONo.get("mo_freqCycle");
					String mo_freqCycle2=Integer.toString(mo_freqCycle1)+"주마다";					
					scheduleByMONo.put("mo_freqCycle", mo_freqCycle2);
					
				}else if(mo_freqType.equals("M") || mo_freqType.equals("m")) {//월
					
					
					scheduleByMONo.put("mo_freqType", "월단위 반복");					
					int mo_freqCycle1=(int)scheduleByMONo.get("mo_freqCycle");
					String mo_freqCycle2=Integer.toString(mo_freqCycle1)+"개월마다";
					scheduleByMONo.put("mo_freqCycle", mo_freqCycle2);
				}		
		
			}else {//보장형
				
				scheduleByMONo.put("periodType", "보장형");
			
			
			}
				
			return scheduleByMONo;
			
		}
	
		
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
			@RequestParam(value="unit1", defaultValue="null", required=false) String unit,
			@RequestParam(value="cycle", defaultValue="null", required=false) String cycle1,
			@RequestParam(value="totalCnt", defaultValue="null", required=false) String totalCnt1,
			@RequestParam(value="date2", defaultValue="null", required=false) String date2,
			@RequestParam(value="startTimeHour2", defaultValue="null", required=false) String startTimeHour2,
			@RequestParam(value="startTimeMinute2", defaultValue="null", required=false) String startTimeMinute2, 
			@RequestParam(value="endTimeHour2", defaultValue="null", required=false) String endTimeHour2,
			@RequestParam(value="endTimeMinute2", defaultValue="null", required=false) String endTimeMinute2,
			@RequestParam(value="comments", defaultValue="null", required=false) String comments,
			@RequestParam(value="lon", defaultValue="null", required=false) String m_lon,
			@RequestParam(value="lat", defaultValue="null", required=false) String m_lat,			
			@RequestParam(value="gu", defaultValue="null", required=false) String m_gu,			
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
		System.out.println(m_lon);
		System.out.println(m_lat);
		
		
		
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
				paramMap.put("m_lon", m_lon);
				paramMap.put("m_lat", m_lat);
				paramMap.put("m_gu", m_gu);
				
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
				paramMap.put("m_lon", m_lon);
				paramMap.put("m_lat", m_lat);
				paramMap.put("m_gu", m_gu);
				
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
