package net.haebang.employee.dao;

import net.haebang.vo.EmployeeVo;
import net.haebang.vo.LoginVo;

public interface EmployeeDao {

	EmployeeVo selectById(LoginVo loginVo);
}
