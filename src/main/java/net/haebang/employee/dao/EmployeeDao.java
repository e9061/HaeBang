package net.haebang.employee.dao;

import java.util.List;
import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.MapVo;

public interface EmployeeDao {

	//진화
        EmployeeVo selectById(EmployeeVo employeeVo);
        List<MapVo> selectAllmap(EmployeeVo employeeVo);
	
	 
	 // 창대
	EmployeeVo selectById(String e_id);
	CompanyVo selectBybizNo(String c_bizNo);
	CompanyVo selectByCode(String c_code);
	void insertEmployeeAnd(JoinEmployeeVo joinEmployeeVo);
	void insertEmployee(JoinEmployeeVo joinEmployeeVo);
	void insertCompany(JoinEmployeeVo joinEmployeeVo);
}
