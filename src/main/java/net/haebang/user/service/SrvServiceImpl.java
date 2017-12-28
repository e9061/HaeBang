package net.haebang.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.haebang.user.dao.SrvDao;
import net.haebang.vo.MemberVo;
import net.haebang.vo.ServiceVo;

@Service
public class SrvServiceImpl implements SrvService {

	@Autowired
	SrvDao srvdao;

	public List<ServiceVo> selectList(String con1, String con2, int con3) {

		List<ServiceVo> readyList = srvdao.selectList(con1, con2, con3);
		return readyList;

	}

	public String mkOrderNo(String orderType, String orderDate, String orderStartHour, String orderStartMinute,
			String orderPhone3) {

		String year = orderDate.substring(0, 4);
		String month = orderDate.substring(5, 7);
		String day = orderDate.substring(8, 10);

		orderDate = year + month + day;

		String orderNo = orderType + orderDate + orderStartHour + orderStartMinute + orderPhone3;
		return orderNo;
	}

	@Override
	public void insertScheduleByOnetime(Map<String, Object> map) {

		MemberVo registeredMember = srvdao.selectUserByInfo(map);
		System.out.println(registeredMember);

		String phone = (String) map.get("phone");
		String phone3 = phone.substring(phone.length() - 4, phone.length());

		String date1 = (String) map.get("orderNo_date");
		String startTimeHour1 = (String) map.get("orderNo_startHour");
		String startTimeMinute1 = (String) map.get("orderNo_startMinute");

		/////////////////////////////////////// 창대/////////////////////////////////////////////////////
		int prevMonthOutCome = srvdao.selectPrevMonthOutCome();
		map.put("prevMonthOutCome", prevMonthOutCome);
		System.out.println("***********************전월 회사별 매출금액 중 최소금액 select 완료" + prevMonthOutCome
				+ "*******************************");

		//////////////////////////////////////////////////////////////////////////////////////////////////

		/////////////////////////////////////// 창대/////////////////////////////////////////////////////
		int e_no_first = srvdao.selectNoOneEmployee(map);
		map.put("e_no_first", e_no_first);
		System.out.println(
				"*********************별점,매출,위치 기준 1순위 select 완료" + e_no_first + "*******************************");
		System.out.println("////v/////v////v/////v//////v//////v////v//////");
		////////////////////////////////////////////////////////////////////////////////////////////

		if (registeredMember == null) {

			String orderNo = mkOrderNo("B", date1, startTimeHour1, startTimeMinute1, phone3);
			map.put("orderNo", orderNo);
			map.put("type", "B");
			srvdao.insertScdToNewMemberOnetime(map);

		} else {

			map.put("m_no", registeredMember.getM_no());
			String orderNo = mkOrderNo("M", date1, startTimeHour1, startTimeMinute1, phone3);
			map.put("orderNo", orderNo);
			map.put("type", "M");
			srvdao.insertScdToRegisteredMemberOnetime(map);

		}

		////////////////////////////////////////// 창대//////////////////////////////////////////////////
		System.out.println(map.get("orderNo"));
		System.out.println(map.get("orderNo"));
		List<Integer> list = srvdao.selectMoNoByOrderNo(map);
		System.out.println(list.get(0));
		map.put("mo_no", list.get(0));

		srvdao.updateENoFirstbyMoNo(map);
		System.out.println(map.get("mo_no"));
		System.out.println(map.get("mo_no"));
		srvdao.createEvent(map);
		////////////////////////////////////////////////////////////////////////////////////////////

	}

	@Override
	public void insertSchedule(Map<String, Object> map) {

		MemberVo registeredMember = srvdao.selectUserByInfo(map);

		String phone = (String) map.get("phone");
		String phone3 = phone.substring(phone.length() - 4, phone.length());

		String date1 = (String) map.get("orderNo_date");
		String startTimeHour1 = (String) map.get("orderNo_startHour");
		String startTimeMinute1 = (String) map.get("orderNo_startMinute");

		
		
		//*************************************** 창대***************************************************************
	
		int prevMonthOutCome = srvdao.selectPrevMonthOutCome();

		map.put("prevMonthOutCome", prevMonthOutCome);

		System.out.println("***********************전월 회사별 매출금액 중 최소금액 select 완료" + prevMonthOutCome
				+ "*******************************");

		int e_no_first = srvdao.selectNoOneEmployee(map);
		map.put("e_no_first", e_no_first);
		System.out.println(
				"*********************별점,매출,위치 기준 1순위 select 완료" + e_no_first + "*******************************");
		System.out.println("////o/////O////o/////O//////o//////O////o//////");
		
		//**********************************************************************************************************

		
		
		
		if (registeredMember == null) {

			String orderNo = mkOrderNo("B", date1, startTimeHour1, startTimeMinute1, phone3);
			map.put("orderNo", orderNo);
			map.put("type", "B");
			srvdao.insertScdToNewMember(map);

		} else {

			map.put("m_no", registeredMember.getM_no());
			String orderNo = mkOrderNo("M", date1, startTimeHour1, startTimeMinute1, phone3);
			map.put("orderNo", orderNo);
			map.put("type", "M");
			srvdao.insertScdToRegisteredMember(map);

		}
		
		// ********************************************** 창대 *****************************************************
		   System.out.println(map.get("orderNo"));
		      System.out.println(map.get("orderNo"));
		      List<Integer> list = srvdao.selectMoNoByOrderNo(map);
		      System.out.println(list.get(0));
		      map.put("mo_no", list.get(0));
		      // 업데이트 통해서 mo_no 첫번째에 넣어주기.
		      srvdao.updateENoFirstbyMoNo(map);

		      
		      System.out.println(map.get("mo_no"));
		      System.out.println(map.get("mo_no"));
		      srvdao.createEvent(map);
	   // **********************************************************************************************************

	}

	@Override
	public ServiceVo getServiceInfo(int s_no) {
		ServiceVo selectedService = srvdao.getServiceInfo(s_no);
		return selectedService;
	}

}
