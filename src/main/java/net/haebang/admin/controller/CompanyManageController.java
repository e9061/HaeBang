package net.haebang.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.admin.service.AdminService;
import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.MemberVo;

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
	public String companyManage(HttpSession session){
		
		MemberVo adminVo = (MemberVo)session.getAttribute("adminVo");
		if(adminVo == null) {
			return "redirect:/admin/login";
		}else {
			return "admin/companyManage";
		}
	}
	

	 // 해방업체 조회
	   @RequestMapping(value="/admin/hbCompanyManage")
	   public @ResponseBody ModelAndView hbComList(HttpServletRequest request, @RequestParam(value="pageNum", required=false)@RequestBody int pageNum){
	      
		// 현재 페이지 번호 저장 변수
				int pageNo = 0;
					// 페이지 파라미터가 있는 경우 현재 페이지 번호를 설정
				try {
					pageNo = pageNum;
				}catch(Exception e){
				}
				System.out.println(pageNo);
				// 한페이지에 보여질 목록 수
				int listSize = 5;
				
				// 전체 게시글 카운트
				int totalCount = service.hbComList(pageNo).size();
				System.out.println(totalCount);
		   
				int lastPage = (totalCount % listSize == 0) ? totalCount / listSize : totalCount / listSize + 1;
				
				request.setAttribute("pageNo", pageNo);
				request.setAttribute("lastPage", lastPage);
				
				int tabSize = 5;
				// 현재 페이지에 해당하는 탭 위치
				int currTab = (pageNo - 1) / tabSize + 1;
				int beginPage = (currTab - 1) * tabSize + 1;
				int endPage = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;

				request.setAttribute("beginPage", beginPage);
				request.setAttribute("endPage", endPage);
				
				// 해당 페이지의 게시글 목록
				List<Integer> page = new ArrayList<>();
				page.add((pageNo - 1) * listSize);
				page.add(listSize);
				// List<BoardQAVO> BoardList = service.selectPage(page);

				Map<String, Object> companyMap = new HashMap<>();
				companyMap.put("startPage", (pageNo - 1) * listSize);
				companyMap.put("count", listSize);

				ModelAndView mav = new ModelAndView();
				List<HashMap<String, Object>> list = service.hbComList(pageNo);
				int totalPage = service.getLastPage();

				mav.setViewName("admin/listManage");
				mav.addObject("totalPage", totalPage);
				mav.addObject("list", list);

				return mav;
				
	   }
	
	   // 일반업체 조회
	   @RequestMapping(value="/admin/nCompanyManage")
	   public @ResponseBody ModelAndView nComList(HttpServletRequest request){

		   int pageNo = 0;
			if (request.getParameter("pageNo") != null) {
				// 페이지 파라미터가 있는 경우 현재 페이지 번호를 설정
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			System.out.println(pageNo);
			// 한페이지에 보여질 목록 수
			int listSize = 5;
			
			// 전체 게시글 카운트
			int totalCount = service.nComList(pageNo).size();
			System.out.println(totalCount);
	  
			int lastPage = (totalCount % listSize == 0) ? totalCount / listSize : totalCount / listSize + 1;
			
			request.setAttribute("pageNo", pageNo);
			request.setAttribute("lastPage", lastPage);
			
			int tabSize = 5;
			// 현재 페이지에 해당하는 탭 위치
			int currTab = (pageNo - 1) / tabSize + 1;
			int beginPage = (currTab - 1) * tabSize + 1;
			int endPage = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;

			request.setAttribute("beginPage", beginPage);
			request.setAttribute("endPage", endPage);
			
			// 해당 페이지의 게시글 목록
			List<Integer> page = new ArrayList<>();
			page.add((pageNo - 1) * listSize);
			page.add(listSize);
			// List<BoardQAVO> BoardList = service.selectPage(page);

			Map<String, Object> companyMap = new HashMap<>();
			companyMap.put("startPage", (pageNo - 1) * listSize);
			companyMap.put("count", listSize);

			ModelAndView mav = new ModelAndView();
			List<HashMap<String, Object>> list = service.nComList(pageNo);
			int totalPage = service.getLastPage();

			mav.setViewName("admin/listN");
			mav.addObject("totalPage", totalPage);
			mav.addObject("list", list);

			return mav;
	   }
	
	
	// 조건 검색
	   @RequestMapping(value="/admin/searchCompany", method=RequestMethod.POST)
	   public @ResponseBody ModelAndView searchCom(HttpServletRequest request) {
	      
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
	      // -------------------------
	      
	      	ModelAndView mav = new ModelAndView();
	      
			mav.setViewName("admin/listS");
			mav.addObject("searchComList", searchComList);

			return mav;
	      
	      // -------------------------
	      
	   }
		
	}
	


