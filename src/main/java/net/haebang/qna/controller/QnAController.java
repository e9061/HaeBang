package net.haebang.qna.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.qna.service.QnAService;
import net.haebang.vo.QnAVo;

@RequestMapping("/qna")
@Controller
public class QnAController {

	private static final int LIST_SIZE = 10;
	
	@Autowired
	private QnAService service;
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeForm(Model model) {
		
		QnAVo QnA = new QnAVo();
		
		model.addAttribute("QnAVO", QnA);
		
		return "qna/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@Valid QnAVo QnA, MultipartHttpServletRequest request ) throws IOException {
		
		
		
		/*HttpSession session = request.getSession();
	
		QnAVo qnaVo = (QnAVo)session.getAttribute("userVO");
		qnaVo.getQ_writer()==(String)session.getAttribute("m_id");
		qnaVo = service.insertBoard(qnaVo.getQ_writer());*/
		
		service.insertBoard(QnA, request);
		
		return "redirect:/qna/list";
	}
	
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
	public String selectOne(@PathVariable int q_no, Model model) {
		System.out.println(q_no+"con");
		QnAVo QnA = service.selectOneBoard(q_no);
		service.updateViewCnt(q_no);
		model.addAttribute("QnA", QnA);
		
		return "qna/detail";
	}
	
	@RequestMapping(value = "/{q_no}", method = RequestMethod.GET)
	public String updateForm(Model model) {
		
		QnAVo QnA = new QnAVo();
		
		model.addAttribute("QnAVO", QnA);
		
		return "/qna/update";
	}
	
	@RequestMapping(value = "/{q_no}", method = RequestMethod.PUT)
	public String update(@PathVariable int q_no, @Valid QnAVo QnA,
			@RequestParam("q_title") String q_title,
			@RequestParam("q_writer") String q_writer,
			@RequestParam("q_content") String q_content
			) {
		
		QnA.setQ_no(q_no);
		service.updateBoard(QnA);
		
		return "redirect:/qna/list";
	}
	
	@RequestMapping(value = "/{q_no}", method = RequestMethod.DELETE)
	public String delete(@PathVariable int q_no) {
		
		service.deleteBoard(q_no);
		return "redirect:/qna/list";
	}
	
	
}
