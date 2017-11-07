package net.haebang.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminMainController {
	
	@RequestMapping("/main.do")
	public String progress() {
		System.out.println("main컨트롤러");
		return "main";
	}

}
