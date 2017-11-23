package net.haebang.employee.controller;

import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.employee.service.EmployeeService;
import net.haebang.exception.IdPasswordNotMatchingException;
import net.haebang.exception.NoSuchIdException;
import net.haebang.exception.NoSuchMemberException;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.MapVo;
import net.haebang.vo.NoticeBoardVo;
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
		
		List<NoticeBoardVo> mainNoticelist = employeeService.getMainnoticelist();
		
		mav.addObject("mainNoticelist", mainNoticelist);
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
		
		System.out.println(employeeVo.getE_id());
		
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
			
			List<NoticeBoardVo> mainNoticelist = employeeService.getMainnoticelist();			
			mav.addObject("mainNoticelist", mainNoticelist);
		
			List<MapVo> maplist = employeeService.selectAllmap(userVo);				
			mav.addObject("maplist", maplist);
							
			return mav;
			
						
		} catch (IdPasswordNotMatchingException e) {			
			
			System.out.println("아이디패스워드낫매치드!");
			mav.addObject("errorMessage", "입력하신 회원 정보가 존재하지 않습니다");
			mav.setViewName("company_main/companymain");
			
			return mav;

		}
	
		
		
	}
	
/******************************** 공지사항 made by juho ******************************************************	
	*************************************************************************************/
  
	@RequestMapping("/ceo/ceoNotice")
	public ModelAndView notice(
			@RequestParam(value="n_type", required=false) String n_type, 
			@RequestParam(value="nowpage", defaultValue="0") int page,
            @RequestParam(value="word", required=false) String word, 
            @RequestParam(value="searchCondition", defaultValue="null", required=false) String searchCondition) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("************************************************************************");
		System.out.println("!!!!!!!!!!!!!!!ceoNotice!!!!!!!!!!");
		System.out.println(n_type + "  + " + page + "  + " + word +  "  + " + searchCondition);
		System.out.println("************************************************************************");
		
		// 페이징	
		List<NoticeBoardVo> getOwnerNoticeList = employeeService.getNoticeList(n_type ,page, word, searchCondition);
		int totalPage = employeeService.getLastPage(n_type, word, searchCondition);
		
		// key 통일 - include 때문에
		mav.addObject("n_type", n_type);
		mav.addObject("nowpage", page);
		mav.addObject("totalpage", totalPage);				
		mav.addObject("noticelist", getOwnerNoticeList);
		mav.addObject("word", word);
		mav.addObject("titlecontent" ,searchCondition);
		mav.setViewName("company_contact/companyNotice");		
		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
		return mav;
	}
	
	@RequestMapping(value="/ceo/ceoNoticeDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam("no") int no,
							   @RequestParam("n_viewCnt") int n_viewCnt	) {
		ModelAndView mav = new ModelAndView();
		n_viewCnt ++;
		
		NoticeBoardVo noticeBoardVo = new NoticeBoardVo();
		noticeBoardVo.setN_no(no);
		noticeBoardVo.setN_viewCnt(n_viewCnt);
		
		NoticeBoardVo noticeDetail = employeeService.getNoticeBoardByNo(noticeBoardVo);
		
		mav.addObject("noticeDetail", noticeDetail);
		mav.setViewName("company_contact/companyNoticeDetail");		
		
		return mav;
	}
	
