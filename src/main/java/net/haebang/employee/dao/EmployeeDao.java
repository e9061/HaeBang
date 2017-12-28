package net.haebang.employee.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.MemberVo;
import net.haebang.vo.NoticeBoardVo;
import net.haebang.vo.OrderEmployeeVo;

public interface EmployeeDao {

   //진화
    
/*************************공지*******************************************/
        EmployeeVo selectById(EmployeeVo employeeVo);        
        EmployeeVo getIdByPhone(Map<String, Object> map);
        EmployeeVo getIdByBizNo(Map<String, Object> map);
        EmployeeVo getIdbyId(EmployeeVo employeeVo);
        void changePassword(EmployeeVo employeeVo);
        MemberVo selectUserByInfo(Map<String, Object> map);
        void insertScdToRegisteredMember(Map<String, Object> map);
        void insertScdToNewMember(Map<String, Object> map);
        void insertScdToRegisteredMemberOnetime(Map<String, Object> map);
        void insertScdToNewMemberOnetime(Map<String, Object> map);
        
    /*************************공지*******************************************/
        List<NoticeBoardVo> getNoticeList(Map<String, Object> map);
        double selectTotalCount(Map<String, Object> map);
        NoticeBoardVo getNoticeBoardByNo(NoticeBoardVo noticeBoardVo);
        List<NoticeBoardVo> getMainnoticelist();
   /**********************************************************************/
 
 // -------------------------------------- 창대 ----------------------------------------
    EmployeeVo selectById(String e_id);
	CompanyVo selectByBizNo1(String c_bizNo);
	CompanyVo selectByCode(String c_code);
	CompanyVo selectByNo(int c_no);
	List<EmployeeVo> selectByCNo(int c_no);
	
	void insertEmployeeAnd(JoinEmployeeVo joinEmployeeVo);
	void insertEmployee(JoinEmployeeVo joinEmployeeVo);
	void insertCompany(JoinEmployeeVo joinEmployeeVo);
	
	void updateEoC(HashMap<String,String> updateMap);
	void updateEmployeeCntP(JoinEmployeeVo joinEmployeeVo);   // 증가 플러스
	void updateEmployeeCntM(EmployeeVo employeeVo);	// 감소 마이너스
	void deleteEmployeeByNo(int e_no);
	CompanyVo selectByBizNo2(CompanyVo companyVo);
	void updateCompanyBizNo(CompanyVo companyVo);
	void updateEmpPicture(EmployeeVo employeeVo);
//	------------------------------------ 창대 11/25일 작업  ----------------------------------------------
	void updateCompanyAddress(CompanyVo companyVo);
	
//	------------------------------------ 창대 11/25일 작업 종료! ----------------------------------------------
	
//	------------------------------------ 창대 11/29일 작업(지도 주문관련)  ----------------------------------------------
	List<HashMap<String, Object>> selectAllmap(List<EmployeeVo> list);
	void updateEOrderStatus(OrderEmployeeVo orderEmployeeVo);
	OrderEmployeeVo selectEOrderByMoNo(OrderEmployeeVo orderEmployeeVo);


//	------------------------------------ 창대 12/15,16,17일 작업(콜 관련 정보)  ----------------------------------------------
	List<HashMap<String, Object>> selectMyCall(EmployeeVo userVo);


	void dropEvent(HashMap<String, Object> map);


	void updateCallFlag(HashMap<String, Object> map);

	List<HashMap<String, Object>> selectMoNoByOrderNo(HashMap<String, Object> map);


	void insertEOrder(HashMap<String, Object> map);


	void deleteCancelCallByMoNo(HashMap<String, Object> map);


	void insertCancelCall(HashMap<String, Object> map);


	void updateMOrderENoFirst(HashMap<String, Object> map);


	void reCreateEvent(HashMap<String, Object> map);


	List<HashMap<String, Object>> selectAllStartTimes(String mo_orderNo);

	List<HashMap<String, Object>> selectNoOneEmployeeValidation(HashMap<String, Object> map);



/***************************************스케쥴************************************************/
	
	List<HashMap<String, Object>> getScheduleList(int c_no);
	HashMap<String, Object> getScheduleByMONo(int mo_no);
	void deleteSchedule(int mo_no);
	
	String getMtypebyMONo(int mo_no);
	HashMap<String, Object> getScheduleByMONoByHB(int mo_no);
	List<HashMap<String, Object>> getmyScheduleList(Map<String, Object> map);

	
	HashMap<String, Object> getScheduleByOdNo(int mo_no);
	HashMap<String, Object> getScheduleByOdNoTypeN(int mo_no);
	List<HashMap<String, Object>> getEmployeeList(int e_no);
	
	void updateNoHaebangSch(HashMap<String, Object> map);
	void updateHaebangSch(HashMap<String, Object> map);

/********************************************************************************************/

	// 주호 mono 로 회원정보 가져오기(t_member, t_m_order, t_e_order, t_employee, t_service)
	Map<String, Object> getMemberInfoByMono(int mo_no);
	
	void statusUpdate(Map<String, Object> map);
	Map<String, Object> statusUpdateResult(Map<String, Object> map);
	
	
	
	
}
