package net.haebang.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.admin.service.AdminService;
import net.haebang.admin.service.AdminServiceImpl;
import net.haebang.vo.MemberVo;

/**
 * 	정회원, 일반회원 관리 컨트롤러
 * @author LEEJUHO
 *
 */

@Controller
public class MBManageController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/admin/mbManage")
	public ModelAndView mbManage(){
		
		System.out.println("MBManageController");
		List<MemberVo> mList = service.memberList();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/mbManage");
		mav.addObject("mList",mList);
		
		return mav;
	}
	
/*
	@Autowired
	private AdminService service;
	
	
	
	@RequestMapping("/mbManage")
	public String mbManage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "admin/mbManage";
	}
	
	@RequestMapping("/mbManage2")	
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	  
		System.out.println("맴버관리2컨트롤러");
	
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
		      
	  // db 저장을 위한 dao에 데이터 전달
	    AdminService admin = new AdminServiceImpl();
	
	    List<MemberVo> list = admin.memberList();
	  
	    request.setAttribute("list", list);
	  
	    return "/admin/memberList.jsp";
	   }
*/

}
