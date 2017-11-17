package net.haebang.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 	관리자 메인 컨트롤러 - 진행현황 지도 페이지
 * @author LEEJUHO
 *
 */

@Controller
@RequestMapping("/admin")
public class AdminMainController {
	
	@RequestMapping("/main")
	public String main() {
		System.out.println("main컨트롤러");
		return "admin/main";
	}

}
