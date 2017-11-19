package net.haebang.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.qna.service.QnAService;
import net.haebang.vo.QnAVo;

@RequestMapping("/qna")
@Controller
public class QnAController {

	@Autowired
	private QnAService service;
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeForm(Model model) {
		
		QnAVo QnA = new QnAVo();
		
		model.addAttribute("QnAVO", QnA);
		
		return "qna/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@Valid QnAVo QnA, HttpServletRequest request) {
		
		
		
		/*HttpSession session = request.getSession();
	
		QnAVo qnaVo = (QnAVo)session.getAttribute("userVO");
		qnaVo.getQ_writer()==(String)session.getAttribute("m_id");
		qnaVo = service.insertBoard(qnaVo.getQ_writer());*/
		
		service.insertBoard(QnA);
		
		return "redirect:/qna/list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView selectAll() {
		
		List<QnAVo> QnAList = service.selectAllBoard();
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("qna/list");
		mav.addObject("QnAList", QnAList);
		
		
		return mav;
	}
	
	@RequestMapping(value = "/detail/{q_no}", method = RequestMethod.GET)
	public String selectOne(@PathVariable int q_no, Model model) {
		QnAVo QnA = service.selectOneBoard(q_no);
		
		model.addAttribute("QnAVO", QnA);
		
		return "qna/detail";
	}
	
	@RequestMapping(value = "/{q_no}", method = RequestMethod.GET)
	public String updateForm(Model model) {
		
		QnAVo QnA = new QnAVo();
		
		model.addAttribute("QnAVO", QnA);
		
		return "/qna/update";
	}
	
	@RequestMapping(value = "/{q_no}", method = RequestMethod.POST)
	public String update(@PathVariable int q_no, @Valid QnAVo QnA) {
		
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
