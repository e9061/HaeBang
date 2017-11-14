package net.haebang.employee.dao;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.LoginVo;

public interface EmployeeDao {

	// 진화
	 EmployeeVo selectById(LoginVo loginVo);
	
	 
	 // 창대
	 EmployeeVo selectById(String e_id);
	 CompanyVo selectBybizNo(String c_bizNo);
	 
	 void insertEmployee(JoinEmployeeVo joinEmployeeVo);
	 void insertCompany(JoinEmployeeVo joinEmployeeVo);

}
