package net.haebang.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 	관리자 스케쥴 컨트롤러
 * @author LEEJUHO
 *
 */
@Controller
@RequestMapping("/admin")
public class ScheduleController {
	
	@RequestMapping("/schedule")
	public String schedule() {
		
		System.out.println("스케쥴컨트롤러");
		
		return "admin/schedule";
	}

}
