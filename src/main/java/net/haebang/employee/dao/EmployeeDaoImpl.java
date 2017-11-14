package net.haebang.employee.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.LoginVo;

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
	public EmployeeVo selectById(LoginVo loginVo) {
		System.out.println("selectById");
		System.out.println(loginVo);
		EmployeeVo employeeVo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.login", loginVo);
		
		
		return employeeVo;
	}

	

}

