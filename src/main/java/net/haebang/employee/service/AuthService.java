package net.haebang.employee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.haebang.employee.dao.EmployeeDao;
import net.haebang.exception.IdPasswordNotMatchingException;
import net.haebang.vo.AuthInfo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.LoginVo;

@Service
public class AuthService {

	@Autowired
	private EmployeeDao employeeDao;
	
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	public AuthInfo authenticate(LoginVo loginVo) {
		System.out.println("authenticate");
		EmployeeVo employeevo = employeeDao.selectById(loginVo);
		System.out.println(employeevo);
		if (employeevo == null) {
			throw new IdPasswordNotMatchingException();
		}
		/*if (!employeevo.matchPassword(loginVo.getPassword())) {
			throw new IdPasswordNotMatchingException();
		}*/
		return new AuthInfo(employeevo.getE_id(), employeevo.getE_type());
	}
}