/*******************************************************************************************	
	*******************************************************************************************/
	
	
	
	
	
	@RequestMapping(value="/ceo/forgotmyid", method=RequestMethod.GET)
	public String findIdGet() {
		return "company_main/forgotMyid";
	}

	
	
	@RequestMapping(value="/ceo/forgotmyid", method=RequestMethod.POST)
	public ModelAndView findId(
			@RequestParam("member-find-way") String findway,
			@RequestParam(value="name1", defaultValue="null", required=false) String name1,
			@RequestParam(value="name2", defaultValue="null", required=false) String name2,
			@RequestParam(value="phone1", defaultValue="null", required=false) String phone1, 
			@RequestParam(value="phone2", defaultValue="null", required=false) String phone2,
			@RequestParam(value="phone3", defaultValue="null", required=false) String phone3,
			@RequestParam(value="companyName", defaultValue="null", required=false) String companyName,
			@RequestParam(value="bizNo1", defaultValue="null", required=false) String bizNo1, 
			@RequestParam(value="bizNo2", defaultValue="null", required=false) String bizNo2,
			@RequestParam(value="bizNo3", defaultValue="null", required=false) String bizNo3, ModelAndView mav) {
		
		
			
		
		if(findway.equals("cellphone")) {
			
			try {
			
			String phone = phone1+phone2+phone3;
						
			EmployeeVo employeevo = employeeService.getIdByPhone(name1, phone);

			String email = employeevo.getE_id();
			
			String emailid = "";
			String emailaddress = "";
			String modifiedEmail = "";
			int at1 = email.indexOf("@");
			int at2 = email.lastIndexOf("@");
			emailid = email.substring(0, at1);
			emailaddress = email.substring(at2);		

			
			int halfLength = (emailid.length()/2);
			System.out.println(halfLength);
			
			Random r = new Random();		
			StringBuilder sb = new StringBuilder(emailid);
			for(int i = 0; i < halfLength; i++) {
				int randomIndex = Math.abs(r.nextInt()%(emailid.length()));
				if(sb.charAt(randomIndex) != '*') {
					sb.setCharAt(randomIndex, '*');
				}else {
					i--;
				}			
		
			}		
			
			modifiedEmail = sb+emailaddress;
			
			mav.addObject("joinDate", employeevo.getE_joinDate());
			mav.addObject("modifiedEmail", modifiedEmail);
			mav.setViewName("company_main/findmyid");
			
			}catch (NoSuchMemberException e) {
				
				System.out.println("셀폰-노서치멤버익셉션!");
				mav.addObject("errorMessage", "입력하신 회원 정보가 존재하지 않습니다");
				mav.setViewName("company_main/forgotMyid");			
				
				
			}
			
			
			
		}
		
		if(findway.equals("bizNo")) {
			
			try {
			
			String bizNo = bizNo1 + bizNo2 + bizNo3;
			EmployeeVo employeevo = employeeService.getIdByBizNo(name2, companyName, bizNo);
			System.out.println(employeevo);
			
			String email = employeevo.getE_id();
			String emailid = "";
			String emailaddress = "";
			String modifiedEmail = "";
			int at1 = email.indexOf("@");
			int at2 = email.lastIndexOf("@");
			emailid = email.substring(0, at1);
			emailaddress = email.substring(at2);		
			
			int halfLength = (emailid.length()/2);
			
			Random r = new Random();		
			StringBuilder sb = new StringBuilder(emailid);
			for(int i = 0; i < halfLength; i++) {
				int randomIndex = Math.abs(r.nextInt()%(emailid.length()));
				if(sb.charAt(randomIndex) != '*') {
					sb.setCharAt(randomIndex, '*');
				}else {
					i--;
				}			
		
			}		
			
			
			modifiedEmail = sb+emailaddress;
			
			mav.addObject("joinDate", employeevo.getE_joinDate());
			mav.addObject("modifiedEmail", modifiedEmail);
			mav.setViewName("company_main/findmyid");
			
		}	catch (NoSuchMemberException e) {
			
			System.out.println("비-노서치멤버익셉션!");
			mav.addObject("errorMessage", "입력하신 회원 정보가 존재하지 않습니다");
			mav.setViewName("company_main/forgotMyid");			
		
			
		}				
				
	}
		return mav;
	
	}
	

	@RequestMapping(value="/ceo/forgotmypassword", method=RequestMethod.GET)
	public ModelAndView forgotmypassword(ModelAndView mav) {		
		mav.addObject("employeeVo", new EmployeeVo());
		mav.setViewName("company_main/forgotMypassword");
		return mav;
	}
	
	
	@RequestMapping(value="/ceo/forgotmypassword", method=RequestMethod.POST)
	public ModelAndView phoneAuthforPw(EmployeeVo employeeVo, ModelAndView mav) {
		
		try {
		
			EmployeeVo checkIdbyId = employeeService.getIdbyId(employeeVo);
		
			mav.addObject("userID", checkIdbyId.getE_id());
			mav.setViewName("company_main/phoneAuthforPw");
		
		} catch (NoSuchIdException e) {
			
			mav.addObject("errorMessage", "일치하는 회원정보가 없습니다");
			mav.setViewName("company_main/forgotMypassword");
			
		}
		
		return mav;
	}
	
	@RequestMapping(value="/ceo/passwordChangeForm", method=RequestMethod.GET)
	public ModelAndView passwordChangeForm(@RequestParam("id")  String userid, ModelAndView mav) {
		
		mav.addObject("userID", userid);
		mav.addObject("employeeVo", new EmployeeVo());
		mav.setViewName("company_main/passwordChangeForm");
		
		return mav;
	}
	
	@RequestMapping(value="/ceo/passwordChangeForm", method=RequestMethod.POST)
	public ModelAndView passwordChangeForm2(EmployeeVo employeeVo, ModelAndView mav) {
		
		System.out.println(employeeVo);
		employeeService.changePassword(employeeVo);
		System.out.println("passwordchange 업데이트 완료");
		mav.setViewName("company_main/passwordChanged");
		
		return mav;
	}
	
	
}
