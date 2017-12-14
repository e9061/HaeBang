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
		
		if(registeredMember == null) {
			System.out.println("***********************서비스:뉴멤버 1회성 insert메서드 실행전*******************************");
			srvdao.insertScdToNewMemberOnetime(map);
		
		
		}else {
		
		map.put("m_no", registeredMember.getM_no());
		System.out.println("***********************서비스:기존멤버 1회성 insert메서드 실행전*******************************");
		
		srvdao.insertScdToRegisteredMemberOnetime(map);
			
		}	
		
	}
	
	
	@Override
	public void insertSchedule(Map<String, Object> map) {
		
		MemberVo registeredMember = srvdao.selectUserByInfo(map);
		System.out.println("***********************서비스:정기성 고객정보select 완료*******************************");
		
		if(registeredMember == null) {
				
			System.out.println("***********************서비스:뉴멤버 정기성 insert메서드실행전*******************************");
			srvdao.insertScdToNewMember(map);	
		}else {
		
			map.put("m_no", registeredMember.getM_no());
			System.out.println("***********************서비스:기존멤버 정기성 insert메서드실행전 *******************************");		
			srvdao.insertScdToRegisteredMember(map);
			
		}	
		
		
	}
	

	
	
	
}
