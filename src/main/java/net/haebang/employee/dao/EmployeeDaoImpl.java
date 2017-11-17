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
	public CompanyVo selectByCode(String c_code) {
		CompanyVo companyVo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.selectByCode", c_code);
		return companyVo;
	}
	
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
	public void insertEmployeeAnd(JoinEmployeeVo joinEmployeeVo) {
		sqlSession.insert("net.haebang.employee.dao.EmployeeDao.insertEmployeeAnd", joinEmployeeVo);
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

	

}

