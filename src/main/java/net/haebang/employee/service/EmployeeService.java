package net.haebang.employee.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.haebang.vo.CompanyVo;
import net.haebang.vo.EmployeeVo;
import net.haebang.vo.JoinEmployeeVo;
import net.haebang.vo.MapVo;
import net.haebang.vo.NoticeBoardVo;

public interface EmployeeService {

	//service에 있을 메소드와 있을 필요없는 메소드 구분하기 !
	/********************************노 창 대 **************************************************************/
	void registerEmployeeAnd(JoinEmployeeVo joinEmployeeVo, MultipartHttpServletRequest request);
	void registerEmployee(JoinEmployeeVo joinEmployeeVo, MultipartHttpServletRequest request);
	void updateEoC(HttpServletRequest request, EmployeeVo userVo);
	void updateBizNo(CompanyVo companyVo, MultipartHttpServletRequest request);
	void updateEmpPicture(EmployeeVo employeeVo, MultipartHttpServletRequest request);




	/********************************박 진 화**************************************************************/

	void modifyEmployee(EmployeeVo employee);
	EmployeeVo authenticate(EmployeeVo employeeVo);
	List<NoticeBoardVo> getMainnoticelist();
	EmployeeVo getIdByPhone(String name, String phone);
	EmployeeVo getIdByBizNo(String name, String companyName, String bizNo);
	EmployeeVo getIdbyId(EmployeeVo employeeVo);
	void changePassword(EmployeeVo employeeVo);
	
	/********************************공지사항**************************************************************/
	List<NoticeBoardVo> getNoticeList(String n_type, int page, String word, String searchCondition);
	int getLastPage(String n_type, String word, String searchCondition);
	NoticeBoardVo getNoticeBoardByNo(NoticeBoardVo noticeBoardVo);
	/********************************공지사항**************************************************************/

}

