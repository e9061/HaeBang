package net.haebang.employee.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;

public interface EmployeeService {

	//service에 있을 메소드와 있을 필요없는 메소드 구분하기 !
	void registerEmployee(JoinEmployeeVo joinEmployeeVo, MultipartHttpServletRequest request);
	void modifyEmployee(EmployeeVo employee);
	
	
}

