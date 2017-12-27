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
	
	public List<ServiceVo> selectList(String con1, String con2, String con3) {
		
		List<ServiceVo> readyList = srvdao.selectList(con1, con2, con3);
		return readyList;
		
	}
	
	
	
	@Override
	public void insertScheduleByOnetime(Map<String, Object> map) {
		
		MemberVo registeredMember = srvdao.selectUserByInfo(map);
		System.out.println("***********************서비스:1회성 고객정보select 완료*******************************");
		
		System.out.println(registeredMember);
		
			/////////////////////////////////////// 창대/////////////////////////////////////////////////////
		int prevMonthOutCome = srvdao.selectPrevMonthOutCome();
		map.put("prevMonthOutCome", prevMonthOutCome);
		System.out.println("***********************전월 회사별 매출금액 중 최소금액 select 완료" + prevMonthOutCome
				+ "*******************************");

		int e_no_first = srvdao.selectNoOneEmployee(map);
		map.put("e_no_first", e_no_first);
		System.out.println(
				"*********************별점,매출,위치 기준 1순위 select 완료" + e_no_first + "*******************************");
		System.out.println("////v/////v////v/////v//////v//////v////v//////");
		////////////////////////////////////////////////////////////////////////////////////////////
		
		if(registeredMember == null) {
			System.out.println("***********************서비스:뉴멤버 1회성 insert메서드 실행전*******************************");
			srvdao.insertScdToNewMemberOnetime(map);
		
		
		}else {
		
		map.put("m_no", registeredMember.getM_no());
		System.out.println("***********************서비스:기존멤버 1회성 insert메서드 실행전*******************************");
		
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
		System.out.println("***********************서비스:정기성 고객정보select 완료*******************************");
		
			
		////////////////////////////// 창대/////////////////////////////////////////
		int prevMonthOutCome = srvdao.selectPrevMonthOutCome();
		map.put("prevMonthOutCome", prevMonthOutCome);
		System.out.println("***********************전월 회사별 매출금액 중 최소금액 select 완료" + prevMonthOutCome
				+ "*******************************");

		int e_no_first = srvdao.selectNoOneEmployee(map);
		map.put("e_no_first", e_no_first);
		System.out.println(
				"*********************별점,매출,위치 기준 1순위 select 완료" + e_no_first + "*******************************");
		System.out.println("////o/////O////o/////O//////o//////O////o//////");
		////////////////////////////////////////////////////////////////////////////////////////////


		if(registeredMember == null) {
				
			System.out.println("***********************서비스:뉴멤버 정기성 insert메서드실행전*******************************");
			srvdao.insertScdToNewMember(map);	
		}else {
		
			map.put("m_no", registeredMember.getM_no());
			System.out.println("***********************서비스:기존멤버 정기성 insert메서드실행전 *******************************");		
			srvdao.insertScdToRegisteredMember(map);
			
		}	
		
		////////////////////////////////////////////창대////////////////////////////////////////////////
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
	      ////////////////////////////////////////////////////////////////////////////////////////////
		
	}
	

	
	
	
}
