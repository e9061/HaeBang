package net.haebang.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.haebang.admin.service.AdminService;
import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;

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
	public @ResponseBody List<HashMap<String, Object>> hbComList(){
		
		List<HashMap<String, Object>> hbComList = new ArrayList<HashMap<String, Object>>();
		hbComList = service.hbComList();
		
		return hbComList;
	}
	
	// 일반업체 조회
	@RequestMapping(value="/admin/nCompanyManage")
	public @ResponseBody List<HashMap<String, Object>> nComList(){
		
		List<HashMap<String, Object>> nComList = service.nComList();
		
		return nComList;
	}
	
	
	// 조건 검색
	@RequestMapping(value="/admin/searchCompany", method=RequestMethod.POST)
	public @ResponseBody List<HashMap<String, Object>> searchCom(HttpServletRequest request) {
		
		CompanyVo companyVo = new CompanyVo();
		EmployeeVo employeeVo = new EmployeeVo();
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("companyVo", companyVo);
		map.put("employeeVo", employeeVo);
		
		
		List<HashMap<String, Object>> searchComList = new ArrayList<HashMap<String, Object>>();
		searchComList.add(map);
		
		String comType = request.getParameter("type");
		String voType = request.getParameter("vo");
		String content = request.getParameter("content");
		
		if(comType.equals("h")){
			System.out.println("해방업체 탐");
			if(voType.equals("c_code")) {
				companyVo.setC_code(content);
			}else if(voType.equals("c_name")) {
				companyVo.setC_name(content);
			}else if(voType.equals("c_address")) {
				companyVo.setC_address(content);
			}else if(voType.equals("c_bizNo")) {
				companyVo.setC_bizNo(content);
			}
			searchComList = service.searchHbComList(companyVo);
		}else{
			System.out.println("일반업체 탐");
			if(voType.equals("c_code")) {
				companyVo.setC_code(content);
			}else if(voType.equals("c_name")) {
				companyVo.setC_name(content);
			}else if(voType.equals("c_address")) {
				companyVo.setC_address(content);
			}else if(voType.equals("c_bizNo")) {
				companyVo.setC_bizNo(content);
			}
			searchComList = service.searchNComList(companyVo);
		}
		
		return searchComList;
		
	}
	

}
