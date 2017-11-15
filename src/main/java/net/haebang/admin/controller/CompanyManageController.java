package net.haebang.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.haebang.admin.service.AdminService;
import net.haebang.vo.CompanyVo;

/**
 * 	해방업체, 일반업체 관리 컨트롤러
 * @author LEEJUHO
 *
 */

@Controller
public class CompanyManageController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/admin/companyManage")
	public String companyManage(){
		System.out.println("CompanyManageController");
		return "admin/companyManage";
	}
	

	// 해방업체 조회
	@RequestMapping(value="/admin/hbCompanyManage")
	public @ResponseBody List<CompanyVo> hbComList(){
		
		List<CompanyVo> hbComList = service.hbComList();
		System.out.println(hbComList);
		return hbComList;
	}
	
	// 일반업체 조회
	@RequestMapping(value="/admin/nCompanyManage")
	public @ResponseBody List<CompanyVo> nComList(){
		
		List<CompanyVo> nComList = service.nComList();
		return nComList;
	}
	
	
	// 조건 검색
	@RequestMapping(value="/admin/searchCompany", method=RequestMethod.POST)
	public @ResponseBody List<CompanyVo> searchCom(HttpServletRequest request) {
		CompanyVo cvo = new CompanyVo();
		List<CompanyVo> searchComList = null; 
		
		String comType = request.getParameter("type");
		String voType = request.getParameter("vo");
		String content = request.getParameter("content");
		
		System.out.println(comType);
		System.out.println(content);
		
		if(comType.equals("h")){
			System.out.println("해방업체 탐");
			if(voType.equals("c_code")) {
				cvo.setC_code(content);
			}else if(voType.equals("c_name")) {
				cvo.setC_name(content);
			}else if(voType.equals("c_address")) {
				cvo.setC_address(content);
			}else if(voType.equals("c_bizNo")) {
				cvo.setC_bizNo(content);
			}
			searchComList = service.searchHbComList(cvo);
		}else{
			System.out.println("일반업체 탐");
			if(voType.equals("c_code")) {
				cvo.setC_code(content);
			}else if(voType.equals("c_name")) {
				cvo.setC_name(content);
			}else if(voType.equals("c_address")) {
				cvo.setC_address(content);
			}else if(voType.equals("c_bizNo")) {
				cvo.setC_bizNo(content);
			}
			searchComList = service.searchNComList(cvo);
		}
		
		return searchComList;
		
	}
	

}
