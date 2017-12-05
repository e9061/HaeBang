package net.haebang.employee.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.MemberVo;
import net.haebang.vo.MapVo;
import net.haebang.vo.NoticeBoardVo;
import net.haebang.vo.OrderEmployeeVo;


@Repository
public class EmployeeDaoImpl implements EmployeeDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;	
	

	// ------------------------------------------- 창대 -------------------------------------
	@Override
	public CompanyVo selectByNo(int c_no) {
		CompanyVo companyVo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectByNo", c_no);
		return companyVo;
	}
	
	@Override
	public List<EmployeeVo> selectByCNo(int c_no) {
		
		List<EmployeeVo> employeeVoList = sqlSession.selectList("net.haebang.employee.dao.EmployeeDao.selectByCNo", c_no);
		return employeeVoList;
		
	}
	
	
	
	
	
	
	@Override
	public CompanyVo selectByCode(String c_code) {
		CompanyVo companyVo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectByCode", c_code);
		return companyVo;
	}
	
	@Override
	public CompanyVo selectByBizNo1(String c_bizNo) {
		CompanyVo companyVo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectByBizNo1", c_bizNo);
		return companyVo;
	}
	
	@Override
	public CompanyVo selectByBizNo2(CompanyVo companyVo) {
		CompanyVo confirmVo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectByBizNo2", companyVo);
		return confirmVo;
	}
	
	
	
	@Override
	public EmployeeVo selectById(String e_id) {
		EmployeeVo employeeVo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectById", e_id);
		return employeeVo;
	}
	@Override
	public void insertCompany(JoinEmployeeVo joinEmployeeVo) {
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertCompany", joinEmployeeVo);
	}
	@Override
	public void insertEmployeeAnd(JoinEmployeeVo joinEmployeeVo) {
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertEmployeeAnd", joinEmployeeVo);
	}
	@Override
	public void insertEmployee(JoinEmployeeVo joinEmployeeVo) {
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertEmployee", joinEmployeeVo);
	}

	
	@Override
	public void updateEoC(HashMap<String, String> updateMap) {
		sqlSession.update("net.haebang.employee.dao.EmployeeDao.updateEmployeeOr", updateMap);
		
	}
	
	@Override
	public void updateEmployeeCntP(JoinEmployeeVo joinEmployeeVo) {
		sqlSession.update("net.haebang.employee.dao.EmployeeDao.updateEmployeeCntP", joinEmployeeVo);
		
	}
	@Override
	public void updateEmployeeCntM(EmployeeVo employeeVo) {
		sqlSession.update("net.haebang.employee.dao.EmployeeDao.updateEmployeeCntM", employeeVo);
		
	}
	
	
	
	@Override
	public void deleteEmployeeByNo(int e_no) {
		sqlSession.delete("net.haebang.employee.dao.EmployeeDao.deleteEmployeeByNo", e_no);
		
	}
	
	@Override
	public void updateCompanyBizNo(CompanyVo companyVo) {
		sqlSession.update("net.haebang.employee.dao.EmployeeDao.updateCompanyBizNo", companyVo);
		
	}
	
	
	@Override
	public void updateEmpPicture(EmployeeVo employeeVo) {
		sqlSession.update("net.haebang.employee.dao.EmployeeDao.updateEmpPicture", employeeVo);
		
	}
	

	//	------------------------------------ 창대 11/25일 작업  ----------------------------------------------

	@Override
	public void updateCompanyAddress(CompanyVo companyVo) {
		sqlSession.update("net.haebang.employee.dao.EmployeeDao.updateCompanyAddress", companyVo);
		
		
	}
	
	
	//	------------------------------------ 창대 11/25일 작업 종료! ----------------------------------------------
	
	//	------------------------------------ 창대 11/29일 작업(지도 주문관련)  ----------------------------------------------
	@Override
	public List<HashMap<String, Object>> selectAllmap(EmployeeVo employeeVo) {	
		List<HashMap<String, Object>> mapList = sqlSession.selectList("net.haebang.employee.dao.EmployeeDao.selectAllmap", employeeVo); 
	
		return mapList;
	}
	
	@Override
	public void updateEOrderStatus(OrderEmployeeVo orderEmployeeVo) {
		sqlSession.update("net.haebang.employee.dao.EmployeeDao.updateEOrderStatus", orderEmployeeVo);
		
	}
	
	@Override
	public OrderEmployeeVo selectEOrderByMoNo(OrderEmployeeVo orderEmployeeVo) {
		OrderEmployeeVo newOne = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectEOrderByMoNo", orderEmployeeVo); 
		return newOne;
	}
	
	
	//	------------------------------------ 창대 11/29일-30일 작업(지도 주문관련)  ----------------------------------------------

	// -------------------------------------- 진화 ------------------------------------------
	@Override
	public EmployeeVo selectById(EmployeeVo employeeVo) {	
		
		EmployeeVo employeevo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.login", employeeVo);
		
		
		return employeevo;
	}
	
	
	/****************************************************************************************************
	 **************************************************************************************************/

	
	@Override
	public List<NoticeBoardVo> getNoticeList(Map<String, Object> map) {
		System.out.println("impl map : " + map);
		List<NoticeBoardVo> getNoticeList = sqlSession.selectList("net.haebang.employee.dao.EmployeeDao.getNoticeList", map);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!"+getNoticeList+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		return getNoticeList;
	}
	@Override
	public double selectTotalCount(Map<String, Object> map) {
		int totalPage = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectTotalCount",map); 
		return totalPage;
	}
	@Override
	public NoticeBoardVo getNoticeBoardByNo(NoticeBoardVo noticeBoardVo) {
		sqlSession.update("net.haebang.admin.dao.AdminDao.updateViewCnt",noticeBoardVo);
		NoticeBoardVo getNoticeBoardByNo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectOneNDetailByNo",noticeBoardVo);
		return getNoticeBoardByNo;
	}

	@Override
	public List<NoticeBoardVo> getMainnoticelist() {
		List<NoticeBoardVo> mainNoticelist = sqlSession.selectList("net.haebang.employee.dao.EmployeeDao.selectmainnoticelist"); 
		System.out.println(mainNoticelist);
		return mainNoticelist;
	}
	
	
	
