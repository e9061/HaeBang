package net.haebang.employee.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.MapVo;
import net.haebang.vo.noticeBoardVo;

public interface EmployeeService {

	//service에 있을 메소드와 있을 필요없는 메소드 구분하기 !
	void registerEmployee(JoinEmployeeVo joinEmployeeVo, MultipartHttpServletRequest request);
	void modifyEmployee(EmployeeVo employee);
	EmployeeVo authenticate(EmployeeVo employeeVo);
	List<MapVo> selectAllmap(EmployeeVo employeeVo);
	/**********************************************************************************
	List<noticeBoardVo> getnoticelist(int page, String word, String searchCondition);
	int getlastpage(String word, String searchCondition);
	noticeBoardVo getnoticeBoardByNo(int no);
	**************************************************************************************/
	List<noticeBoardVo> getMainnoticelist();
	EmployeeVo getIdByPhone(String name, String phone);
	EmployeeVo getIdByBizNo(String name, String companyName, String bizNo);
	EmployeeVo getIdbyId(EmployeeVo employeeVo);
	void changePassword(EmployeeVo employeeVo);

}

