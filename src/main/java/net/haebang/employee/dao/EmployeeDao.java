package net.haebang.employee.dao;

<<<<<<< HEAD
import java.util.List;

import net.haebang.vo.EmployeeVo;
import net.haebang.vo.MapVo;

public interface EmployeeDao {

	EmployeeVo selectById(EmployeeVo employeeVo);
	List<MapVo> selectAllmap(EmployeeVo employeeVo);
=======
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

>>>>>>> 37a0fd44336ef7f0d9fa90cc45c1bb9a48984247
}
