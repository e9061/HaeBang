package net.haebang.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.admin.service.AdminService;
import net.haebang.vo.NoticeBoardVo;

/**
 * 	 공지사항 게시판 - 관리자 
 * 	 소비자(n_type 'm') , 사업자('o')
 * 
 * 	 nowPage = 현재 페이지 값 
 * 	 word = 검색어
 * 	 searchCondition = 검색타입 (ex. 제목+내용) value = null or titleContent
 * 	 n_type = 사업자 'o' / 소비자 'm'  - admin_include - topmenu 에서 넘어옴
 * 
 * @author LEEJUHO
 *
 */
@Controller
@RequestMapping("/admin")
public class NoticeAdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/adminNotice")
	public ModelAndView notice(
			@RequestParam(value="n_type", required=false) String n_type, 
			@RequestParam(value="nowpage", defaultValue="0") int page,
            @RequestParam(value="word", required=false) String word, 
            @RequestParam(value="searchCondition", defaultValue="null", required=false) String searchCondition) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("n_type = " + n_type);
		
		// 페이징	
		List<NoticeBoardVo> getOwnerNoticeList = adminService.getOwnerNoticeList(n_type ,page, word, searchCondition);
		
		System.out.println("Controller : " + getOwnerNoticeList);
		 
		int totalPage = adminService.getLastPage(n_type, word, searchCondition);
		
		System.out.println("컨트롤러");
		System.out.println(word);
		System.out.println(searchCondition);
		System.out.println("totalPage :" + totalPage);
		
		// key 통일 - include 때문에
		mav.addObject("n_type", n_type);
		mav.addObject("nowpage", page);
		mav.addObject("totalpage", totalPage);				
		mav.addObject("noticelist", getOwnerNoticeList);
		mav.addObject("word", word);
		mav.addObject("titlecontent" ,searchCondition);
		mav.setViewName("admin/noticeAdmin");		
		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
		return mav;
	}

	
	@RequestMapping(value="/adminNoticeDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam("no") int no,
							   @RequestParam("n_viewCnt") int n_viewCnt	) {
		ModelAndView mav = new ModelAndView();
		n_viewCnt ++;
		
		NoticeBoardVo noticeBoardVo = new NoticeBoardVo();
		noticeBoardVo.setN_no(no);
		noticeBoardVo.setN_viewCnt(n_viewCnt);
		
		NoticeBoardVo noticeDetail = adminService.getNoticeBoardByNo(noticeBoardVo);
		System.out.println("*****************************************************************************");
		System.out.println(no + "  + "+ n_viewCnt);
		System.out.println("디테일 컨트롤러" + noticeDetail);
		System.out.println("*****************************************************************************");
		
		mav.addObject("noticeDetail", noticeDetail);
		mav.setViewName("admin/noticeDetailAdmin");		
		
		return mav;
	}
	// 글 수정  detail로 부터 no 받아서 get/post 커맨드객체 
	@RequestMapping(value="/adminRetouch", method = RequestMethod.GET)
	public ModelAndView noticeRetouch(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("n_no"));
		
		NoticeBoardVo noticeRetouch = adminService.getNoticeBoardByNo(no);
		mav.setViewName("admin/noticeRetouch");
		mav.addObject("noticeRetouch", noticeRetouch);
		System.out.println("*****************************************************************************");
		System.out.println("noticeRetouch GET GETGETGETGETGETGETGET");
		System.out.println(noticeRetouch);
		System.out.println("*****************************************************************************");
		
		return mav;
	}
	
	@RequestMapping(value="/adminRetouch", method = RequestMethod.POST)
	public String noticeRetouch(NoticeBoardVo noticeBoardVo, Model model) {
		
		System.out.println("*****************************************************************************");
		System.out.println("noticeRetouch POSTPOSTPOSTPOSTPOST");
		System.out.println(noticeBoardVo);
		System.out.println("*****************************************************************************");
		
		adminService.updateNotice(noticeBoardVo);
		System.out.println("*****************************************************************************");
		System.out.println(" 업데이트 완료 !!");
		System.out.println("*****************************************************************************");
		model.addAttribute("n_type", noticeBoardVo.getN_type());
		
		return "redirect:/admin/adminNotice";
	}
	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(HttpServletRequest request, Model model) {
		int no = Integer.parseInt(request.getParameter("n_no"));
		
		System.out.println("**************************************************************************************");
		System.out.println( no  + " 글 삭제 완료 !!");
		System.out.println("**************************************************************************************");
		adminService.noticeDelete(no);
		model.addAttribute("n_type", request.getParameter("n_type"));
		
		return "redirect:/admin/adminNotice";
	}
	
	
	
	// 공지 글 등록
	@RequestMapping(value = "/noticeWrite", method = RequestMethod.GET)
	public ModelAndView writeNotice(HttpServletRequest request) {
		
		String beforeNtype = request.getParameter("n_type");
		ModelAndView mav = new ModelAndView();
		NoticeBoardVo noticeBoardVo = new NoticeBoardVo();
		
		noticeBoardVo.setN_type(beforeNtype);
		System.out.println("writeNotice Controller");
		mav.addObject(noticeBoardVo);
		mav.addObject("beforeNtype",beforeNtype);
		mav.setViewName("admin/noticeWrite");
		
		return mav;
	}
	
	@RequestMapping(value = "/noticeWrite", method = RequestMethod.POST)
	public String writeNotice(NoticeBoardVo noticeBoardVo, Model model) {
		// 임시 - 추후 결정 session or 이대로 가는걸로
		noticeBoardVo.setN_writer("해방관리자");
		adminService.insertNotice(noticeBoardVo);
		
		model.addAttribute("n_type", noticeBoardVo.getN_type());
		
		return "redirect:/admin/adminNotice";
	}
	

	
 
}
