package net.haebang.employee.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.MapVo;
import net.haebang.vo.noticeBoardVo;


@Repository
public class EmployeeDaoImpl implements EmployeeDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;	
	

	// 창대
	@Override
	public CompanyVo selectBybizNo(String c_bizNo) {
		CompanyVo companyVo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectBybizNo", c_bizNo);
		return companyVo;
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
	public void insertEmployee(JoinEmployeeVo joinEmployeeVo) {
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertEmployee", joinEmployeeVo);
	}


	// 진화
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
	@Override
	public List<noticeBoardVo> getnoticelist(Map<String, Object> map) {
		
		return sqlSession.selectList("net.haebang.employee.dao.EmployeeDao.selectnoticeList", map);
		
	}
	
	@Override
	public int selectTotalCount(Map<String, Object> map) {
		return sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectTotalCount", map);
	}
	@Override
	public noticeBoardVo getnoticeBoardByNo(int no) {
		
		return sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectnoticeDetail", no);
	}
	
	**************************************************************************************************/
	@Override
	public List<noticeBoardVo> getMainnoticelist() {
		List<noticeBoardVo> mainNoticelist = sqlSession.selectList("net.haebang.employee.dao.EmployeeDao.selectmainnoticelist"); 
		System.out.println(mainNoticelist);
		return mainNoticelist;
	}

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

