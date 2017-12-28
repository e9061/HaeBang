package net.haebang.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import net.haebang.admin.dao.AdminDao;
import net.haebang.admin.service.AdminService;
import net.haebang.exception.NoMemberException;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;

/**
 * 관리자 메인 컨트롤러 - 진행현황 지도 페이지
 * 
 * @author LEEJUHO
 *
 */

@Controller
public class AdminMainController {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired 
	AdminService adminService;

	@RequestMapping("/admin")
	public String main(HttpSession session) {
		
		System.out.println("메인화면 컨트롤러");
		
		MemberVo adminVo = (MemberVo)session.getAttribute("adminVo");
		if(adminVo == null) {
			return "redirect:/admin/login";
		}else {
			return "admin/main";
		}
		
	}

	// ------------------------------------ 창대 12/2일 작업(지도 주문관련)----------------------------------------------

	@RequestMapping(value = "/admin/selectAllmap", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<HashMap<String, Object>> selectAllmap(HttpSession session, Model model) {
		
		System.out.println("지도탐");
		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();

		mapList = adminDao.selectAllmap();

		model.addAttribute("mapList", mapList);
		System.out.println(mapList);
		System.out.println(mapList.size());

		return mapList;
	}
	
	@RequestMapping(value="/admin/findSchedule", method=RequestMethod.GET)
	public ModelAndView searchScheduleAjax(			 
			@RequestParam(value="nowpage", defaultValue="0") int page,
            @RequestParam(value="word", required=false) String word, 
            @RequestParam(value="searchSchedule", defaultValue="null", required=false) String searchSchedule,
            @RequestParam(value="startDate", defaultValue="null", required=false) String startDate,
			@RequestParam(value="endDate", defaultValue="null", required=false) String endDate,
			ModelAndView mav) {
		
		
		System.out.println("************************************************************************");
		System.out.println("!!!!!!!!!!!!!!!AdminsearchSchedule!!!!!!!!!!");
		System.out.println(page + "  + " + word +  "  + " + searchSchedule +  "  + " + startDate  +  "  + " + endDate);
		System.out.println("************************************************************************");
		
		// 페이징	
			List< HashMap<String, Object>> getScheduleList = adminService.getScheduleList(page, word, searchSchedule, startDate, endDate);
			
			int totalPage = adminService.selectTotalCountSchedule(word, searchSchedule, startDate, endDate);
	
			for(int i = 0 ; i < getScheduleList.size() ; i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("listNo", i+1+(page*10));
				getScheduleList.get(i).put("listNo", i+1+(page*10));
			}
			
			System.out.println("리스트넘버추가된 리스트:"+getScheduleList);			
			System.out.println("totalPage: "+totalPage);
						
			mav.addObject("nowpage", page);
			mav.addObject("totalpage", totalPage);				
			mav.addObject("getScheduleList", getScheduleList);
			mav.addObject("word", word);
			mav.addObject("searchSchedule", searchSchedule);
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			
			mav.setViewName("admin_schedule/searchScheduleList");			
		
		
		return mav;
	}
	
	@RequestMapping(value="/admin/findScheduleDetail", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> scheduleDetail(HttpServletRequest request){
		System.out.println("findScheduleDetail컨트롤러 입성!!!!!");
		int mo_no = Integer.parseInt(request.getParameter("mo_no"));
		
		System.out.println(mo_no);
		//mo_no로 m_type을 가져온다!
		String m_type=adminService.getMtypebyMONo(mo_no);
		System.out.println(m_type);
		
		
		if(m_type.equals("N")) {
			
			HashMap<String, Object> scheduleByMONo = new HashMap<String, Object>();
			
			scheduleByMONo = adminService.getScheduleByMONo(mo_no);
				
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
			
			scheduleByMONo = adminService.getScheduleByMONoByHB(mo_no);
			
			System.out.println("해방통해서 한사람들 메서드실행후: "+scheduleByMONo);
			
			String phone = (String)scheduleByMONo.get("m_phone");
			System.out.println("phone: "+phone);
			
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
			System.out.println("s_style: "+s_style);
			
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
				
			System.out.println(scheduleByMONo);
			return scheduleByMONo;
			
		}
		
		
	}
	
	// ***************************  창대  ***************************
		@RequestMapping(value= "/admin/login", method=RequestMethod.GET)
		public String adminLogin(HttpSession session) {
			//userVo 중에
			MemberVo memberVo = (MemberVo)session.getAttribute("userVO");
			EmployeeVo employeeVo = (EmployeeVo)session.getAttribute("userVo");
			if(employeeVo != null) {
				return "redirect:/ceo";
			}else if(memberVo !=null) {
				if(memberVo.getM_type() !="A") {
				return "redirect:/";
				}
			}
			return "admin/loginForm";
		}
		

		@RequestMapping(value= "/admin/login", method=RequestMethod.POST)
		public String adminLogin(HttpServletRequest request, HttpSession session, Model model) {
			
			String m_id = request.getParameter("m_id");
			String m_password = request.getParameter("m_password");
			Map<String,Object> map = new HashMap<>();
			
			map.put("m_id", m_id);
			map.put("m_password", m_password);
			
			
			try {
				MemberVo adminVo = adminService.loginAdmin(map);
				
				System.out.println("관리자 로그인 성공");
				session.setAttribute("adminVo", adminVo);
				
				return "redirect:/admin";
				
			} catch (NoMemberException e) {
				System.out.println("익셉션 노맴버 탐");
				model.addAttribute("ErrorMessage","입력하신 회원 정보가 존재하지 않습니다.");
				return "admin/loginForm";
			}
		}
		// *********************************************************************************
		
		
		// 메인 전체 정보 - 오늘 기준
		@RequestMapping(value="/admin/mainInfo", method=RequestMethod.POST)
		public @ResponseBody List<Map<String, Object>> mainInfo (HttpServletRequest request){
			
			List<Map<String, Object>> mainInfo = adminService.getMainInfo();
			
			return mainInfo;
		}
		
		
		// 조건검색 - 오늘기준 서비스 진행 될 구별 정보 가져오기 ( eo_status - 대기중/출동중/해방중/해방완료 로 갯수 표현 )
		@RequestMapping(value="/admin/searchGuInfo", method=RequestMethod.POST)
		public @ResponseBody List<Map<String, Object>> searchGuInfo(HttpServletRequest request){
			
			System.out.println("조건검색 커틀홀러 탐");
			String m_gu = request.getParameter("m_gu");
			String eo_status = request.getParameter("eo_status");
			
	/*		Calendar calendar = Calendar.getInstance();
			java.util.Date date = calendar.getTime();
			String today = (new SimpleDateFormat("yyyy-MM-dd").format(date));*/			// 쿼리문으로 해결
			
			Map<String, Object> map = new HashMap<>();
			map.put("m_gu", m_gu);
			map.put("eo_status", eo_status);
	//		map.put("today", today);
			
			System.out.println(map);
			
			List<Map<String, Object>> guInfo = adminService.searchGuInfo(map);
			
			System.out.println(guInfo);
			return guInfo;
		}
		
		
}
