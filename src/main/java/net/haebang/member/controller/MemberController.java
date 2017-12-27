package net.haebang.member.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.exception.NoMemberException;
import net.haebang.member.dao.MemberDao;
import net.haebang.member.service.MemberService;
import net.haebang.user.service.SrvService;
import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;
import net.haebang.vo.ServiceVo;

@Controller
public class MemberController {

   @Autowired
   private MemberService service;
   
   @Autowired
   private MemberDao dao;
   
   @Autowired
   private SrvService srvService;

	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public String joinForm(Model model) {

		MemberVo member = new MemberVo();
		model.addAttribute("member",member);

		return "member/join";
	}

	@RequestMapping(value = "/member/join", method = RequestMethod.POST)
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

   
	@RequestMapping(value = "/member/myPage", method=RequestMethod.GET)
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
   
   
   
   
   
	@RequestMapping(value = "/member/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}
	
	@RequestMapping(value = "/member/bloginForm", method=RequestMethod.GET)
	public String bloginForm() {
		return "member/blogin";
	}
	@RequestMapping(value = "/member/prevLoginForm", method=RequestMethod.GET)
	public String prevLoginForm() {
		return "member/prevLogin";
	}
   
   
	@RequestMapping(value = "/member/prevLogin", method=RequestMethod.POST)
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
   
	@RequestMapping(value = "/member/mainLogin", method=RequestMethod.POST)
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
	
	   @RequestMapping(value = "/member/modalLogin", method=RequestMethod.POST)
	   public @ResponseBody MemberVo modalLogin(HttpSession session, HttpServletRequest request) {
		   
		   String m_id = request.getParameter("signin-email");
		   String m_password = request.getParameter("signin-password");
		   
		   MemberVo userVO = new MemberVo();
		   userVO.setM_id(m_id);
		   userVO.setM_password(m_password);
		   
		   try {
			   
			   userVO = service.login(userVO);
			   session.setAttribute("userVO", userVO);
		   
			   return userVO;
			   
		   } catch (NoMemberException e) {
			   
			   return null;
			   
		   }
		   
		 
		   
	   }
   
   @RequestMapping(value = "/member/blogin", method=RequestMethod.POST)
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
   
   @RequestMapping(value = "/member/logout")
   public String logout(HttpSession session, SessionStatus sessionStatus) {
      
      session.invalidate();
      /*sessionStatus.setComplete();*/
      
      
      return "redirect:/";
   }
   
   @RequestMapping(value = "/member/service")
   public String service() {
      
      
      
      return "member/service";
   }
   
   @RequestMapping(value = "/member/duplicate1", method = RequestMethod.POST)
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
   
/*   @RequestMapping(value = "/{m_id}", method = RequestMethod.GET)
   public String updateForm(Model model) {

      MemberVo member = new MemberVo();

      model.addAttribute("member", member);

      return "member/update";
   }*/

/*   @RequestMapping(value = "/{m_id}", method = RequestMethod.PUT)
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
   }*/
   
   
   /********************************************** 공지사항 ***********************************************************/
   

   @RequestMapping("/member/memberNotice")
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
   
   @RequestMapping(value = "/member/memberNoticeDetail", method = RequestMethod.GET)
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
	
	@RequestMapping(value = "/member/changeMyInfo", method=RequestMethod.GET)
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
	
	@RequestMapping(value = "/member/myReservation", method=RequestMethod.GET)
	public String myReservation (HttpServletRequest request) {
		
		return "/member/myReservation";
	}
	
	//접속 유저의 m_id로 예약리스트 받아오기
	@RequestMapping(value = "/member/myReservation", method=RequestMethod.POST)
	public @ResponseBody List<HashMap<String, Object>> myReservationList (HttpServletRequest request) {
		System.out.println("!!!!!!!!!! myReservation  !!!!!!!!!!!!!!!!!");
		
		HttpSession session = request.getSession();
		MemberVo memberVO = (MemberVo)session.getAttribute("userVO");
		
		//접속 유저의 m_id로 예약리스트 받아오기
		List<HashMap<String, Object>> getReservListByMNo = service.getReservListByMId(memberVO.getM_id());
		
		System.out.println(getReservListByMNo);
		return getReservListByMNo;
	}
	
	@RequestMapping(value = "/member/myReservDetail", method=RequestMethod.POST)
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
	@RequestMapping(value = "/member/cancleService", method=RequestMethod.GET)
	public String cancleService(HttpServletRequest request) {
		String mo_orderNo = request.getParameter("mo_orderNo");
		service.cancleServiceByOdNo(mo_orderNo);
		return "redirect:/member/myReservation";
	}
	
	// 일정 변경 (보장형 & 정기형 - 해당 스케쥴만)
	@RequestMapping(value = "/member/changeDate", method=RequestMethod.GET)
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
   
   
	
	
	@RequestMapping(value = "/member/orderAddSchedule", method = RequestMethod.POST)
	public ModelAndView addschedule(
			@RequestParam("name") String name, 
			@RequestParam("postcode") String postcode,
			@RequestParam("address") String address, 
			@RequestParam("detailAddress") String detailAddress,
			@RequestParam("phone1") String phone1, 
			@RequestParam("phone2") String phone2,
			@RequestParam("phone3") String phone3, 
			@RequestParam(value = "service1") String service,
			@RequestParam(value = "date1") String date1,
			@RequestParam(value = "startTimeHour1") String startTimeHour1,
			@RequestParam(value = "startTimeMinute1") String startTimeMinute1,
			@RequestParam(value = "comments", defaultValue = "null", required = false) String comment,
			@RequestParam(value = "lon", defaultValue = "null", required = false) String m_lon,
			@RequestParam(value = "lat", defaultValue = "null", required = false) String m_lat, 
			@RequestParam(value = "m_gu", defaultValue = "null", required = false) String m_gu, 
			@RequestParam(value = "card-company-list", defaultValue = "null", required = false) String cardCompany, 
			@RequestParam(value = "cardNo1", defaultValue = "null", required = false) String cardNo1, 
			@RequestParam(value = "cardNo2", defaultValue = "null", required = false) String cardNo2, 
			@RequestParam(value = "cardNo3", defaultValue = "null", required = false) String cardNo3, 
			@RequestParam(value = "cardNo4", defaultValue = "null", required = false) String cardNo4, 
			@RequestParam(value = "card-holder", defaultValue = "null", required = false) String cardHolder, 
			@RequestParam(value = "card-expiration-month", defaultValue = "null", required = false) String expMonth, 
			@RequestParam(value = "card-expiration-year", defaultValue = "null", required = false) String expYear, 
			@RequestParam(value = "cardCVC", defaultValue = "null", required = false) String cardCVC,
			ModelAndView mav,
			HttpServletRequest request, HttpSession session) {

		String[] insect= (String[]) session.getAttribute("bugs");

		String fullAddress = address + detailAddress;
		String phone = phone1 + phone2 + phone3;
		String cardNo=cardNo1+cardNo2+cardNo3+cardNo4;
		String cardExp=expMonth+expYear;
		String comments = "고객기피해충 :"+Arrays.toString(insect) +"\n고객메모 :"+ comment;
		
		int s_no = Integer.parseInt(service);
		
		ServiceVo selectedService = srvService.getServiceInfo(s_no);
		
		if (selectedService.getS_freqType().equals("I") || selectedService.getS_freqType().equals("i")) {
	
			Calendar cal = Calendar.getInstance();
			int a = Integer.parseInt(startTimeHour1);
			int b = Integer.parseInt(startTimeMinute1);
			cal.set(Calendar.HOUR_OF_DAY, a);
			cal.set(Calendar.MINUTE, b+selectedService.getS_duration());

			int hour = cal.get(Calendar.HOUR);
			int hourLength = (int)(Math.log10(hour)+1);
			String endTimeHour1 = "";
			
			if(hourLength<2) {
				
				endTimeHour1 = "0"+String.valueOf(hour);
				
			}else {
				
				endTimeHour1 = String.valueOf(hour);
				
			}
			
			String endTimeMinute1 = String.valueOf(cal.get(Calendar.MINUTE));
			
			String startTime1 = date1 + "T" + startTimeHour1 + ":" + startTimeMinute1 + ":00.000";
			String endTime1 = date1 + "T" + endTimeHour1 + ":" + endTimeMinute1 + ":00.000";			
			
			System.out.println(endTime1);
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("name", name);
			paramMap.put("address", fullAddress);
			paramMap.put("phone", phone);
			paramMap.put("service", s_no);
			paramMap.put("orderNo_date", date1);
			paramMap.put("orderNo_startHour", startTimeHour1);
			paramMap.put("orderNo_startMinute", startTimeMinute1);
			paramMap.put("startTime", startTime1);
			paramMap.put("endTime", endTime1);				
			paramMap.put("unit", selectedService.getS_freqType());
			paramMap.put("cnt", 1);
			paramMap.put("comments", comments);
			paramMap.put("lon", m_lon);
			paramMap.put("lat", m_lat);
			paramMap.put("lat", m_gu);
			paramMap.put("cardCo", cardCompany);
			paramMap.put("cardNo", cardNo);
			paramMap.put("cardHolder", cardHolder);
			paramMap.put("cardExp", cardExp);
			paramMap.put("cardCVC", cardCVC);

			srvService.insertScheduleByOnetime(paramMap);

		}

		else { //정기성

			
			Calendar cal = Calendar.getInstance();
			int a = Integer.parseInt(startTimeHour1);
			int b = Integer.parseInt(startTimeMinute1);
			cal.set(Calendar.HOUR_OF_DAY, a);
			cal.set(Calendar.MINUTE, b+selectedService.getS_duration());

			int hour = cal.get(Calendar.HOUR);
			int hourLength = (int)(Math.log10(hour)+1);
			String endTimeHour1 = "";
			
			if(hourLength<2) {
				
				endTimeHour1 = "0"+String.valueOf(hour);
				
			}else {
				
				endTimeHour1 = String.valueOf(hour);
				
			}
			
			String endTimeMinute1 = String.valueOf(cal.get(Calendar.MINUTE));
			
			String startTime1 = date1 + "T" + startTimeHour1 + ":" + startTimeMinute1 + ":00.000";
			String endTime1 = date1 + "T" + endTimeHour1 + ":" + endTimeMinute1 + ":00.000";			
			
			System.out.println(endTime1);
			
			
			int cycle = selectedService.getS_freqCycle();
			int totalCnt = selectedService.getS_total();

			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("name", name);
			paramMap.put("address", fullAddress);
			paramMap.put("phone", phone);
			paramMap.put("service", s_no);			
			paramMap.put("comments", comments);
			paramMap.put("cycle", cycle);
			paramMap.put("total", totalCnt);
			paramMap.put("orderNo_date", date1);
			paramMap.put("orderNo_startHour", startTimeHour1);
			paramMap.put("orderNo_startMinute", startTimeMinute1);
			paramMap.put("lon", m_lon);
			paramMap.put("lat", m_lat);
			paramMap.put("lat", m_gu);
			paramMap.put("cardCo", cardCompany);
			paramMap.put("cardNo", cardNo);
			paramMap.put("cardHolder", cardHolder);
			paramMap.put("cardExp", cardExp);
			paramMap.put("cardCVC", cardCVC);


			Map<String, Object> scheduleMap;
			List<Map<String, Object>> scheduleList = new ArrayList<Map<String, Object>>();

			String year = date1.substring(0, 4);
			String month = date1.substring(5, 7);
			String day = date1.substring(8, 10);

			Calendar c = Calendar.getInstance();
			c.set(Calendar.YEAR, Integer.parseInt(year));
			c.set(Calendar.MONTH, Integer.parseInt(month) - 1);
			c.set(Calendar.DATE, Integer.parseInt(day));


			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (selectedService.getS_freqType().equals("W") || selectedService.getS_freqType().equals("w")) {

				paramMap.put("unit", selectedService.getS_freqType());

				for (int i = 0; i < totalCnt; i++) {

					if (i == 0) {
						System.out.println(i);

						scheduleMap = new HashMap<String, Object>();

						scheduleMap.put("cnt", i + 1);
						scheduleMap.put("startTime", startTime1);
						scheduleMap.put("endTime", endTime1);

						scheduleList.add(scheduleMap);
						System.out.println("1일때:" + scheduleList);

					} else {
						
						System.out.println(i);
						scheduleMap = new HashMap<String, Object>();
						scheduleMap.put("cnt", i + 1);
						c.add(Calendar.DATE, cycle * 7);

						String startTimeCycle = sdf.format(c.getTime()) + "T" + startTimeHour1 + ":" + startTimeMinute1
								+ ":000";
						String endTimeCycle = sdf.format(c.getTime()) + "T" + endTimeHour1 + ":" + endTimeMinute1
								+ ":000";

						scheduleMap.put("startTime", startTimeCycle);
						scheduleMap.put("endTime", endTimeCycle);

						scheduleList.add(scheduleMap);
						System.out.println(scheduleList);

					}

				}


				paramMap.put("scheduleList", scheduleList);

				Set<String> keys = paramMap.keySet();
				for (String key : keys) {
					System.out.println(key + " : " + paramMap.get(key));
				}

			}

			if (selectedService.getS_freqType().equals("M") || selectedService.getS_freqType().equals("m")) {
			

				paramMap.put("unit", selectedService.getS_freqType());

				for (int i = 0; i < totalCnt; i++) {

					if (i == 0) {
						System.out.println(i);

						scheduleMap = new HashMap<String, Object>();

						scheduleMap.put("cnt", i + 1);
						scheduleMap.put("startTime", startTime1);
						scheduleMap.put("endTime", endTime1);

						scheduleList.add(scheduleMap);
						System.out.println("1일때:" + scheduleList);

					} else {
						System.out.println(i);
						scheduleMap = new HashMap<String, Object>();
						scheduleMap.put("cnt", i + 1);
						c.add(Calendar.MONTH, cycle);

						String startTimeCycle = sdf.format(c.getTime()) + "T" + startTimeHour1 + ":" + startTimeMinute1
								+ ":000";
						String endTimeCycle = sdf.format(c.getTime()) + "T" + endTimeHour1 + ":" + endTimeMinute1
								+ ":000";

						scheduleMap.put("startTime", startTimeCycle);
						scheduleMap.put("endTime", endTimeCycle);

						scheduleList.add(scheduleMap);
						System.out.println(scheduleList);

					}

				}


				paramMap.put("scheduleList", scheduleList);

				Set<String> keys = paramMap.keySet();
				for (String key : keys) {
					System.out.println(key + " : " + paramMap.get(key));
				}

			}

			srvService.insertSchedule(paramMap);
			System.out.println(paramMap);
		}

		mav.setViewName("index");

		return mav;
	}
   
      
}