package net.haebang.employee.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.employee.service.AuthService;
import net.haebang.exception.IdPasswordNotMatchingException;
import net.haebang.vo.AuthInfo;
import net.haebang.vo.LoginVo;



@Controller
public class EmployeeController {
	
	@Autowired
	private AuthService authService;
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}
	
	@RequestMapping("/ceo")
	public ModelAndView main() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("loginVo",new LoginVo());
		mav.setViewName("company_main/companymain");
		
		return mav;
	}
	
	@RequestMapping(value="/ceo/login", method=RequestMethod.GET)
	public String loginmain() {
		return "company_main/companymain";
	}
	
	@RequestMapping(value="/ceo/login", method=RequestMethod.POST)
	public String loginform(@Valid LoginVo loginVo, Errors errors, HttpSession session, Model model) {		
		System.out.println(loginVo);
		new LoginCommandValidator().validate(loginVo, errors);
		
		if (errors.hasErrors()) {			
			return "company_main/companymain";
		}
		
		try {
			
			AuthInfo authInfo = authService.authenticate(loginVo);
			
			if(authInfo.getType().equals("E")) {
				authInfo.setType("직원");
			}
			
			if(authInfo.getType().equals("O")) {
				authInfo.setType("사장");
			}
			
			session.setAttribute("authInfo", authInfo);
			model.addAttribute("authInfo", authInfo);
			return "company_main/companymain_login";
			
		} catch (IdPasswordNotMatchingException e) {
			
			errors.reject("idPasswordNotMatching");
			return "company_main/companymain";
		}
	}
	
	
}

