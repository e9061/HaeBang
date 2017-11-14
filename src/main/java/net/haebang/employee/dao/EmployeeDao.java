package net.haebang.employee.dao;

import java.util.List;

import net.haebang.vo.EmployeeVo;
import net.haebang.vo.MapVo;

public interface EmployeeDao {

	EmployeeVo selectById(EmployeeVo employeeVo);
	List<MapVo> selectAllmap(EmployeeVo employeeVo);
}
