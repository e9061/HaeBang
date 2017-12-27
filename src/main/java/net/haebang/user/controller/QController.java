package net.haebang.user.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.haebang.user.bug.AnsweredData;
import net.haebang.user.bug.Question;
import net.haebang.user.service.SrvService;
import net.haebang.vo.ServiceVo;


@Controller
public class QController {
	
	
	@Autowired
	SrvService srvService;
	
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String submitQ1(Model model) {
		Question q1 = createQuestion();
		model.addAttribute("q1", q1);
		return "index";
	}
	
	
	private Question createQuestion(){
		Question q1 = new Question("가장 싫어하는 해충을 선택해주세요!", Arrays.asList("바퀴", "개미", "파리", "곰팡이", "전부 싫어요."));
		return q1;
	}
	

	
	@RequestMapping(value="/q2", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> submitQ2(HttpServletRequest request, HttpSession session) {
		String ans1 = request.getParameter("ans1");
		AnsweredData ans = new AnsweredData();
		ans.setAns1(ans1);
		session.setAttribute("ansStd", ans);
		Question q2 = new Question("현재 살고 있는 거주지는 어디입니까?", Arrays.asList("오피스텔", "다세대", "아파트", "주택"));
		HashMap<String, Object> hMap = new HashMap<>();
		hMap.put("q", q2);
		hMap.put("ans", ans);
		
		return hMap;
	}
	
	@RequestMapping(value="/q3", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> submitQ3(HttpServletRequest request, HttpSession session) {
		String ans2 = request.getParameter("ans2");
//		AnsweredData ans = new AnsweredData();
		AnsweredData ans = (AnsweredData)session.getAttribute("ansStd");
		ans.setAns2(ans2);
		session.setAttribute("ansStd", ans);
		Question q3 = new Question("카펫, 천 소파, 쿠션 등 집안에 패브릭으로 된 가구와 장난감은 몇 개입니까?", Arrays.asList("1개 이하", "3개 이하", "5개 이하", "6개 이상"));
		HashMap<String, Object> hMap = new HashMap<>();
		hMap.put("q", q3);
		hMap.put("ans", ans);
		
		return hMap;
	}
	
	@RequestMapping(value="/q4", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> submitQ4(HttpServletRequest request, HttpSession session) {
		String ans3 = request.getParameter("ans3");
//		AnsweredData ans = new AnsweredData();
		AnsweredData ans = (AnsweredData)session.getAttribute("ansStd");
		ans.setAns3(ans3);
		session.setAttribute("ansStd", ans);
		Question q4 = new Question("방충망 틈이 벌어지거나 손상된 곳이 있습니까?", Arrays.asList("없다", "1군데 이하", "3군데 이하", "4군데 이상"));
		HashMap<String, Object> hMap = new HashMap<>();
		hMap.put("q", q4);
		hMap.put("ans", ans);
		
		return hMap;
	}
	
	@RequestMapping(value="/result", method=RequestMethod.POST)
	public @ResponseBody AnsweredData submitResult(HttpServletRequest request, HttpSession session) {
		String ans4 = request.getParameter("ans4");
		AnsweredData ans = (AnsweredData)session.getAttribute("ansStd");
		ans.setAns4(ans4);
		System.out.println(ans.toString());
		return ans;
	}
	
	@RequestMapping(value="/abc", method=RequestMethod.POST)
	public @ResponseBody List<ServiceVo> collect
						(@RequestParam(value = "selecttype", defaultValue = "null", required = false) String type,
						@RequestParam(value = "selectinsect", defaultValue = "null", required = false) String[] insect,
						@RequestParam(value = "selectplace", defaultValue = "null", required = false) String place,
						@RequestParam(value = "selectsize", defaultValue = "null", required = false) int size,
				HttpSession session) {
		
	
		if(type.equals("H")) {//해방일때
						
			if(place.equals("K")) {//가정일때
							
				if(size==31) {//40-50평대 더미 50평대로 넣기
					
					size = 41;			
					
				}else if(size > 50 && size <= 100) {//50평대이상 100평대이하 더미넣기
					
					size=91;
										
				}else if(size > 100){//100평이상-따로전화
					size=101;
					
				}
				
				
			}else {//영업장일때

				if(size==1) {
					size= 11;
					
				}else if(size > 50) {//50평이상-따로전화
					size=51;
					
				}
				
			}
			
					
		}else {//소독일때 (S)
			
			place="A";
			
			if(size < 50) {
				size=41;
				
			}else if(size <= 70) {
				size=61;
				
			}else if(size <=100) {
				size=91;
				
			}else if(size <= 200) {
				size=191;
				
			}else if(size <= 500) {
				size=491;
				
			}else if(size > 500){//500이상 사이즈
				size=501;
			}
				
			
		}
		
		List<ServiceVo> result = srvService.selectList(type, place, size);

		ListIterator<ServiceVo> itr = result.listIterator();
		if(!itr.hasNext())
			System.out.println("has no element..");
		else {
			while(itr.hasNext()) {
				System.out.println(itr.next().toString());
			}
		}
		
		for(int i = 0; i< insect.length; i++) {
			System.out.println(insect[i]);
		}
		
		
		session.setAttribute("bugs", insect);
		session.setAttribute("srvDisplay", result);
		return result;
	}
	
	@RequestMapping(value="/bcd", method=RequestMethod.POST)
	public @ResponseBody List<ServiceVo> serviceDisplay(HttpSession session){
		System.out.println("/bcd 입성");
		List<ServiceVo> list = (List<ServiceVo>)session.getAttribute("srvDisplay");
		
		System.out.println(list);
		return list;
	}
	

}
