package net.haebang.member.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.exception.NoMemberException;
import net.haebang.member.dao.MemberDao;
import net.haebang.member.service.MemberService;
import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;

@RequestMapping("/member")
@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@Autowired
	MemberDao dao;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm(Model model) {

		MemberVo member = new MemberVo();
		model.addAttribute("member",member);

		return "member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@Valid MemberVo Member, 
						@RequestParam("m_name") String m_name,
						@RequestParam("m_id") String m_id,
						@RequestParam("m_password") String m_password,
						@RequestParam("m_confirm") String m_confirm,
						@RequestParam("phone1") String phone1, 
						@RequestParam("phone2") String phone2, 
						@RequestParam("phone3") String phone3) {
		
		String m_phone = phone1 + phone2 + phone3;
		
		Member.setM_phone(m_phone);
		
		service.insertMember(Member);

		return "redirect:/";
	}

	
	@RequestMapping(value= "/myPage/{m_id}", method=RequestMethod.GET)
	public String selectMyInfo(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		MemberVo memberVO = (MemberVo)session.getAttribute("userVO");
		System.out.println(memberVO.getM_id());
		memberVO = service.selectOneMember(memberVO.getM_id()); 
		session.setAttribute("memberVO", memberVO);
		System.out.println("잘된다");
		return "member/myPage";
	}
	
	
	
	
	
	@RequestMapping(value = "/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}
	
	@RequestMapping(value= "/bloginForm", method=RequestMethod.GET)
	public String bloginForm() {
		return "member/blogin";
	}
	@RequestMapping(value= "/prevLoginForm", method=RequestMethod.GET)
	public String prevLoginForm() {
		return "member/prevLogin";
	}
	
	
	@RequestMapping(value="/prevLogin", method=RequestMethod.POST)
	public String prevLogin(MemberVo member, HttpSession session, Model model, HttpServletRequest request) {
		
		String m_id = request.getParameter("m_id");
		String m_password = request.getParameter("m_password");
		String m_name = request.getParameter("m_name");
		
		MemberVo userVO = new MemberVo();
		userVO.setM_id(m_id);
		userVO.setM_password(m_password);
		userVO.setM_name(m_name);
		
		try {
		
		userVO = service.login(member);
		
		
				
		session.setAttribute("userVO", userVO);
		model.addAttribute("userVO",userVO);
		
		return "redirect:/";
		
		} catch (NoMemberException e) {
			
		model.addAttribute("ErrorMessage", "입력하신 회원 정보가 존재하지 않습니다.");
		return "member/prevLogin";
		
		}
		
	}
	
	@RequestMapping(value="/mainLogin", method=RequestMethod.POST)
	public String mainLogin(MemberVo member, HttpSession session, Model model, HttpServletRequest request) {
		
		String m_id = request.getParameter("m_id");
		String m_password = request.getParameter("m_password");
		String m_name = request.getParameter("m_name");
		
		MemberVo userVO = new MemberVo();
		userVO.setM_id(m_id);
		userVO.setM_password(m_password);
		userVO.setM_name(m_name);
		
		try {
		
		userVO = service.login(member);
		
		
				
		session.setAttribute("userVO", userVO);
		model.addAttribute("userVO",userVO);
		
		return "redirect:/";
		
		} catch (NoMemberException e) {
			
		model.addAttribute("ErrorMessage", "입력하신 회원 정보가 존재하지 않습니다.");
		return "index";
		
		}
		
	}
	
	@RequestMapping(value="/blogin", method=RequestMethod.POST)
	public String blogin(MemberVo member, HttpSession session, Model model, HttpServletRequest request) {
		
		String m_password = request.getParameter("m_password");
		String m_name = request.getParameter("m_name");
		String m_phone = request.getParameter("m_phone");
		
		MemberVo userVO = new MemberVo();
		userVO.setM_password(m_password);
		userVO.setM_name(m_name);
		userVO.setM_phone(m_phone);
		
		
		try {
		
		userVO = service.blogin(member);
		
		
				
		session.setAttribute("userVO", userVO);
		model.addAttribute("userVO",userVO);
		
		return "redirect:/";
		
		} catch (NoMemberException e) {
			
		model.addAttribute("ErrorMessage", "입력하신 회원 정보가 존재하지 않습니다.");
		return "member/blogin";
		
		}
		
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
	
	@RequestMapping(value = "/duplicate1", method = RequestMethod.POST)
	public String duplicate1(HttpServletRequest req, Model model) {
		System.out.println(req.getParameter("m_id"));
		MemberVo memberVo = dao.selectById(req.getParameter("m_id"));
		String msg = null;
		

		// Pattern pattern = Pattern.compile("[0-9].[a-zA-Z].{6,14}$");
		Pattern pattern1 = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
				"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
		
		Matcher matcher = pattern1.matcher(req.getParameter("m_id"));
		System.out.println(matcher);
		if (matcher.find()) {
			if (memberVo != null) {
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

		return "member/duplicate";

	}
	
	@RequestMapping(value = "/{m_id}", method = RequestMethod.GET)
	public String updateForm(Model model) {

		MemberVo member = new MemberVo();

		model.addAttribute("member", member);

		return "member/update";
	}

	@RequestMapping(value = "/{m_id}", method = RequestMethod.PUT)
	public String update(@Valid MemberVo member,
			@RequestParam("m_name") String m_name,
			@RequestParam("m_id") String m_id,
			@RequestParam("m_password") String m_password,
			@RequestParam("m_confirm") String m_confirm,
			@RequestParam("phone1") String phone1, 
			@RequestParam("phone2") String phone2, 
			@RequestParam("phone3") String phone3,
			@RequestParam("m_address") String m_address,
			@RequestParam("m_owner") String m_owner,
			@RequestParam("m_cardNo") String m_cardNo,
			@RequestParam("m_cardCVC") String m_cardCVC
			) {
		
		String m_phone = phone1 + phone3 + phone2;
		
		member.setM_phone(m_phone);
		service.updateMember(member);
		System.out.println(member+"컨");
		return "redirect:/member/myPage/" + m_id;
	}
	
	
	/********************************************** 공지사항 ***********************************************************/
	

	@RequestMapping("/memberNotice")
	public ModelAndView notice(
			@RequestParam(value="n_type", required=false) String n_type, 
			@RequestParam(value="nowpage", defaultValue="0") int page,
            @RequestParam(value="word", required=false) String word, 
            @RequestParam(value="searchCondition", defaultValue="null", required=false) String searchCondition) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("************************************************************************");
		System.out.println("!!!!!!!!!!!!!!!memberNotice!!!!!!!!!!");
		System.out.println(n_type + "  + " + page + "  + " + word +  "  + " + searchCondition);
		System.out.println("************************************************************************");
		
		// 페이징	
		List<NoticeBoardVo> getNoticeList = service.getNoticeList(n_type ,page, word, searchCondition);
		int totalPage = service.getLastPage(n_type, word, searchCondition);
		
		// key 통일 - include 때문에
		mav.addObject("n_type", n_type);
		mav.addObject("nowpage", page);
		mav.addObject("totalpage", totalPage);				
		mav.addObject("noticelist", getNoticeList);
		mav.addObject("word", word);
		mav.addObject("titlecontent" ,searchCondition);
		mav.setViewName("member/noticeMember");		
		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
		return mav;
	}
	
	@RequestMapping(value="/memberNoticeDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam("no") int no,
							   @RequestParam("n_viewCnt") int n_viewCnt	) {
		System.out.println("********************************************************************");
		System.out.println("!!!!!!!!!!!!!!!memberNoticeDetail!!!!!!!!!!");
		System.out.println("************************************************************************");		
		ModelAndView mav = new ModelAndView();
		n_viewCnt ++;
		
		NoticeBoardVo noticeBoardVo = new NoticeBoardVo();
		noticeBoardVo.setN_no(no);
		noticeBoardVo.setN_viewCnt(n_viewCnt);
		
		NoticeBoardVo noticeDetail = service.getNoticeBoardByNo(noticeBoardVo);
		
		mav.addObject("noticeDetail", noticeDetail);
		mav.setViewName("member/noticeDetailMember");		
		System.out.println("********************************************************************");
		System.out.println("!!!!!!!!!!!!!!!"+noticeDetail+"!!!!!!!!!!");
		System.out.println("************************************************************************");		
		
		return mav;
	}	
	
	/**********************************************************************************************************************/
	
	
	
	
	
		
}
