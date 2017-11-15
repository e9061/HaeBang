package net.haebang.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String mbManage(){
		System.out.println("MBManageController");
		return "admin/mbManage";
	}

	// 해방회원 조회
	@RequestMapping(value="/admin/mbList")
	public @ResponseBody List<MemberVo> mbList(){
		
		List<MemberVo> mList = service.memberList();
		
		return mList;
	}
	
	// 비회원 조회
	@RequestMapping(value="/admin/nMbList")
	public @ResponseBody List<MemberVo> nMbList(){
		
		List<MemberVo> nMbList = service.nMemberList();
		return nMbList;
	}

	
	// 회원 조건 검색
	@RequestMapping(value="/admin/mbSearched")
	public @ResponseBody List<MemberVo> mbSearched(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		MemberVo mvo = new MemberVo();
		
		String type = request.getParameter("type");
		String option = request.getParameter("option");
		String content = request.getParameter("content");
		
		System.out.println(type);
		mvo.setM_type(type);
		
		if(option.equals("m_id")) {
			mvo.setM_id(content);
		}else if(option.equals("m_name")) {
			mvo.setM_name(content);
		}else if(option.equals("m_phone")) {
			mvo.setM_phone(content);
		}else if(option.equals("m_no")) {
			int m_no = Integer.parseInt(content);
			mvo.setM_no(m_no);
		}
		
		List<MemberVo> mList = service.memberSelected(mvo);
		
		return mList;
	}
	
	
	
}
