package net.haebang.employee.dao;

import org.mybatis.spring.SqlSessionTemplate;

import net.haebang.vo.EmployeeVo;
import net.haebang.vo.LoginVo;

public class EmployeeDaoImpl implements EmployeeDao{
	
	private SqlSessionTemplate sqlSession;	
	
	@Override
	public EmployeeVo selectById(LoginVo loginVo) {
		EmployeeVo employeeVo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.login", loginVo);
		return employeeVo;
	}

}

