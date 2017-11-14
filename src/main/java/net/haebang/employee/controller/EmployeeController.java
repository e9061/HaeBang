package net.haebang.employee.controller;



import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



import net.haebang.employee.service.EmployeeService;
import net.haebang.exception.IdPasswordNotMatchingException;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.MapVo;




@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	@RequestMapping(value="/ceo", method=RequestMethod.GET)
	public ModelAndView main() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("employeeVo", new EmployeeVo());
		mav.setViewName("company_main/companymain");
		
		return mav;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/ceo";
	}
	

	
	@RequestMapping(value="/ceo", method=RequestMethod.POST)
	public ModelAndView loginform(@Valid EmployeeVo employeeVo, Errors errors, HttpSession session, ModelAndView mav) {		
		System.out.println(employeeVo);
		new LoginCommandValidator().validate(employeeVo, errors);
		
		if (errors.hasErrors()) {
			mav.setViewName("company_main/companymain");
			
			return mav;
		}
		
		try {
			
			EmployeeVo userVo = employeeService.authenticate(employeeVo);
			
			System.out.println(userVo);
			
			if(userVo.getE_type().equals("E")) {
				userVo.setE_type("직원");
			}
			
			if(userVo.getE_type().equals("O")) {
				userVo.setE_type("사장");
			}
			
			session.setAttribute("userVo", userVo);
			mav.addObject("userVo", userVo);
			mav.setViewName("company_main/companymain");
			
		
			List<MapVo> maplist = employeeService.selectAllmap(userVo);				
			mav.addObject("maplist", maplist);
							
			return mav;
			
		} catch (IdPasswordNotMatchingException e) {
			
			errors.reject("idPasswordNotMatching");
			mav.setViewName("company_main/companymain");
			
			return mav;
		}
	}
	
	
}

