package net.haebang.employee.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.haebang.employee.service.AuthService;
import net.haebang.exception.IdPasswordNotMatchingException;
import net.haebang.vo.AuthInfo;
import net.haebang.vo.LoginVo;




public class EmployeeController {
	
	private AuthService authService;
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}

	
	@RequestMapping(value="/ceo/login", method=RequestMethod.POST)
	public String form(LoginVo loginVo, Errors errors, HttpSession session, Model model) {		
		
		new LoginCommandValidator().validate(loginVo, errors);
		if (errors.hasErrors()) {
			return "/ceo";
		}
		try {
			AuthInfo authInfo = authService.authenticate(loginVo);

			session.setAttribute("authInfo", authInfo);
			model.addAttribute("authInfo", authInfo);
			return "/ceo";
			
		} catch (IdPasswordNotMatchingException e) {
			errors.reject("idPasswordNotMatching");
			return "/ceo";
		}
	}
	
	
}

