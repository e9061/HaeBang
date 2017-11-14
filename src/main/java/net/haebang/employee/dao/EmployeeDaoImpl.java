package net.haebang.employee.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import net.haebang.vo.EmployeeVo;
import net.haebang.vo.MapVo;


@Repository
public class EmployeeDaoImpl implements EmployeeDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	@Override
	public EmployeeVo selectById(EmployeeVo employeeVo) {		
		System.out.println(employeeVo);
		EmployeeVo employeevo = sqlSession.selectOne("net.haebang.employee.dao.EmployeeDao.login", employeeVo);
		
		
		return employeevo;
	}
	
	@Override
	public List<MapVo> selectAllmap(EmployeeVo employeeVo) {
		System.out.println(employeeVo);
	List<MapVo> maplist = sqlSession.selectList("net.haebang.employee.dao.EmployeeDao.selectAllmap", employeeVo); 
	System.out.println(maplist.toString());	
	return maplist;
	}

}