/****************************************************************************************************
	**************************************************************************************************/

	@Override
	public EmployeeVo getIdByPhone(Map<String, Object> map) {
		EmployeeVo getIdByPhone = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectIdByPhone", map);
		return getIdByPhone;
	}
	
	@Override
	public EmployeeVo getIdByBizNo(Map<String, Object> map) {
		EmployeeVo getIdByBizNo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectIdByBizNo", map);
		return getIdByBizNo;
	}
	@Override
	public EmployeeVo getIdbyId(EmployeeVo employeeVo) {
		EmployeeVo checkIdbyId = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.getIdbyId", employeeVo);
		return checkIdbyId;
	}
	@Override
	public void changePassword(EmployeeVo employeeVo) {
		sqlSession.update("net.haebang.employee.dao.EmployeeDao.changepassword", employeeVo);		
	}
	
	@Override
	public MemberVo selectUserByInfo(Map<String, Object> map) {
		return sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectUserByInfo", map);
	}
	
	
	
	@Override
	public void insertScdToRegisteredMemberOnetime(Map<String, Object> map) {
		//기존멤버 추가
		//맵의 m_no로 t_m_order에 insert(우다다다)
			System.out.println("**********************dao 1회성 기존멤버 잘들어옴********************************");
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertScdByMNoOnetime", map);
		System.out.println("***********************dao:1회성 맵의 m_no로 t_m_order에 insert 완료*******************************");
		//orderNo로 mo_no 찾기
		Map<String, Object> mo_noMap = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectMoNoByOrderNoOnetime", map);
		//찾은 mo_no를 paramMap에 추가
			System.out.println("***********************dao:1회성 orderNo로 mo_no 찾기완료*******************************");
		Set<String> keys = mo_noMap.keySet();
		for(String key : keys) {
			System.out.println(key + " : "+ mo_noMap.get(key));
			map.put("mo_no", mo_noMap.get(key));
		}		
		//mo_no로 t_e_order에 insert
			System.out.println("***********************dao:1회성 mo_no로 t_e_order에 insert 실행전*******************************");
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertScdByOrderNoOnetime", map);
		
	}

	@Override
	public void insertScdToNewMemberOnetime(Map<String, Object> map) {
		//새멤버 추가
		//t_member에 새멤버 추가
			System.out.println("**********************dao 1회성 새멤버 잘들어옴********************************");
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertScdToNewMember", map);
		//M_no찾기
		MemberVo registeredMember = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectUserByInfo", map);
			System.out.println("**********************dao 1회성 새멤버 Mo_no찾기완료********************************");
		map.put("m_no", registeredMember.getM_no());
		//맵의 m_no로 t_m_order에 insert (고객정보로 select한 테이블에 insert)		
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertScdByMNoOnetime", map);
			System.out.println("***********************dao:1회성 맵의 m_no로 t_m_order에 insert 완료*******************************");
		//orderNo로 mo_no 찾기
		Map<String, Object> mo_noMap = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectMoNoByOrderNoOnetime", map);
		//찾은 mo_no를 paramMap에 추가
			System.out.println("***********************dao:1회성 orderNo로 mo_no 찾기완료*******************************");
		Set<String> keys = mo_noMap.keySet();
			for(String key : keys) {
				System.out.println(key + " : "+ mo_noMap.get(key));
				map.put("mo_no", mo_noMap.get(key));
			}		
		//mo_no로 t_e_order에 insert
			System.out.println("***********************dao:1회성 mo_no로 t_e_order에 insert 실행전*******************************");
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertScdByOrderNoOnetime", map);
			
		
	}	
	

	@Override
	public void insertScdToRegisteredMember(Map<String, Object> map) {
		//기존멤버 추가
		//맵의 m_no로 t_m_order에 insert(우다다다)
			System.out.println("**********************dao 정기성 기존멤버 잘들어옴********************************");
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertScdByMNo", map);
			System.out.println("***********************dao:정기성 맵의 m_no로 t_m_order에 insert 완료*******************************");
		//orderNo로 mo_no 찾기
		List<Map<String, Object>> mo_noList = sqlSession.selectList("net.haebang.employee.dao.EmployeeDao.selectMoNoByOrderNo", map);
			System.out.println("***********************dao:정기성 orderNo로 mo_no 찾기완료*******************************");
		//찾은 mo_no들 paramMap에 추가
		map.put("mo_noList", mo_noList);
		//mo_no로 t_e_order에 insert
			System.out.println("***********************dao:정기성 mo_no로 t_e_order에 insert 실행전*******************************");
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertScdByOrderNo", map);
	}

	@Override
	public void insertScdToNewMember(Map<String, Object> map) {
		//새멤버 추가
		//t_member에 새멤버 추가
			System.out.println("**********************dao 정기성 새멤버 잘들어옴********************************");
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertScdToNewMember", map);			
		//M_no찾기
		MemberVo registeredMember = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectUserByInfo", map);
			System.out.println("**********************dao 정기성 새멤버 Mo_no찾기완료********************************");
			System.out.println(registeredMember.getM_no());
			map.put("m_no", registeredMember.getM_no());
			Set<String> keys = map.keySet();
			for(String key : keys) {
				System.out.println(key + " : "+ map.get(key));				
			}
		//맵의 m_no로 t_m_order에 insert (고객정보로 select한 테이블에 insert)		
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertScdByMNo", map);
			System.out.println("***********************dao:정기성 맵의 m_no로 t_m_order에 insert 완료*******************************");
		//orderNo로 mo_no 찾기		
		List<Map<String, Object>> mo_noList = sqlSession.selectList("net.haebang.employee.dao.EmployeeDao.selectMoNoByOrderNo", map);
			System.out.println("***********************dao:정기성 orderNo로 mo_no 찾기완료*******************************");
		//찾은 mo_no들 paramMap에 추가
		map.put("mo_noList", mo_noList);
		//t_e_order에 mo_no로 insert
			System.out.println("***********************dao:정기성 mo_no로 t_e_order에 insert 실행전*******************************");
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertScdByOrderNo", map);
	}
	

}
