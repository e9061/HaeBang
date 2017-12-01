package net.haebang.employee.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.employee.dao.EmployeeDao;
import net.haebang.employee.service.EmployeeService;
import net.haebang.exception.AlreadyExistingMemberException;
import net.haebang.exception.IdPasswordNotMatchingException;
import net.haebang.exception.NoSuchIdException;
import net.haebang.exception.NoSuchMemberException;
import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.NoticeBoardVo;
import net.haebang.vo.OrderEmployeeVo;
import net.haebang.vo.ScheduleVo;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private EmployeeDao employeeDao;

	// ---------------------------------- 창대 회원가입 --------------------------------------------------------------------

	@RequestMapping(value = "/ceo/register/step1", method = RequestMethod.GET)
	public ModelAndView joinForm(String type) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("type", type);
		mav.setViewName("employee/step1");

		return mav;
	}

	@RequestMapping(value = "/ceo/register/step2", method = RequestMethod.GET)
	public String joinForm1(Model model) {
		System.out.println("뭐지 왜 두번 들어오지");
		model.addAttribute("joinEmployeeVo", new JoinEmployeeVo());
		return "employee/step2";
	}

	@RequestMapping(value = "/ceo/register/step2", method = RequestMethod.POST)
	public String joinForm2(Model model, @RequestParam(value = "ownerOrMember") String ownerOrMember) {
		System.out.println(ownerOrMember);
		model.addAttribute("ownerOrMember", ownerOrMember);
		model.addAttribute("joinEmployeeVo", new JoinEmployeeVo());
		return "employee/step2";
	}

	@RequestMapping(value = "/ceo/register/step3", method = RequestMethod.POST)
	public String joinForm3(JoinEmployeeVo joinEmployeeVo, Errors errors, MultipartHttpServletRequest request,
			Model model) {
		System.out.println(errors.hasErrors());
		new RegisterEmployeeValidator().validate(joinEmployeeVo, errors);
		joinEmployeeVo.setC_address(joinEmployeeVo.getC_address()+" "+request.getParameter("c_detailAddress"));
		joinEmployeeVo.setE_phone(request.getParameter("e_phone1")+request.getParameter("e_phone2")+request.getParameter("e_phone3"));
		
		if (joinEmployeeVo.getC_code() == null) {
			if (errors.hasErrors()) {
				return "employee/step2";
			}
			try {

				employeeService.registerEmployeeAnd(joinEmployeeVo, request);
				return "employee/step3";

			} catch (AlreadyExistingMemberException ex) {
				errors.rejectValue("e_id", "duplicate");
				return "employee/step2";
			}
		}

		if (errors.hasErrors()) {
			model.addAttribute("ownerOrMember", request.getParameter("ownerOrMember"));
			return "employee/step2";
		}

		try {
			employeeService.registerEmployee(joinEmployeeVo, request);
			return "employee/step3";

		} catch (AlreadyExistingMemberException ex) {
			model.addAttribute("ownerOrMember", request.getParameter("ownerOrMember"));
			errors.rejectValue("e_id", "duplicate");
			return "employee/step2";
		}

	}

	@RequestMapping(value = "/ceo/register/step3", method = RequestMethod.GET)
	public String joinForm4() {
		return "redirect:/ceo/register/step2";
	}

	@RequestMapping(value = "/ceo/register/duplicate1", method = RequestMethod.POST)
	public String duplicate1(HttpServletRequest req, Model model) {
		System.out.println(req.getParameter("e_id"));
		EmployeeVo employeeVo = employeeDao.selectById(req.getParameter("e_id"));
		String msg = null;

		// Pattern pattern = Pattern.compile("[0-9].[a-zA-Z].{6,14}$");
		Pattern pattern1 = Pattern.compile(
				"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");

		Matcher matcher = pattern1.matcher(req.getParameter("e_id"));
		if (matcher.find()) {
			if (employeeVo != null) {
				msg = "존재하는 아이디입니다.";
				model.addAttribute("msg", msg);
			} else {
				msg = "사용가능한 아이디입니다.";
				model.addAttribute("msg", msg);
			}

		} else {

			msg = "이메일 형식을 지켜주세요.";
			model.addAttribute("msg", msg);
		}

		return "employee/duplicate";

	}

	@RequestMapping(value = "/ceo/register/duplicate2", method = RequestMethod.POST)
	public String duplicate2(HttpServletRequest req, Model model) {
		System.out.println(req.getParameter("c_bizNo"));
		Enumeration<String> enumeration = req.getParameterNames();
		String value = null;

		if (enumeration.hasMoreElements()) {
			value = enumeration.nextElement();
		}

		System.out.println(value);

		System.out.println();
		CompanyVo companyVo = employeeDao.selectByBizNo1(req.getParameter("c_bizNo"));
		String msg = null;
		Pattern pattern = Pattern.compile("^[0-9]{10}$");

		Matcher matcher = pattern.matcher(req.getParameter("c_bizNo"));
		if (matcher.find()) {
			if (companyVo != null) {
				msg = "존재하는 사업자번호입니다.";
				model.addAttribute("msg", msg);
			} else {
				msg = "사용가능한 사업자 번호입니다.";
				model.addAttribute("msg", msg);
			}
		} else {
			msg = "10자리 숫자로만 입력해주세요.";
			model.addAttribute("msg", msg);
		}
		return "employee/duplicate";
	}

	@RequestMapping(value = "/ceo/register/ccode", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody CompanyVo confirmCode(HttpServletRequest req) {

		CompanyVo companyVo = employeeDao.selectByCode(req.getParameter("c_code"));

		return companyVo;
	}

	////////////////////// 창대 info///////////////////////////////
	@RequestMapping(value = "/ceo/info")
	public String info(HttpSession session, Model model) throws IOException {

		if (session.getAttribute("userVo") == null) {
			return "redirect:/ceo";
		}
		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("userVo");
		
		//******************************************파일 inputstream******************************************
		File file = new File("/home/ubuntu/HaeBangPicture/"+employeeVo.getE_saveName());
		FileInputStream fis=new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		ByteArrayOutputStream bos=new ByteArrayOutputStream();
		int b;
		byte[] buffer = new byte[1024];
		while((b=bis.read(buffer))!=-1){
		   bos.write(buffer,0,b);
		}
		byte[] fileBytes = bos.toByteArray();
		fis.close();
		bos.close();


		byte[] encoded=Base64.encodeBase64(fileBytes);
		String encodedString = new String(encoded);

		model.addAttribute("image", encodedString);
		//******************************************파일 inputstream 끝******************************************
		
		
		
		CompanyVo companyVo = employeeDao.selectByNo(employeeVo.getC_no());
		model.addAttribute("employeeVo", employeeVo);
		model.addAttribute("companyVo", companyVo);
		return "employee/info";
	}

	@RequestMapping(value = "/ceo/info/update", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody HashMap<String, Object> updateEoC(HttpServletRequest request, HttpSession session,
			Model model) {

		EmployeeVo userVo = (EmployeeVo) session.getAttribute("userVo");
		employeeService.updateEoC(request, userVo);

		userVo = employeeDao.selectById(userVo);
		CompanyVo companyVo = employeeDao.selectByNo(userVo.getC_no());
		
		
		if (userVo.getE_type().equals("E")) {
			userVo.setE_type("직원");
		}

		if (userVo.getE_type().equals("O")) {
			userVo.setE_type("사장");
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("employeeVo", userVo);
		map.put("companyVo", companyVo);

		session.setAttribute("userVo", userVo);

		return map;

	}

	@RequestMapping(value = "/ceo/empInfo")
	public String empInfo(HttpSession session, Model model) throws IOException {

		if (session.getAttribute("userVo") == null) {
			return "redirect:/ceo";
		}

		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("userVo");
		List<EmployeeVo> employeeVoList = employeeDao.selectByCNo(employeeVo.getC_no());
		
		// ***************************** fileInputStream 파일 스프레드 ***************************************************
		for(int i =0; i<employeeVoList.size();i++)
		{
			
			
			File file = new File("/home/ubuntu/HaeBangPicture/"+employeeVoList.get(i).getE_saveName());
			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ByteArrayOutputStream bos=new ByteArrayOutputStream();
			
			int b;
			while((b=bis.read())!=-1){
			   bos.write(b);
			}
			byte[] fileBytes = bos.toByteArray();
			fis.close();
			bos.close();

			

			byte[] encoded=Base64.encodeBase64(fileBytes);
			String encodedString = new String(encoded);	
			employeeVoList.get(i).setEncodedString(encodedString);	
		}
		// ***************************** fileInputStream 파일 스프레드 ***************************************************
		model.addAttribute("employeeVo", employeeVo);
		model.addAttribute("employeeVoList", employeeVoList);

		return "employee/empInfo";
	}

	@Transactional
	@RequestMapping(value = "/ceo/empInfo/delete", method = RequestMethod.POST)
	public @ResponseBody List<EmployeeVo> empDelete(HttpSession session, Model model,
			@RequestParam(value = "e_no") int e_no) throws IOException {
		System.out.println(e_no);
		// 딜리트 만들기

		employeeDao.deleteEmployeeByNo(e_no);
		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("userVo");
		employeeDao.updateEmployeeCntM(employeeVo);

		List<EmployeeVo> employeeVoList = employeeDao.selectByCNo(employeeVo.getC_no());

		for(int i =0; i<employeeVoList.size();i++)
		{
			
			
			File file = new File("/home/ubuntu/HaeBangPicture/"+employeeVoList.get(i).getE_saveName());
			FileInputStream fis = new FileInputStream(file);
			ByteArrayOutputStream bos=new ByteArrayOutputStream();
			
			int b;
			byte[] buffer = new byte[1024];
			while((b=fis.read(buffer))!=-1){
			   bos.write(buffer,0,b);
			}
			byte[] fileBytes = bos.toByteArray();
			fis.close();
			bos.close();


			byte[] encoded=Base64.encodeBase64(fileBytes);
			String encodedString = new String(encoded);
			
			employeeVoList.get(i).setEncodedString(encodedString);	
		}
		
		model.addAttribute("employeeVoList", employeeVoList);

		return employeeVoList;
	}

	
	@RequestMapping(value = "/ceo/info/changePassword", method = RequestMethod.GET)
	public String changePassword(HttpSession session) {
		if (session.getAttribute("userVo") == null) {
			return "redirect:/ceo";
		}
		return "redirect:/ceo/info";
	}
	
	@RequestMapping(value = "/ceo/info/changePassword", method = RequestMethod.POST)
	public String changePassword(HttpSession session, Model model) {
		
		EmployeeVo userVo = (EmployeeVo) session.getAttribute("userVo");
		model.addAttribute("newEmployeeVo", new EmployeeVo());
		model.addAttribute("employeeVo", userVo);
		
		return "employee/changePasswordForm";
	}

	@RequestMapping(value = "/ceo/info/changingPassword", method = RequestMethod.GET)
	public String changingPassword(HttpSession session) {
		if (session.getAttribute("userVo") == null) {
			return "redirect:/ceo";
		}
		return "redirect:/ceo/info";
	}
	@RequestMapping(value = "/ceo/info/changingPassword", method = RequestMethod.POST)
	public String changingPassword( HttpSession session, EmployeeVo newEmployeeVo) {

		
		employeeService.changePassword(newEmployeeVo);
		
		EmployeeVo userVo = (EmployeeVo) session.getAttribute("userVo");
		
		userVo.setE_password(newEmployeeVo.getE_password());
		
		userVo = employeeDao.selectById(userVo);
		
		if (userVo.getE_type().equals("E")) {
			userVo.setE_type("직원");
		}

		if (userVo.getE_type().equals("O")) {
			userVo.setE_type("사장");
		}
		
		session.setAttribute("userVo", userVo);
		
		
		return "redirect:/ceo/info";
	}
	
	@RequestMapping(value="/ceo/info/updateBizNo", method = RequestMethod.GET)
	public String updateBizNo(HttpSession session, Model model) {
		if(session.getAttribute("userVo") == null)
		{
			return "redirect:/ceo";
		}
		EmployeeVo userVo = (EmployeeVo)session.getAttribute("userVo");
		model.addAttribute("companyVo", new CompanyVo());
		model.addAttribute("employeeVo", userVo);
		return "employee/changeBizNo";
	}
	
	@RequestMapping(value="/ceo/info/updateBizNo", method = RequestMethod.POST)
	public String updateBizNo(CompanyVo companyVo, Errors errors, HttpSession session, MultipartHttpServletRequest request) {
		new UpdateCompanyBizNoValidator().validate(companyVo, errors);
		EmployeeVo userVo = (EmployeeVo)session.getAttribute("userVo");
		companyVo.setC_no(userVo.getC_no());

		
			if (errors.hasErrors()) {
				return "employee/changeBizNo";
			}
			try {

				employeeService.updateBizNo(companyVo, request);
				return "redirect:/ceo/info";

			} catch (AlreadyExistingMemberException ex) {
				errors.rejectValue("c_bizNo", "duplicate");
				return "employee/changeBizNo";
			}
		
	}
	
	
	@RequestMapping(value = "/ceo/register/duplicate3", method = RequestMethod.POST)
	public String duplicate3(CompanyVo companyVo, Model model, HttpSession session) {
		
		EmployeeVo userVo = (EmployeeVo)session.getAttribute("userVo");
		companyVo.setC_no(userVo.getC_no());
		
		CompanyVo confirmVo = employeeDao.selectByBizNo2(companyVo);
		String msg = null;
		Pattern pattern = Pattern.compile("^[0-9]{10}$");

		Matcher matcher = pattern.matcher(companyVo.getC_bizNo());
		if (matcher.find()) {
			if (confirmVo != null) {
				msg = "존재하는 사업자번호입니다.";
				model.addAttribute("msg", msg);
			} else 
			{
				msg = "사용가능한 사업자 번호입니다.";
				model.addAttribute("msg", msg);
			}
		} else {
			msg = "10자리 숫자로만 입력해주세요.";
			model.addAttribute("msg", msg);
		}
		return "employee/duplicate";
	}
	
	
	@RequestMapping(value="/ceo/info/updateEmpPicture", method = RequestMethod.GET)
	public String updateEmpEmpPicture(HttpSession session, Model model) {
		if(session.getAttribute("userVo") == null)
		{
			return "redirect:/ceo";
		}
		EmployeeVo userVo = (EmployeeVo)session.getAttribute("userVo");
		model.addAttribute("employeeVo", userVo);
		return "employee/changeEmpPicture";
	}
	
	
	@RequestMapping(value="/ceo/info/updateEmpPicture", method = RequestMethod.POST)
	public String updateEmpPicture(HttpSession session, MultipartHttpServletRequest request) {
		EmployeeVo userVo = (EmployeeVo)session.getAttribute("userVo");

				employeeService.updateEmpPicture(userVo, request);
				
				
				
				userVo = employeeDao.selectById(userVo);
				
				if (userVo.getE_type().equals("E")) {
					userVo.setE_type("직원");
				}

				if (userVo.getE_type().equals("O")) {
					userVo.setE_type("사장");
				}
				
				session.setAttribute("userVo", userVo);
				
				
				return "redirect:/ceo/info";

		
	}
//	------------------------------------ 창대 11/25일작업 ----------------------------------------------
	// changeBizNo -> 주소를 updateBizNo 으로 바꿈!!
	
	@RequestMapping(value="/ceo/info/updateAddress", method = RequestMethod.GET)
	public String updateAddress(HttpSession session, Model model) {
		if(session.getAttribute("userVo") == null)
		{
			return "redirect:/ceo";
		}
		EmployeeVo userVo = (EmployeeVo)session.getAttribute("userVo");
		model.addAttribute("companyVo", new CompanyVo());
		model.addAttribute("employeeVo", userVo);
		return "employee/changeAddress";
	}
	
	@RequestMapping(value="/ceo/info/updateAddress", method = RequestMethod.POST)
	public String updateAddress(HttpSession session, HttpServletRequest request) {
		
		CompanyVo companyVo = new CompanyVo();
		companyVo.setC_address(request.getParameter("c_address")+""+request.getParameter("c_detailAddress"));
		EmployeeVo userVo = (EmployeeVo)session.getAttribute("userVo");
		companyVo.setC_no(userVo.getC_no());
		
		employeeDao.updateCompanyAddress(companyVo);
		
		return "redirect:/ceo/info";
	}
	
//	------------------------------------ 창대 11/25일 작업 종료! ----------------------------------------------
	
//	------------------------------------ 창대 11/29일 작업(지도 주문관련)  ----------------------------------------------
	
	
	@RequestMapping(value = "/ceo/selectAllmap", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<HashMap<String, Object>> selectAllmap(HttpSession session, Model model){
		
		EmployeeVo userVo = (EmployeeVo)session.getAttribute("userVo");
		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
		
		mapList = employeeDao.selectAllmap(userVo);
		
		model.addAttribute("mapList", mapList);
		System.out.println(mapList);
		System.out.println(mapList.size());
		return mapList;
	}
	
	
	// 11/30 창대 지도 관련 ajax 지도상에서 출발 눌렀을때
	@Transactional
	@RequestMapping(value = "/ceo/updateEOrderStatus", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody OrderEmployeeVo updateEOrderStatus(OrderEmployeeVo orderEmployeeVo, HttpSession session, Model model){

		employeeDao.updateEOrderStatus(orderEmployeeVo);
		
		OrderEmployeeVo newOne = employeeDao.selectEOrderByMoNo(orderEmployeeVo);
		System.out.println(newOne.getEo_status());
		
		return newOne;
	}
	
	
	
	
//  -------------------------------------- 진화 -------------------------------------------------
	
	@RequestMapping(value="/ceo", method=RequestMethod.GET)
	public ModelAndView main(HttpSession session) {
		CompanyVo companyVo;
		ModelAndView mav = new ModelAndView();

		if(session.getAttribute("userVo") !=null)
		{
			EmployeeVo userVo = (EmployeeVo)session.getAttribute("userVo");
			companyVo = employeeDao.selectByNo(userVo.getC_no());  // 창대 손 댐
			mav.addObject("companyVo",companyVo); // 창대 손 댐
		}
		
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
		
							
			CompanyVo companyVo = employeeDao.selectByNo(userVo.getC_no());  // 창대 손 댐
			mav.addObject("companyVo",companyVo); // 창대 손 댐
			List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
			
			mapList = employeeDao.selectAllmap(userVo);
			
			mav.addObject("mapList", mapList);
			
			return mav;
			
						
		} catch (IdPasswordNotMatchingException e) {			
			
			System.out.println("아이디패스워드낫매치드!");
			mav.addObject("errorMessage", "입력하신 회원 정보가 존재하지 않습니다");
			mav.setViewName("company_main/companymain");
			
			return mav;

		}
	
		
		
	}
	
	
	
	@RequestMapping(value="/ceoModal", method=RequestMethod.POST)
	public @ResponseBody EmployeeVo loginModalform(EmployeeVo employeeVo, HttpSession session) {	
		
		
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
		
		return userVo;
		
		} catch (IdPasswordNotMatchingException e) {			
			
		return null;
		
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
	
	@RequestMapping(value="/ceo/schedulelist", method=RequestMethod.POST)
	public @ResponseBody ScheduleVo calendarlistAjax (HttpServletRequest request, ModelAndView mav){
		
		ScheduleVo scheduleVo = new ScheduleVo(1, "주호네", "2017-11-25T15:00:00", "2017-11-25T15:30:00"); 
		
		System.out.println("컨트롤러 시작");	
				
		System.out.println(scheduleVo);
		
		return scheduleVo;
	}
		
	
	
	
	

	
	
	
	
	
	

}

