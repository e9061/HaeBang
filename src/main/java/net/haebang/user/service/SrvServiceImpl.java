package net.haebang.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.haebang.user.dao.SrvDao;
import net.haebang.vo.MemberVo;
import net.haebang.vo.ServiceVo;

@Service
public class SrvServiceImpl implements SrvService{
	
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
		String phone = (String)map.get("phone");
		String phone3 = phone.substring(phone.length()-4, phone.length());
		
		String date1 = (String)map.get("orderNo_date");
		String startTimeHour1 = (String)map.get("orderNo_startHour");
		String startTimeMinute1 = (String)map.get("orderNo_startMinute");
		
		
		if(registeredMember == null) {
			

			String orderNo = mkOrderNo("B", date1, startTimeHour1, startTimeMinute1, phone3);
			map.put("orderNo", orderNo);
			map.put("type", "B");
			srvdao.insertScdToNewMemberOnetime(map);
		
		
		}else {
		
		
			
		map.put("m_no", registeredMember.getM_no());
		String orderNo = mkOrderNo("M", date1, startTimeHour1, startTimeMinute1, phone3);
		map.put("orderNo", orderNo);		
		map.put("type", "M");
		srvdao.insertScdToRegisteredMemberOnetime(map);
			
		}	
		
	}
	
	
	@Override
	public void insertSchedule(Map<String, Object> map) {
		
		MemberVo registeredMember = srvdao.selectUserByInfo(map);
		
		String phone = (String)map.get("phone");
		String phone3 = phone.substring(phone.length()-4, phone.length());
		
		
		String date1 = (String)map.get("orderNo_date");
		String startTimeHour1 = (String)map.get("orderNo_startHour");
		String startTimeMinute1 = (String)map.get("orderNo_startMinute");
		
		
		if(registeredMember == null) {
				
			String orderNo = mkOrderNo("B", date1, startTimeHour1, startTimeMinute1, phone3);
			map.put("orderNo", orderNo);		
			map.put("type", "B");
			srvdao.insertScdToNewMember(map);	
		
		}else {

		
			map.put("m_no", registeredMember.getM_no());
			String orderNo = mkOrderNo("M", date1, startTimeHour1, startTimeMinute1, phone3);
			map.put("orderNo", orderNo);
			map.put("type", "M");
			srvdao.insertScdToRegisteredMember(map);
			
		}	
		
		
	}



	@Override
	public ServiceVo getServiceInfo(int s_no) {
		ServiceVo selectedService = srvdao.getServiceInfo(s_no);
		return selectedService;
	}
	

	
	
	
}
