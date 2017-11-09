package net.haebang.employee.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.haebang.vo.EmployeeVo;
import net.haebang.vo.LoginVo;

@Repository
public class EmployeeDaoImpl implements EmployeeDao{
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	@Override
	public EmployeeVo selectById(LoginVo loginVo) {
		System.out.println("selectById");
		System.out.println(loginVo);
		EmployeeVo employeeVo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.login", loginVo);
		
		
		return employeeVo;
	}

}

