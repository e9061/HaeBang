package net.haebang.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
						@RequestParam("phone3") String phone3, RedirectAttributes rttr,HttpServletResponse response) throws Exception{
		
		String m_phone = phone1 + phone2 + phone3;
		
		Member.setM_phone(m_phone);
		
		rttr.addFlashAttribute(service.insertMember(Member, response));

		return "redirect:/";
	}

   
	@RequestMapping(value= "/myPage", method=RequestMethod.GET)
	public ModelAndView selectMyInfo(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("!!!!!!!!!! selectMyInfo  !!!!!!!!!!!!!!!!!");
		HttpSession session = request.getSession();
		
		MemberVo memberVO = (MemberVo)session.getAttribute("userVO");
		memberVO = service.selectOneMember(memberVO.getM_id()); 
		session.setAttribute("memberVO", memberVO);
		// 접속 유저 아이디로 mypage 정보 가져오기
		MemberVo getMyPage = service.getMyPageInfo(memberVO.getM_id());
		System.out.println(getMyPage);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myPage");
		mav.addObject("getMyPage", getMyPage);
		return mav;
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
	public String prevLogin(MemberVo member, HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		
		String m_id = request.getParameter("m_id");
		String m_password = request.getParameter("m_password");
		String m_name = request.getParameter("m_name");
		
		MemberVo userVO = new MemberVo();
		userVO.setM_id(m_id);
		userVO.setM_password(m_password);
		userVO.setM_name(m_name);
		
		try {
		
		userVO = service.login(member, response);
		
		
		session.setAttribute("userVO", userVO);
		model.addAttribute("userVO",userVO);
		
		return "redirect:/";
		
		} catch (NoMemberException e) {
			
		model.addAttribute("ErrorMessage", "입력하신 회원 정보가 존재하지 않습니다.");
		return "member/prevLogin";
		
		}
		
	}
   
	@RequestMapping(value="/mainLogin", method=RequestMethod.POST)
	public String mainLogin(MemberVo member, HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		
		String m_id = request.getParameter("m_id");
		String m_password = request.getParameter("m_password");
		String m_name = request.getParameter("m_name");
		
		MemberVo userVO = new MemberVo();
		userVO.setM_id(m_id);
		userVO.setM_password(m_password);
		userVO.setM_name(m_name);
		try {
		
		userVO = service.mainLogin(member, response);
		session.setAttribute("userVO", userVO);
		model.addAttribute("userVO",userVO);
		
		return "index";
		
		} catch (NoMemberException e) {
			
		model.addAttribute("ErrorMessage", "입력하신 회원 정보가 존재하지 않습니다.");
		return "index";
		
		}
		
	}                     
	
   /*@RequestMapping(value="/member/modalLogin", method=RequestMethod.POST)
   public @ResponseBody MemberVo modalLogin(HttpSession session, Model model, HttpServletRequest request) {
	   
	   String m_id = request.getParameter("signin-email");
	   String m_password = request.getParameter("signin-password");
	   
	   MemberVo userVO = new MemberVo();
	   userVO.setM_id(m_id);
	   userVO.setM_password(m_password);
	   
	   try {
		   
		   userVO = service.login(userVO, response);
		   String phone = userVO.getM_phone();
		   int length = phone.length();
		   String first = phone.substring(0,3);
		   String second = "";
		   String third = "";
		   if(length==10) {
			   second = phone.substring(3, 6);
			   third = phone.substring(6, 10);
		   } else {
			   second = phone.substring(3, 7);
			   third = phone.substring(7, 11);
		   }
		   System.out.println(first+second+third);
		   session.setAttribute("userVO", userVO);
		   model.addAttribute("userVO",userVO);
//		   model.addAttribute("first", first);
//		   model.addAttribute("second", second);
//		   model.addAttribute("third", third);
		  
		   return userVO;
		   
	   } catch (NoMemberException e) {
		   
		   model.addAttribute("ErrorMessage", "입력하신 회원 정보가 존재하지 않습니다.");
		   return userVO;
	   }
	   
   }*/
   
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
                        @RequestParam("n_viewCnt") int n_viewCnt   ) {
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
   
   /************************************ 주호 myPage 수정 ***************************************************************************/
	
	@RequestMapping(value="/changeMyInfo", method=RequestMethod.GET)
	public String changeMyInfo (HttpServletRequest request) {
		
		System.out.println("!!!!!!!!!!!!!!!!!!!주호 myPage 수정 주호 myPage 수정 주호 myPage 수정 !!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		HttpSession session = request.getSession();
		MemberVo memberVO = (MemberVo)session.getAttribute("userVO");
		
		Map<String,Object> map = new HashMap<>();
		map.put("m_id", memberVO.getM_id());
		if( request.getParameter("m_phone") != null) {
			String m_phone = request.getParameter("m_phone");
			map.put("m_phone", m_phone);
		}else {
			String m_address = request.getParameter("m_address");
			String m_lon = request.getParameter("m_lon");
			String m_lat = request.getParameter("m_lat");
			String m_gu = request.getParameter("m_gu");
			
			map.put("m_address", m_address);
			map.put("m_lon", m_lon);
			map.put("m_lat", m_lat);
			map.put("m_gu", m_gu);
			
			
		}
		
		service.changeMyInfo(map);
		
		return "redirect:/member/myPage";
	}
	
	
	/**************************************** 주호 my reservation **************************************************************************/
	
	@RequestMapping(value= "/myReservation", method=RequestMethod.GET)
	public String myReservation (HttpServletRequest request) {
		
		return "/member/myReservation";
	}
	
	//접속 유저의 m_id로 예약리스트 받아오기
	@RequestMapping(value= "/myReservation", method=RequestMethod.POST)
	public @ResponseBody List<HashMap<String, Object>> myReservationList (HttpServletRequest request) {
		System.out.println("!!!!!!!!!! myReservation  !!!!!!!!!!!!!!!!!");
		
		HttpSession session = request.getSession();
		MemberVo memberVO = (MemberVo)session.getAttribute("userVO");
		
		//접속 유저의 m_id로 예약리스트 받아오기
		List<HashMap<String, Object>> getReservListByMNo = service.getReservListByMId(memberVO.getM_id());
		
		System.out.println(getReservListByMNo);
		return getReservListByMNo;
	}
	
	@RequestMapping(value="/myReservDetail", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> myReservDetail(HttpServletRequest request) throws IOException {
		
		int mo_no = Integer.parseInt(request.getParameter("mo_no"));
		
		// mo_no 의 callFlag 가져오기
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mo_no", mo_no);
		
		String mo_callFlag = service.getMoCallFlag(mo_no);
		
		map.put("mo_callFlag", mo_callFlag);
		System.out.println("**************************"+ mo_no + "/" + mo_callFlag +"*******************************");
		
		Map<String, Object> myReservDetail = service.myReservDetail(map);
		
		System.out.println(myReservDetail);
		
		
		//C:\Users\LEEJUHO\Desktop\KakaoTalk_Moim_1EiVYw3Lxudm7JUtLRbALFkiUqw7st
		
		// 			직원 사진 - 오류남...
	/*	
		File file = new File("/home/ubuntu/HaeBangPicture/"+myReservDetail.get("e_saveName"));			// 경로 배경화면으로 해서 해볼것
	//	File file = new File("/home/ubuntu/HaeBangPicture/"+myReservDetail.get("e_saveName"));
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
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("empPicture",encodedString);
		mav.setViewName("/member/myReservation");
	*/	
		
		
//		myReservDetail.put("empPicture", encodedString);
		
		
		
		
	//	System.out.println("**************************"+ myReservDetail +"*******************************");
		
		return myReservDetail;
	}
	
	// service 취소 컨트롤러 - mo_orderNo에 해당하는 모든 서비스list 삭제
	@RequestMapping(value="/cancleService", method=RequestMethod.GET)
	public String cancleService(HttpServletRequest request) {
		String mo_orderNo = request.getParameter("mo_orderNo");
		service.cancleServiceByOdNo(mo_orderNo);
		return "redirect:/member/myReservation";
	}
	
	// 일정 변경 (보장형 & 정기형 - 해당 스케쥴만)
	@RequestMapping(value="/changeDate", method=RequestMethod.GET)
	public String changeDate(HttpServletRequest request) {
		
		String mo_orderNo = request.getParameter("mo_orderNo");
		String mo_startTime = request.getParameter("mo_startTime");
		String mo_freqType = request.getParameter("mo_freqType");		// W,M ,I 
		
		int s_duration = 0; 
		int mo_cnt = 0;
		int mo_total = 0;
		int mo_freqCycle = 0;
		
		if(request.getParameter("s_duration") != null) {				
			 s_duration = Integer.parseInt(request.getParameter("s_duration")); 
		}
		
		if(request.getParameter("mo_freqCycle") != null) {				// 1,2,3~~
			mo_freqCycle = Integer.parseInt(request.getParameter("mo_freqCycle"));
		}
		
		if(request.getParameter("mo_cnt") != null) {
			mo_cnt = Integer.parseInt(request.getParameter("mo_cnt"));
		}
		if(request.getParameter("mo_total") != null) {
			mo_total = Integer.parseInt(request.getParameter("mo_total"));
		}
		System.out.println("**************************changeDate*******************************");
		System.out.println(mo_orderNo + "//" + mo_startTime + "//" + mo_cnt + "//" + mo_total + "//" + s_duration);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mo_orderNo", mo_orderNo);
		map.put("mo_freqType", mo_freqType);
		map.put("s_duration", s_duration);
		
		
		
		if(mo_total == 0) {
			if(mo_cnt == 0) {			// 보장형
				map.put("mo_startTime", mo_startTime);
				System.out.println(map);
				service.changeDate(map);
			}else {						// 정기형 - 해당 스케쥴만 
				map.put("mo_startTime", mo_startTime);
				map.put("mo_cnt", mo_cnt);
				System.out.println(map);
				service.changeDate(map);
			}
		}else{								// 정기형 - 해당 관련 서비스 스케쥴 모두 변경
			
			System.out.println("돌아야할 횟수: "+ (mo_total - mo_cnt));												// 2     3,4,5
			
			
			String year = mo_startTime.substring(0, 4);
			String month= mo_startTime.substring(5, 7);
			String day = mo_startTime.substring(8, 10);
			
			String time = mo_startTime.substring(11, 16);
			
			System.out.println(year + "," + month + "," + day + ","+time);
			
			Calendar c = Calendar.getInstance();
			c.set(Calendar.YEAR, Integer.parseInt(year));
			c.set(Calendar.MONTH, Integer.parseInt(month)-1);
			c.set(Calendar.DATE, Integer.parseInt(day));	
			
			System.out.println(c.getTime());
			System.out.println(mo_freqCycle);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			int cnt = mo_cnt;
			
			for(int i = mo_cnt; i<mo_total+1; i++) {
				
				
				if(mo_freqType.equals("m") || mo_freqType.equals("M")) {
					
					if(i==cnt) {								// 첫번째
						map.put("mo_cnt", i);
						map.put("mo_startTime", mo_startTime);
						
					}else {									// 두번째 부터 ~ 끝까지
						
						map.put("mo_cnt", i);
						
						c.add(Calendar.MONTH, mo_freqCycle);						// 여기서 안됨 !!!!!! 뭐지 !!  java.lang.IllegalArgumentException: Cannot format given Object as a Date
						
						mo_startTime = sdf.format(c.getTime()) + " " + time;				// endTime 할때 여기서 넣을 것
						
						System.out.println("mo_startTime "+ i+"번째 바퀴" + mo_startTime);
						map.put("mo_startTime", mo_startTime);
						
					}
					
					
					
				} else {
					
					if(i==cnt) {								// 첫번째
						map.put("mo_cnt", i);
						map.put("mo_startTime", mo_startTime);
						
					}else {									// 두번째 부터 ~ 끝까지
						
						map.put("mo_cnt", i);
						c.add(Calendar.DATE, 7*mo_freqCycle);
						
						mo_startTime = sdf.format(c.getTime()) + " " + time;				// endTime 할때 여기서 넣을 것
						
						System.out.println("mo_startTime "+ i+"번째 바퀴" + mo_startTime);
						map.put("mo_startTime", mo_startTime);
						
					}
					
					
					
				}
				
				
				
				System.out.println(mo_cnt);
				
				
				service.changeDate(map);
				System.out.println(map);
				mo_cnt++;
			}
			
			
		}
		
			System.out.println("업뎃 완료 !!!!");
		return "redirect:/member/myReservation";
	}
	
	/**************************************** 주호 my reservation **************************************************************************/
   
	// 회원 인증
		@RequestMapping(value = "/approval_member", method = RequestMethod.POST)
		public String approval_member(@ModelAttribute MemberVo member, HttpServletResponse response) throws Exception{
			service.approval_member(member, response);
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다.');");
			out.println("</script>");
			
			return "/";
		}
   
      
}