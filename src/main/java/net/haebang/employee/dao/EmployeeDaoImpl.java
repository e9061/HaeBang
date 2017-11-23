package net.haebang.employee.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.MapVo;
import net.haebang.vo.NoticeBoardVo;


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
	


	// -------------------------------------- 진화 ------------------------------------------
	@Override
	public EmployeeVo selectById(EmployeeVo employeeVo) {	
		
		EmployeeVo employeevo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.login", employeeVo);
		
		
		return employeevo;
	}
	
	@Override
	public List<MapVo> selectAllmap(EmployeeVo employeeVo) {	
	List<MapVo> maplist = sqlSession.selectList("net.haebang.employee.dao.EmployeeDao.selectAllmap", employeeVo); 
	
	return maplist;
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
	

}

