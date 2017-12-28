package net.haebang.admin.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.qna.service.QnAService;
import net.haebang.vo.QnAVo;
import net.haebang.vo.ScheduleModifyVo;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	private QnAService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView selectAll(HttpServletRequest request) {
		
		// 현재 페이지 번호 저장 변수
				int pageNo = 0;
				if (request.getParameter("pageNo") != null) {
					// 페이지 파라미터가 있는 경우 현재 페이지 번호를 설정
					pageNo = Integer.parseInt(request.getParameter("pageNo"));
				} 
				System.out.println(pageNo);
				// 한페이지에 보여질 목록 수
				int listSize = 5;
				
				
				
				// 전체 게시글 카운트
				int totalCount = service.selectAllBoard(pageNo).size();
				System.out.println(totalCount);

				// 마지막 페이지 구하기
				int lastPage = (totalCount % listSize == 0) ? totalCount / listSize 
						                                    : totalCount / listSize + 1;
		
				request.setAttribute("pageNo"  , pageNo);
				request.setAttribute("lastPage", lastPage);
				
				// ======================================================================
				// 탭 관련 작업 추가 파트
				// ======================================================================
				// 목록에 보여질 탭 사이즈
				int tabSize  = 5;
				// 현재 페이지에 해당하는 탭 위치 
				int currTab   = (pageNo  -1) / tabSize + 1;
				int beginPage = (currTab -1) * tabSize + 1;
				int endPage   = (currTab * tabSize < lastPage) ? currTab * tabSize 
						                                       : lastPage;
				
				request.setAttribute("beginPage", beginPage);
				request.setAttribute("endPage"  , endPage);
				// ======================================================================
				
				// 해당 페이지의 게시글 목록
				List<Integer> page = new ArrayList<>();
				page.add( (pageNo - 1) * listSize );
				page.add( listSize );
//				List<BoardQAVO> BoardList = service.selectPage(page);
				
				Map<String, Object> boardQAMap = new HashMap<>();
				boardQAMap.put("startPage", (pageNo -1 ) * listSize);
				boardQAMap.put("count", listSize );
				
				
		
		
		ModelAndView mav = new ModelAndView();
		List<QnAVo> list = service.selectAllBoard(pageNo);
		System.out.println(list);
		int totalPage = service.getLastPage();
		
		mav.addObject("totalPage", totalPage);
		mav.addObject("list", list);
		
		
		return mav;
	}
	
	@RequestMapping(value = "/detail/{q_no}", method = RequestMethod.GET)
	public String selectOne(@PathVariable int q_no, Model model) throws IOException{
		
		
		QnAVo QnA = service.selectOneBoard(q_no);
		System.out.println(QnA.getQ_saveName());
		
		if( QnA.getQ_saveName() == null) {
			model.addAttribute("image");
		}else {
			System.out.println(" 1111");
			File file = new File("/home/ubuntu/HaeBangQnA/" + QnA.getQ_saveName());
			FileInputStream fis = new FileInputStream(file);
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			int b;
			byte[] buffer = new byte[1024];
			while ((b = fis.read(buffer)) != -1) {
				bos.write(buffer, 0, b);
			}
			byte[] fileBytes = bos.toByteArray();
			fis.close();
			bos.close();
			
			byte[] encoded = Base64.encodeBase64(fileBytes);
			String encodedString = new String(encoded);
			
			model.addAttribute("image", encodedString);
			
		}
		service.updateViewCnt(q_no);
		/* QnAVo QnA = service.selectOneBoard(q_no); */

		model.addAttribute("QnA", QnA);
		System.out.println("2222");
		return "admin/detail";
	}
	
	@RequestMapping(value = "/FE", method = RequestMethod.GET)
	public ModelAndView selectFE(HttpServletRequest request) {

		// 현재 페이지 번호 저장 변수
		int pageNo = 0;
		if (request.getParameter("pageNo") != null) {
			// 페이지 파라미터가 있는 경우 현재 페이지 번호를 설정
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		System.out.println(pageNo);
		// 한페이지에 보여질 목록 수
		int listSize = 5;

		// 전체 게시글 카운트
		int totalCount = service.selectFE(pageNo).size();
		System.out.println(totalCount);

		// 마지막 페이지 구하기
		int lastPage = (totalCount % listSize == 0) ? totalCount / listSize : totalCount / listSize + 1;

		request.setAttribute("pageNo", pageNo);
		request.setAttribute("lastPage", lastPage);

		// ======================================================================
		// 탭 관련 작업 추가 파트
		// ======================================================================
		// 목록에 보여질 탭 사이즈
		int tabSize = 5;
		// 현재 페이지에 해당하는 탭 위치
		int currTab = (pageNo - 1) / tabSize + 1;
		int beginPage = (currTab - 1) * tabSize + 1;
		int endPage = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;

		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
		// ======================================================================

		// 해당 페이지의 게시글 목록
		List<Integer> page = new ArrayList<>();
		page.add((pageNo - 1) * listSize);
		page.add(listSize);
		// List<BoardQAVO> BoardList = service.selectPage(page);

		Map<String, Object> boardQAMap = new HashMap<>();
		boardQAMap.put("startPage", (pageNo - 1) * listSize);
		boardQAMap.put("count", listSize);

		ModelAndView mav = new ModelAndView();
		List<QnAVo> list = service.selectFE(pageNo);
		System.out.println(list);
		int totalPage = service.getLastPage();

		mav.addObject("totalPage", totalPage);
		mav.addObject("list", list);

		return mav;

	}

	@RequestMapping(value = "/FM", method = RequestMethod.GET)
	public ModelAndView selectFM(HttpServletRequest request) {

		// 현재 페이지 번호 저장 변수
		int pageNo = 0;
		if (request.getParameter("pageNo") != null) {
			// 페이지 파라미터가 있는 경우 현재 페이지 번호를 설정
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		System.out.println(pageNo);
		// 한페이지에 보여질 목록 수
		int listSize = 5;

		// 전체 게시글 카운트
		int totalCount = service.selectFM(pageNo).size();
		System.out.println(totalCount);

		// 마지막 페이지 구하기
		int lastPage = (totalCount % listSize == 0) ? totalCount / listSize : totalCount / listSize + 1;

		request.setAttribute("pageNo", pageNo);
		request.setAttribute("lastPage", lastPage);

		// ======================================================================
		// 탭 관련 작업 추가 파트
		// ======================================================================
		// 목록에 보여질 탭 사이즈
		int tabSize = 5;
		// 현재 페이지에 해당하는 탭 위치
		int currTab = (pageNo - 1) / tabSize + 1;
		int beginPage = (currTab - 1) * tabSize + 1;
		int endPage = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;

		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
		// ======================================================================

		// 해당 페이지의 게시글 목록
		List<Integer> page = new ArrayList<>();
		page.add((pageNo - 1) * listSize);
		page.add(listSize);
		// List<BoardQAVO> BoardList = service.selectPage(page);

		Map<String, Object> boardQAMap = new HashMap<>();
		boardQAMap.put("startPage", (pageNo - 1) * listSize);
		boardQAMap.put("count", listSize);

		ModelAndView mav = new ModelAndView();
		List<QnAVo> list = service.selectFM(pageNo);
		System.out.println(list);
		int totalPage = service.getLastPage();

		mav.addObject("totalPage", totalPage);
		mav.addObject("list", list);

		return mav;

	}
	
	@RequestMapping(value = "/FM/{q_no}", method = RequestMethod.GET)
	public String selectFM(@PathVariable int q_no, Model model) throws IOException{
		QnAVo QnA = service.selectOneBoard(q_no);
		System.out.println(QnA.getQ_saveName());
		
		if( QnA.getQ_saveName() == null) {
			model.addAttribute("image");
		}else {
			System.out.println(" 1111");
			File file = new File("/home/ubuntu/HaeBangQnA/" + QnA.getQ_saveName());
			FileInputStream fis = new FileInputStream(file);
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			int b;
			byte[] buffer = new byte[1024];
			while ((b = fis.read(buffer)) != -1) {
				bos.write(buffer, 0, b);
			}
			byte[] fileBytes = bos.toByteArray();
			fis.close();
			bos.close();
			
			byte[] encoded = Base64.encodeBase64(fileBytes);
			String encodedString = new String(encoded);
			
			model.addAttribute("image", encodedString);
			
		}
		service.updateViewCnt(q_no);
		/* QnAVo QnA = service.selectOneBoard(q_no); */

		model.addAttribute("QnA", QnA);
		System.out.println("2222");
		
		return "admin/FMdetail";
	}
	
	@RequestMapping(value = "/FE/{q_no}", method = RequestMethod.GET)
	public String selectFE(@PathVariable int q_no, Model model) throws IOException{
		QnAVo QnA = service.selectOneBoard(q_no);
		System.out.println(QnA.getQ_saveName());
		
		if( QnA.getQ_saveName() == null) {
			model.addAttribute("image");
		}else {
			System.out.println(" 1111");
			File file = new File("/home/ubuntu/HaeBangQnA/" + QnA.getQ_saveName());
			FileInputStream fis = new FileInputStream(file);
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			int b;
			byte[] buffer = new byte[1024];
			while ((b = fis.read(buffer)) != -1) {
				bos.write(buffer, 0, b);
			}
			byte[] fileBytes = bos.toByteArray();
			fis.close();
			bos.close();
			
			byte[] encoded = Base64.encodeBase64(fileBytes);
			String encodedString = new String(encoded);
			
			model.addAttribute("image", encodedString);
			
		}
		service.updateViewCnt(q_no);
		/* QnAVo QnA = service.selectOneBoard(q_no); */

		model.addAttribute("QnA", QnA);
		System.out.println("2222");
		return "admin/FEdetail";
	}
	
	@RequestMapping(value = "M/{q_no}", method = RequestMethod.GET)
	public String updateFMForm(Model model, @PathVariable int q_no) {

		QnAVo QnA = service.selectOneBoard(q_no);

		model.addAttribute("QnA", QnA);

		return "/admin/FMUpdate";
	}
	
	@RequestMapping(value = "E/{q_no}", method = RequestMethod.GET)
	public String updateFEForm(Model model, @PathVariable int q_no) {

		QnAVo QnA = service.selectOneBoard(q_no);

		model.addAttribute("QnA", QnA);

		return "/admin/FEUpdate";
	}
	
	@RequestMapping(value = "M/{q_no}", method = RequestMethod.PUT)
	public String updateFM(@PathVariable int q_no, @Valid QnAVo QnA, @RequestParam("q_title") String q_title,
			@RequestParam("q_writer") String q_writer, @RequestParam("q_content") String q_content) {

		QnA.setQ_no(q_no);
		service.updateBoard(QnA);

		return "redirect:/admin/FM";
	}
	@RequestMapping(value = "E/{q_no}", method = RequestMethod.PUT)
	public String updateFE(@PathVariable int q_no, @Valid QnAVo QnA, @RequestParam("q_title") String q_title,
			@RequestParam("q_writer") String q_writer, @RequestParam("q_content") String q_content) {
		
		QnA.setQ_no(q_no);
		service.updateBoard(QnA);
		
		return "redirect:/admin/FE";
	}
	
	@RequestMapping(value = "/FEwrite", method = RequestMethod.GET)
	public String FEwriteForm(Model model) {

		QnAVo QnA = new QnAVo();

		model.addAttribute("QnAVO", QnA);

		return "admin/FEwrite";
	}
	

	@RequestMapping(value = "/FEwrite", method = RequestMethod.POST)
	public String FEwrite(@Valid QnAVo QnA, MultipartHttpServletRequest request) throws IOException {


		service.insertFE(QnA);

		return "redirect:/admin/FE";
	}
	
	@RequestMapping(value = "/FMwrite", method = RequestMethod.GET)
	public String FMwriteForm(Model model) {

		QnAVo QnA = new QnAVo();

		model.addAttribute("QnAVO", QnA);

		return "admin/FMwrite";
	}
	

	@RequestMapping(value = "/FMwrite", method = RequestMethod.POST)
	public String FMwrite(@Valid QnAVo QnA, MultipartHttpServletRequest request) throws IOException {


		service.insertFM(QnA);

		return "redirect:/admin/FM";
	}
	
	
	
	
}
