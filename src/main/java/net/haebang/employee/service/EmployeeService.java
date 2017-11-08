package net.haebang.employee.service;

import net.haebang.vo.EmployeeVo;

public interface EmployeeService {

	//service에 있을 메소드와 있을 필요없는 메소드 구분하기 !
	void insertEmployee(EmployeeVo employee);
	void modifyEmployee(EmployeeVo employee);
	
	
}

