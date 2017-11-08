package net.haebang.employee.service;

import net.haebang.employee.dao.EmployeeDao;
import net.haebang.exception.IdPasswordNotMatchingException;
import net.haebang.vo.AuthInfo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.LoginVo;

public class AuthService {

	private EmployeeDao employeeDao;
	
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	public AuthInfo authenticate(LoginVo loginVo) {
		EmployeeVo employeevo = employeeDao.selectById(loginVo);
		if (employeevo == null) {
			throw new IdPasswordNotMatchingException();
		}
		if (!employeevo.matchPassword(loginVo.getPassword())) {
			throw new IdPasswordNotMatchingException();
		}
		return new AuthInfo(employeevo.getE_id(), employeevo.getE_type());
	}
}

