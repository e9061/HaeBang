package net.haebang.employee.service;

<<<<<<< HEAD
import java.util.List;

import net.haebang.vo.EmployeeVo;
import net.haebang.vo.MapVo;
=======
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
>>>>>>> 37a0fd44336ef7f0d9fa90cc45c1bb9a48984247

public interface EmployeeService {

	//service에 있을 메소드와 있을 필요없는 메소드 구분하기 !
	void registerEmployee(JoinEmployeeVo joinEmployeeVo, MultipartHttpServletRequest request);
	void modifyEmployee(EmployeeVo employee);
	EmployeeVo authenticate(EmployeeVo employeeVo);
	List<MapVo> selectAllmap(EmployeeVo employeeVo);


}

