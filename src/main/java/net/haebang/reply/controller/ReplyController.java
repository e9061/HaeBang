package net.haebang.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import net.haebang.reply.service.ReplyService;
import net.haebang.vo.ReplyVo;


@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	ReplyService service;
	  
//	@ResponseBody
	@RequestMapping("/list")
	public List<ReplyVo> selectReply(@RequestParam int q_no) {
		
		List<ReplyVo> list = service.selectAllReply(q_no);
		System.out.println(list);
//		ModelAndView mav = new ModelAndView();
//		
//		mav.setViewName("reply/list");
//		mav.addObject("list",list);
		
		return list;
	}
	
	@RequestMapping("/insert")
	public String insertReply(@RequestParam int q_no, @RequestParam String r_content, @RequestParam String r_writer) {
		
		ReplyVo reply = new ReplyVo();
		reply.setQ_no(q_no);
		reply.setR_content(r_content);
		reply.setR_writer(r_writer);
		
		System.out.println("reply : " + reply);
		
		service.insertReply(reply);
		
		return "reply/insert";
	}
	@RequestMapping("/delete/{r_no}")
	public void delete(@PathVariable int r_no) {
		service.deleteReply(r_no);
	}
	@RequestMapping("/update")
	public void update(@RequestParam int r_no, @RequestParam String r_content) {
		ReplyVo reply = new ReplyVo();
		reply.setR_no(r_no);
		reply.setR_content(r_content);
		
		service.modifyReply(reply);
	}
}
