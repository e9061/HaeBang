package net.haebang.employee.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import net.haebang.employee.service.EmployeeService;
import net.haebang.exception.IdPasswordNotMatchingException;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.MapVo;

import net.haebang.employee.dao.EmployeeDao;
import net.haebang.employee.service.EmployeeService;
import net.haebang.exception.AlreadyExistingMemberException;
import net.haebang.exception.IdPasswordNotMatchingException;
import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;


@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	
	@Autowired
	private EmployeeDao employeeDao;


	@RequestMapping(value = "/ceo/register/step2", method = RequestMethod.GET)
	public String joinForm1(Model model) {
		System.out.println("joinForm1");
		model.addAttribute("joinEmployeeVo", new JoinEmployeeVo());
		return "employee/step2";
	}

	@RequestMapping(value = "/ceo/register/step2", method = RequestMethod.POST)
	public String joinForm2(Model model) {
		
		System.out.println("joinForm2");
		model.addAttribute("joinEmployeeVo", new JoinEmployeeVo());
		return "employee/step2";
	}
	// 곧장 /register/step2로 들어오면 get방식으로 들어오므로 그걸 리다이렉트 해줘야함.

	@RequestMapping(value = "/ceo/register/step3", method = RequestMethod.POST)
	public String joinForm3(JoinEmployeeVo joinEmployeeVo, Errors errors, MultipartHttpServletRequest request) {
		new RegisterEmployeeValidator().validate(joinEmployeeVo, errors);
		
		if(errors.hasErrors())
		{
			return "employee/step2";
		}
		try {
			
			employeeService.registerEmployee(joinEmployeeVo, request);
			return "employee/step3";

		} catch (AlreadyExistingMemberException ex) {
			errors.rejectValue("e_id", "duplicate");
			return "employee/step2";
		}
		
	}

	@RequestMapping(value = "/ceo/register/step3", method = RequestMethod.GET)
	public String joinForm4() {
		System.out.println("joinForm4");
				return "redirect:/ceo/register/step2";
	}
	
	
	@RequestMapping(value="/ceo/register/duplicate1", method=RequestMethod.POST)
	public String duplicate1(HttpServletRequest req, Model model) {
		System.out.println(req.getParameter("e_id"));
		EmployeeVo employeeVo = employeeDao.selectById(req.getParameter("e_id"));
		String msg=null;
		
//		Pattern pattern = Pattern.compile("[0-9].[a-zA-Z].{6,14}$");
		Pattern pattern1 = Pattern.compile("^(?=.*[0-9])(?=.*[a-z])(?=.*[a-zA-Z]).{6,14}$");
		
		Matcher matcher = pattern1.matcher(req.getParameter("e_id"));
		if(matcher.find())
		{
			if(employeeVo!=null)
			{
				msg="존재하는 아이디입니다.";
				model.addAttribute("msg", msg);
			}
			else
			{
				msg="사용가능한 아이디입니다.";
				model.addAttribute("msg", msg);
			}
			
		}else{
			
			msg="영문, 숫자 포함 6~14자리로 입력해주세요.";
			model.addAttribute("msg", msg);
		}
		
		
		return "employee/duplicate";
		
	}
	
	@RequestMapping(value="/ceo/register/duplicate2", method=RequestMethod.POST)
	public String duplicate2(HttpServletRequest req, Model model) {
		System.out.println(req.getParameter("c_bizNo"));
		CompanyVo companyVo = employeeDao.selectBybizNo(req.getParameter("c_bizNo"));
		String msg=null;
		Pattern pattern = Pattern.compile("^[0-9]{10}$");
		
		Matcher matcher = pattern.matcher(req.getParameter("c_bizNo"));
		if(matcher.find())
		{	if(companyVo!=null)
			{
				msg="존재하는 사업자번호입니다.";
				model.addAttribute("msg", msg);
			}
			else
			{
				msg="사용가능한 사업자 번호입니다.";
				model.addAttribute("msg", msg);
			}
			
		}else
		{
			msg="10자리 숫자로만 입력해주세요.";
			model.addAttribute("msg", msg);
		}
		
		return "employee/duplicate";
		
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

