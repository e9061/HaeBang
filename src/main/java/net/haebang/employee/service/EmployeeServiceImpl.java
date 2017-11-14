package net.haebang.employee.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import net.haebang.employee.dao.EmployeeDao;
import net.haebang.exception.IdPasswordNotMatchingException;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.MapVo;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	
	@Autowired
	private EmployeeDao employeeDao;
	
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}	

	
	public void insertEmployee(EmployeeVo emp) {

			
	}

	public void modifyEmployee(EmployeeVo employee) {

	}

	
	public EmployeeVo authenticate(EmployeeVo employeeVo) {
		System.out.println("authenticate");
		EmployeeVo employeevo = employeeDao.selectById(employeeVo);
		System.out.println(employeeVo);
		if (employeeVo == null) {
			throw new IdPasswordNotMatchingException();
		}
		
		return employeevo;
	}
	

	public List<MapVo> selectAllmap(EmployeeVo employeeVo) {
		List<MapVo> maplist = employeeDao.selectAllmap(employeeVo);
		return maplist;
	}

}

