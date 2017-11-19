package net.haebang.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import net.haebang.member.service.MemberService;
import net.haebang.vo.MemberVo;

@RequestMapping("/member")
@Controller
public class MemberController {

//	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService service;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm(Model model) {

		MemberVo Member = new MemberVo();
		model.addAttribute(Member);

		return "member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@Valid MemberVo Member) {

		service.insertMember(Member);

		return "redirect:/";
	}

	/*@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String selectOne(@PathVariable int m_no, Model model) {
		
		MemberVO memberVO = service.selectOneMember(m_no);
		
		model.addAttribute("memberVO", memberVO);
		
		System.out.println(m_no + "컨트롤러");
		
		
		return "member/myPage";
	}*/
	
	@RequestMapping(value= "/myPage", method=RequestMethod.GET)
	public String selectMyInfo(HttpServletRequest request, HttpServletResponse response) {
		
		//
		HttpSession session = request.getSession();
//		MemberVO member = (MemberVO)session.getAttribute("userVO");
		
		/*session.getAttribute("m_id");*/
		//int m_no = request.getParameter("m_no");
		MemberVo memberVO = (MemberVo)session.getAttribute("userVO");
		System.out.println(memberVO.getM_id());
		memberVO = service.selectOneMember(memberVO.getM_id()); 
		session.setAttribute("memberVO", memberVO);
		System.out.println("잘된다");
		return "member/myPage";
	}
	
	
	
	/*@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public ModelAndView myInfo(@PathVariable String m_id) {
				
		MemberVO member = new MemberVO();
		
		member = service.selectOneMember(m_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("userVO",member);		
		mav.setViewName("member/myPage");		

		return mav;
	}*/

	/*@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {

		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Valid MemberVO Member, HttpSession session, Model model) throws Exception {

		MemberVO userVO = new MemberVO();
		
		userVO = service.login(Member);
		
		String msg = "";

		model.addAttribute("userVO", userVO);
		session.setAttribute("userVO", userVO);
		
		if (userVO == null) {
			msg = "아이디 또는 패스워드가 잘못되었습니다.";
			return "member/login";
		}

		// 로그인 성공
		
		
		switch(userVO.getM_type()) {
		case "S" :
			msg = "관리자님 환영합니다";
			break;
		case "U" :
			msg = userVO.getM_id() + "님 환영합니다";
			break;
		}
		
		
		return "redirect:/";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session, SessionStatus sessionStatus) {

		// session.invalidate();
		sessionStatus.setComplete();

		return "redirect:/";
	}*/
	
	@RequestMapping(value = "/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}
	
	/*@RequestMapping(value = "/loginCheck")
	public ModelAndView loginCheck(@ModelAttribute MemberVO Member, HttpSession session) {
		
		boolean result = service.loginCheck(Member, session);
		ModelAndView mav = new ModelAndView();
		if (result == true) {
			mav.setViewName("home");
			mav.addObject("msg", "success");
			System.out.println("성공"+Member);
		} else {
			mav.setViewName("member/login");
			mav.addObject("msg", "failure");
			System.out.println("실패"+Member);
		}
		return mav;
	}*/
	
	/*public ModelAndView logout(HttpSession session) {
		
		service.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		mav.addObject("msg", "logout");
		
		return mav;
		
	}*/
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(MemberVo member, HttpSession session, Model model, HttpServletRequest request) {
		
		String m_id = request.getParameter("m_id");
		String m_password = request.getParameter("m_password");
		String m_name = request.getParameter("m_name");
		
		MemberVo userVO = new MemberVo();
		userVO.setM_id(m_id);
		userVO.setM_password(m_password);
		userVO.setM_name(m_name);
		
		userVO = service.login(member);
		
		if(userVO == null) {
			return "member/login";
		}
		
		session.setAttribute("userVO", userVO);
		model.addAttribute("userVO",userVO);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session, SessionStatus sessionStatus) {
		
		session.invalidate();
		/*sessionStatus.setComplete();*/
		
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/service")
	public String service() {
		
		
		
		return "member/service";
	}
	
}
