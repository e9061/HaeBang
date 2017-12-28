package net.haebang.admin.controller;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.haebang.employee.service.EmployeeService;
import net.haebang.vo.MemberVo;
import net.haebang.vo.ScheduleModifyVo;

/**
 * 
 * 	관리자 스케쥴관리 컨트롤러 
 * 
 * @author LEEJUHO
 *
 */


@Controller
@RequestMapping("/admin")
public class ScheduleAdminController {
	
	@Autowired
	private EmployeeService employeeService;
	
	
	
	@RequestMapping("/schedule")
	public String schedule(HttpSession session) {
		
		MemberVo adminVo = (MemberVo)session.getAttribute("adminVo");
		if(adminVo == null) {
			return "redirect:/admin/login";
		}else {
			return "admin_schedule/scheduleMain";
		}
	}
	
	
	
/**************************************** 스케쥴 수정 *********************************************/
	
	@RequestMapping(value="/sceduleModify", method=RequestMethod.GET)
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
	
	@RequestMapping(value="/sceduleModify", method=RequestMethod.POST)
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
		
		
		
		return "redirect:/admin/schedule";
//		return "redirect:/ceo/scheduleDetail?mo_no="+mo_no;		// 스케쥴 디테일 페이지로 보여줌
	}
	
		
	
	
	
	
	// 스케쥴 삭제
	@RequestMapping(value="/scheduleDelete")
	public void scheduleDelete(HttpServletRequest request) {
		int mo_no = Integer.parseInt(request.getParameter("mo_no"));
	    employeeService.deleteSchedule(mo_no);
	}
	
	
	
	
	
	
	
	
}
