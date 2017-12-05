package net.haebang.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.haebang.admin.dao.AdminDao;

/**
 * 관리자 메인 컨트롤러 - 진행현황 지도 페이지
 * 
 * @author LEEJUHO
 *
 */

@Controller
public class AdminMainController {

	@Autowired
	private AdminDao adminDao;

	@RequestMapping("/admin")
	public String main() {
		System.out.println("main컨트롤러");
		return "admin/main";
	}

	// ------------------------------------ 창대 12/2일 작업(지도 주문관련)----------------------------------------------

	@RequestMapping(value = "/admin/selectAllmap", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<HashMap<String, Object>> selectAllmap(HttpSession session, Model model) {

		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();

		mapList = adminDao.selectAllmap();

		model.addAttribute("mapList", mapList);
		System.out.println(mapList);
		System.out.println(mapList.size());

		return mapList;
	}
}
