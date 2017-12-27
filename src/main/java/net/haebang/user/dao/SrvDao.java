package net.haebang.user.dao;

import java.util.List;
import java.util.Map;

import net.haebang.vo.MemberVo;
import net.haebang.vo.ServiceVo;

public interface SrvDao {
	
	// 답변에 대한 서비스 표시
	public List<ServiceVo> selectList(String con1, String con2, String con3);
	
	MemberVo selectUserByInfo(Map<String, Object> map);

	void insertScdToNewMemberOnetime(Map<String, Object> map);


	void insertScdToRegisteredMemberOnetime(Map<String, Object> map);


	void insertScdToNewMember(Map<String, Object> map);


	void insertScdToRegisteredMember(Map<String, Object> map);

	//***************************창대 작성*************************************************
	int selectNoOneEmployee(Map<String, Object> map);

	int selectPrevMonthOutCome();

	void createEvent(Map<String, Object> map);

	List<Integer> selectMoNoByOrderNo(Map<String, Object> map);

	void updateENoFirstbyMoNo(Map<String, Object> map);
	
	//***********************************************************************************



}
