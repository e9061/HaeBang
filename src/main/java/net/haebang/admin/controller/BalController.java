package net.haebang.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 	관리자 정산관리 컨트롤러
 * @author LEEJUHO
 *
 */

@Controller
@RequestMapping("/admin")
public class BalController {
	
	@RequestMapping("/bal")
	public String bal() {
		
		System.out.println("정산컨트롤러");
		
		return "admin/bal";
	}

}
